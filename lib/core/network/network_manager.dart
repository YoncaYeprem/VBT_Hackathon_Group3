import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
  Future<BaseModel?> getAllPlaces(BuildContext context);
}

class SearchNetworkMaps extends ISearchNetworkMaps {
  SearchNetworkMaps(Dio dio) : super(dio);

  @override
  Future<BaseModel?> getAllPlaces(BuildContext context) async {
    final response = await dio.get(
        "nearbysearch/json?keyword=library&location=-33.8670522%2C151.1957362&radius=1500&type=library&key=AIzaSyCARKG3wS6Eg2fFqT2zuEZ-WY8de6fftPs");
    if (response.statusCode == 200) {
      return BaseModel.fromJson(response.data);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Failed")));
    }
  }
}
