import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

part 'google_map_state.dart';

class GoogleMapCubit extends Cubit<GoogleMapState> {
  GoogleMapCubit() : super(GoogleMapInitial());

  Completer<GoogleMapController> controller = Completer();
  bool isHybrid = true;

  final defaultCameraPos = const CameraPosition(
    target: LatLng(41.015137, 28.979530),
    zoom: 14.4746,
  );
  final CameraPosition kLake = const CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  Future<void> goToTheLake() async {
    final GoogleMapController tempController = await controller.future;
    tempController
        .animateCamera(CameraUpdate.newCameraPosition(defaultCameraPos));
  }

  MapType get getMapType => isHybrid ? MapType.hybrid : MapType.normal;
  changeMapType() {
    isHybrid = !isHybrid;
    emit(ChangeMapTypeState());

    if (isHybrid) {
      emit(ChangeMapTypeState());

      return MapType.hybrid;
    } else {
      emit(ChangeMapTypeState());

      return MapType.satellite;
    }
  }
}
