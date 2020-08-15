import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/plugins/bouncy/bouncy.dart';
import '../../../../core/plugins/iconx/icons_x_icons.dart';
import '../../../../core/plugins/pulsating_container/pulsating_container.dart';
import '../../../domain/entities/risk_area.dart';
import '../../cubits/location/location_cubit.dart';
import '../../cubits/risk_area/risk_area_cubit.dart';

class TrackerPage extends StatefulWidget {
  final VoidCallback onInfoPress;

  const TrackerPage({Key key, this.onInfoPress}) : super(key: key);
  @override
  _TrackerPageState createState() => _TrackerPageState();
}

class _TrackerPageState extends State<TrackerPage> {
  Marker userMarker;
  Circle userCircle;
  Set<Marker> markers = {};
  Set<Circle> circles = {};
  GoogleMapController _googleMapController;
  Uint8List virusImg, userImg;
  CameraPosition initialCamLoc;

  @override
  void initState() {
    super.initState();
    getImages();
    initialCamLoc = const CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962),
      zoom: 14.4746,
    );
  }

  void getImages() async {
    virusImg = await getHotspotMarker();
    userImg = await getMarker();
  }

  Future<Uint8List> getMarker() async {
    ByteData byteData =
        await DefaultAssetBundle.of(context).load('assets/images/userImg.png');
    return byteData.buffer.asUint8List();
  }

  Future<Uint8List> getHotspotMarker() async {
    ByteData byteData =
        await DefaultAssetBundle.of(context).load('assets/images/virus.png');
    return byteData.buffer.asUint8List();
  }

  void updateInitialCameraPosition(Position position) async {
    updateMarkerAndCircle(position, userImg);
    if (_googleMapController != null) {
      await _googleMapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            bearing: 192.8334901395799,
            target: LatLng(position.latitude, position.longitude),
            tilt: 0,
            zoom: 18.00,
          ),
        ),
      );
    }
  }

  void updateMarkerAndCircle(Position newPosition, Uint8List imageData) {
    LatLng latlng = LatLng(newPosition.latitude, newPosition.longitude);
    this.setState(() {
      userMarker = Marker(
          markerId: MarkerId('user'),
          position: latlng,
          rotation: newPosition.heading,
          draggable: false,
          zIndex: 2,
          flat: true,
          anchor: const Offset(0.5, 0.5),
          icon: BitmapDescriptor.fromBytes(imageData));
      userCircle = Circle(
          circleId: CircleId('user'),
          radius: 12,
          zIndex: 1,
          strokeColor: const Color(0xff273c75),
          strokeWidth: 2,
          center: latlng,
          fillColor: const Color(0xff273c75).withAlpha(70));
      markers.add(userMarker);
      circles.add(userCircle);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => context.bloc<RiskAreaCubit>()..fetchRiskAreas(),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20),
            decoration: const BoxDecoration(
              color: Color(0xff273c75),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 18, 12, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'MYSO.IO',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'BJohn',
                          fontSize: 22,
                        ),
                      ),
                      Row(
                        children: [
                          // Bouncy(
                          //   duration: const Duration(milliseconds: 100),
                          //   onPressed: () {},
                          //   child: Icon(
                          //     IconsX.comment_inv,
                          //     color: Colors.white.withOpacity(0.5),
                          //   ),
                          // ),
                          const SizedBox(width: 25),
                          Bouncy(
                            duration: const Duration(milliseconds: 100),
                            onPressed: () {},
                            child: Icon(
                              IconsX.info,
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<RiskAreaCubit, RiskAreaState>(
              builder: (context, state) {
                return state.map(
                  initial: (_) => _buildInitialAndLoading(),
                  loading: (_) => _buildInitialAndLoading(),
                  loaded: (loaded) => _buildProvider(loaded.riskAreas),
                  error: (error) => _buildError(error.message),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  BlocProvider _buildProvider(List<RiskArea> riskAreas) {
    for (int i = 0; i < riskAreas.length; i++) {
      LatLng latlng = LatLng(riskAreas[i].lat, riskAreas[i].lng);
      Marker resMark = Marker(
        markerId: MarkerId(riskAreas[i].placeCode),
        position: latlng,
        draggable: false,
        zIndex: 2,
        flat: true,
        anchor: const Offset(0.5, 0.5),
        icon: BitmapDescriptor.fromBytes(virusImg),
      );
      Circle resCircle = Circle(
        circleId: CircleId(riskAreas[i].placeCode),
        radius: riskAreas[i].rad.toDouble(),
        zIndex: 1,
        strokeWidth: 4,
        strokeColor: colorMapper(riskAreas[i].riskAssesment),
        center: latlng,
        fillColor: colorMapper(riskAreas[i].riskAssesment).withOpacity(0.5),
      );
      markers.add(resMark);
      circles.add(resCircle);
    }

    return BlocProvider(
      create: (context) => context.bloc<LocationCubit>()..getDeviceLocation(),
      child: BlocListener<LocationCubit, LocationState>(
        listener: (context, state) {
          state.map(
            initial: (_) {},
            loading: (_) {},
            error: (_) {},
            permissionDenied: (_) {},
            loaded: (data) => updateMarkerAndCircle(data.position, userImg),
            loadLocation: (data) => updateInitialCameraPosition(data.position),
          );
        },
        child: Stack(
          children: [
            GoogleMap(
              trafficEnabled: true,
              zoomControlsEnabled: false,
              mapType: MapType.normal,
              initialCameraPosition: initialCamLoc,
              markers: markers ?? {},
              circles: circles ?? {},
              onMapCreated: (controller) {
                _googleMapController = controller;
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Bouncy(
                  duration: const Duration(milliseconds: 100),
                  onPressed: () {
                    context.bloc<LocationCubit>()
                      ..getLocationData()
                      ..getDeviceLocation();
                  },
                  child: const PulsatingContainer(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    duration: Duration(seconds: 3),
                    color: Color(0xff273c75),
                    pulseColor: Color(0xff273c75),
                    child: Text(
                      'Calibrate Location',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Bouncy(
                  duration: const Duration(milliseconds: 100),
                  onPressed: () {},
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Text(
                      'Need help?',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildError(String error) {
    return Container(
      padding: const EdgeInsets.all(30),
      color: const Color(0xff273c75),
      child: Column(
        children: [
          Text(
            'Something went wrong: $error',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontFamily: 'SJoe',
            ),
          ),
        ],
      ),
    );
  }

  Center _buildInitialAndLoading() {
    return const Center(
        child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Color(0xff273c75)),
    ));
  }

  Color colorMapper(String riskCode) {
    switch (riskCode) {
      case 'VH':
        return Colors.red[400];
      case 'H':
        return Colors.red[300];
      case 'HC':
        return Colors.red[200];
      case 'M':
        return Colors.orange[200];
        break;
      default:
        return Colors.green[300];
    }
  }
}
