import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:vbt_hackathon_group3/core/network/network_manager.dart';
import 'package:vbt_hackathon_group3/feature/google_map/funcs/location_data_funcs.dart';

import '../model/nearbys_model.dart';

part 'google_map_state.dart';

class GoogleMapCubit extends Cubit<GoogleMapState> {
  GoogleMapCubit(this.searchNetworkMaps, this.context)
      : super(GoogleMapInitial()) {
    getCurrentLocation(context);
  }

  Completer<GoogleMapController> controller = Completer();
  bool isHybrid = false;
  BaseModel? nearbyModel;
  ISearchNetworkMaps searchNetworkMaps;
  LocationData? currentLocation;
  BuildContext context;
  Set<Marker> getMarkers = {};
  List<Marker> markers = <Marker>[];

  final defaultCameraPos = const CameraPosition(
    target: LatLng(41.015137, 28.979530),
    zoom: 10,
  );

  MapType get getMapType => isHybrid ? MapType.hybrid : MapType.normal;
  changeMapType() {
    isHybrid = !isHybrid;
    if (isHybrid) {
      emit(ChangeMapTypeState());
      return MapType.hybrid;
    } else {
      emit(ChangeMapTypeState());
      return MapType.satellite;
    }
  }

  void createMarker(LatLng latlng) {
    getMarkers
        .add(Marker(markerId: const MarkerId("new marker"), position: latlng));
    emit(AddMarkerState());
  }

  Future<void> getCurrentLocation(BuildContext context) async {
    currentLocation = await LocDataFuncs().returnLocationData(context);
    emit(GetCurrentLocState());
    final GoogleMapController _controller = await controller.future;
    if (currentLocation != null) {
      _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          zoom: 12,
          target: LatLng(currentLocation?.latitude ?? 41.015137,
              currentLocation?.longitude ?? 28.979530))));
      createMarker(
          LatLng(currentLocation!.latitude!, currentLocation!.longitude!));
      emit(GetCurrentLocState());
    }
  }
}
