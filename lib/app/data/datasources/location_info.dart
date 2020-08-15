import 'dart:async';

import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';

import '../../../core/errors/exceptions.dart';

abstract class LocationInfo {
  Future<Position> getDevicePosition();
  Future<Coordinates> getCoordinatesFromPosition(Position position);
  Future<String> getCountryNameLocalle();
  Stream<Position> locationStream();
}

class LocationInfoImpl implements LocationInfo {
  final Geolocator _geolocator;

  LocationInfoImpl(this._geolocator);

  @override
  Future<Coordinates> getCoordinatesFromPosition(Position position) async =>
      Coordinates(position.latitude, position.longitude);

  @override
  Future<String> getCountryNameLocalle() async {
    List<Address> addresses = await Geocoder.local.findAddressesFromCoordinates(
        await getCoordinatesFromPosition(await getDevicePosition()));
    Address firstBestAddress = addresses.first;
    return firstBestAddress.countryName;
  }

  @override
  Future<Position> getDevicePosition() async {
    final position = await _geolocator.getLastKnownPosition();
    if (position != null) {
      return position;
    }
    return await _geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  @override
  Stream<Position> locationStream() {
    StreamController<Position> _locationStreamController =
        StreamController<Position>.broadcast();

    _geolocator.getPositionStream().listen((position) {
      if (position != null) {
        _locationStreamController.add(position);
      } else {
        throw LocationException();
      }
    });
    return _locationStreamController.stream;
  }
}
