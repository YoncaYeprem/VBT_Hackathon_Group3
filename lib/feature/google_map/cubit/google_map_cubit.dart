import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import '../../../core/network/network_manager.dart';
import '../funcs/location_data_funcs.dart';

import '../model/nearbys_model.dart';

part 'google_map_state.dart';

class GoogleMapCubit extends Cubit<GoogleMapState> {
  GoogleMapCubit(this.searchNetworkMaps, this.context)
      : super(GoogleMapInitial()) {
    getCurrentLocation(context);
  }

  Completer<GoogleMapController> controller = Completer();
  bool isHybrid = false;
  BaseNearestPlaceModel? nearbyModel;
  ISearchNetworkMaps searchNetworkMaps;
  LocationData? currentLocation;
  BuildContext context;
  Set<Marker> getMarkers = {};
  final searchController = TextEditingController();
  final searchNode = FocusNode();

//poinst to istanbul
  final defaultCameraPos = const CameraPosition(
    target: LatLng(41.015137, 28.979530),
    zoom: 12,
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

  Future<void> goToSelected(Results? results) async {
    final GoogleMapController _controller = await controller.future;
    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        zoom: 15,
        target: LatLng(results?.geometry?.location?.lat ?? 41.015137,
            results?.geometry?.location?.lng ?? 28.979530))));
    createMarker(LatLng(results?.geometry?.location?.lat ?? 41.015137,
        results?.geometry?.location?.lng ?? 28.979530));
    emit(ChangeCamPosState());
  }

  Future<void> getCurrentLocation(BuildContext context) async {
    currentLocation = await LocDataFuncs().returnLocationData(context);
    emit(GetCurrentLocState());
    final GoogleMapController _controller = await controller.future;
    if (currentLocation != null) {
      _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          zoom: 14,
          target: LatLng(currentLocation?.latitude ?? 41.015137,
              currentLocation?.longitude ?? 28.979530))));
      createMarker(
          LatLng(currentLocation!.latitude!, currentLocation!.longitude!));
      getNearestPlace(currentLocation);
      emit(GetCurrentLocState());
    }
  }

  Future<void> getNearestPlace(LocationData? locationData) async {
    nearbyModel =
        await searchNetworkMaps.getAsListAllNearPlaces(context, locationData);
  }
}