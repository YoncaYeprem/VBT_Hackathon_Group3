part of 'google_map_cubit.dart';

@immutable
abstract class GoogleMapState {}

class GoogleMapInitial extends GoogleMapState {}

class ChangeMapTypeState extends GoogleMapState {}

class AddMarkerState extends GoogleMapState {}
