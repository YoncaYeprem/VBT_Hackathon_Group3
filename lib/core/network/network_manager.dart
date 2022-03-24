import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:vbt_hackathon_group3/feature/google_map/model/nearbys_model.dart';

class NetworkManager {
  static NetworkManager? _instace;
  static NetworkManager get instance {
    _instace ??= NetworkManager._init();
    return _instace!;
  }

  late final Dio dio;
  NetworkManager._init() {
    dio = Dio(BaseOptions(
      baseUrl: "https://maps.googleapis.com/maps/api/place/",
    ));
  }
}

abstract class ISearchNetworkMaps {
  final Dio dio;

  ISearchNetworkMaps(this.dio);
  Future<BaseNearestPlaceModel?> getAllPlaces(
      BuildContext context, LocationData? locationData);
  Future<List<BaseNearestPlaceModel>?> getAsListAllNearPlaces(
      LocationData? locationData);
}

class SearchNetworkMaps extends ISearchNetworkMaps {
  SearchNetworkMaps(Dio dio) : super(dio);

  @override
  Future<BaseNearestPlaceModel?> getAllPlaces(
      BuildContext context, LocationData? locationData) async {
    final response = await dio.get(
        "nearbysearch/json?keyword=library&location=${locationData?.latitude},${locationData?.longitude}&radius=1500&type=library&key=AIzaSyCARKG3wS6Eg2fFqT2zuEZ-WY8de6fftPs");

    if (response.statusCode == 200) {
      return BaseNearestPlaceModel.fromJson(response.data);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Failed")));
    }
  }

  @override
  Future<List<BaseNearestPlaceModel>?> getAsListAllNearPlaces(
      LocationData? locationData) {
    // TODO: implement getAsListAllNearPlaces
    throw UnimplementedError();
  }

  // @override
  // Future<List<BaseNearestPlaceModel>?> getAsListAllNearPlaces(
  //     LocationData? locationData) async {
  //   final response = await dio.get(
  //       "nearbysearch/json?keyword=library&location=${locationData?.latitude},${locationData?.longitude}&radius=1500&type=library&key=AIzaSyCARKG3wS6Eg2fFqT2zuEZ-WY8de6fftPs");
  //   if (response.statusCode == 200) {
  //     BaseNearestPlaceModel base = BaseNearestPlaceModel.fromJson(response.data);
  //     List<PlacesNearbySearchResponseModel> list = [];
  //     base.results?.forEach((element) {
  //       PlacesNearbySearchResponseModel temp =
  //           PlacesNearbySearchResponseModel.fromJson(element);
  //       list.add(temp);
  //     });
  //   }
  //   return null;
  // }
}
