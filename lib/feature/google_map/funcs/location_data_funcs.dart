import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:vbt_hackathon_group3/core/init/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class LocDataFuncs {
  Future<LocationData?> returnLocationData(BuildContext context) async {
    Location _location = Location();
    bool _isServiceEnabled;
    PermissionStatus _permissionGranted;
    _isServiceEnabled = await _location.serviceEnabled();
    if (!_isServiceEnabled) {
      _isServiceEnabled = await _location.requestService();
      if (!_isServiceEnabled) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(LocaleKeys.network_failedToLoad.tr())));
      }
    }
    _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(LocaleKeys.network_failedToLoad.tr())));
      }
    }
    LocationData _locationData = await _location.getLocation();
    return _locationData;
  }
}
