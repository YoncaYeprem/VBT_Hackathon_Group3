import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocDataFuncs {
  Future<LocationData?> returnLocationData(BuildContext context) async {
    Location _location = Location();
    bool _isServiceEnabled;
    PermissionStatus _permissionGranted;
    _isServiceEnabled = await _location.serviceEnabled();
    if (!_isServiceEnabled) {
      _isServiceEnabled = await _location.requestService();
      if (!_isServiceEnabled) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("failed")));
      }
    }
    _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("failed")));
      }
    }
    LocationData _locationData = await _location.getLocation();
    return _locationData;
  }
}
