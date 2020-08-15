import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class PermissionInfo {
  Future<bool> get isLocationPermissionGranted;
  Future<bool> get isLocationServiceEnabled;
}

class PermissionInfoImpl implements PermissionInfo {
  final Permission permissionLoc = Permission.location;

  ///Initiates a request to let the app use location service.
  ///returns `true` if the request is granted or already granted,
  ///otherwise return `false` if it is denied or denied forever.
  @override
  Future<bool> get isLocationPermissionGranted async =>
      permissionLoc.request().isGranted;

  ///Initiates a request to enable location services.
  ///returns `true` if the request is granted or already granted,
  ///otherwise return `false` if it is denied or denied forever.
  @override
  Future<bool> get isLocationServiceEnabled async =>
      Geolocator().isLocationServiceEnabled();
}
