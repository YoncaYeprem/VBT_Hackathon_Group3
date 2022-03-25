import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import '../constants/key_storage.dart';
import '../init/lang/locale_keys.g.dart';
import '../../feature/google_map/model/nearbys_model.dart';
import 'package:easy_localization/easy_localization.dart';

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
  Future<BaseNearestPlaceModel?> getAsListAllNearPlaces(
      BuildContext context, LocationData? locationData);
}

class SearchNetworkMaps extends ISearchNetworkMaps {
  SearchNetworkMaps(Dio dio) : super(dio);

  @override
  Future<BaseNearestPlaceModel?> getAsListAllNearPlaces(
      BuildContext context, LocationData? locationData) async {
    final response = await dio.get(
        "nearbysearch/json?keyword=library&location=${locationData?.latitude},${locationData?.longitude}&radius=1500&type=library&key=AIzaSyCARKG3wS6Eg2fFqT2zuEZ-WY8de6fftPs");

    if (response.statusCode == 200) {
      return BaseNearestPlaceModel.fromJson(response.data);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(LocaleKeys.network_failedToLoad.tr())));
    }
  }
}