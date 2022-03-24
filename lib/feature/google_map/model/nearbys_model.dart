class BaseNearestPlaceModel {
  List<Results>? results;
  String? status;

  BaseNearestPlaceModel({this.results, this.status});

  BaseNearestPlaceModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    return data;
  }
}

class Results {
  String? businessStatus;
  Geometry? geometry;
  String? icon;
  String? iconBackgroundColor;
  String? iconMaskBaseUri;
  String? name;
  String? placeId;
  PlusCode? plusCode;
  dynamic rating;
  String? reference;
  String? scope;
  List<String>? types;
  int? userRatingsTotal;
  String? vicinity;
  OpeningHours? openingHours;
  List<Photos>? photos;

  Results(
      {this.businessStatus,
      this.geometry,
      this.icon,
      this.iconBackgroundColor,
      this.iconMaskBaseUri,
      this.name,
      this.placeId,
      this.plusCode,
      this.rating,
      this.reference,
      this.scope,
      this.types,
      this.userRatingsTotal,
      this.vicinity,
      this.openingHours,
      this.photos});

  Results.fromJson(Map<String, dynamic> json) {
    businessStatus = json['business_status'];
    geometry =
        json['geometry'] != null ? Geometry.fromJson(json['geometry']) : null;
    icon = json['icon'];
    iconBackgroundColor = json['icon_background_color'];
    iconMaskBaseUri = json['icon_mask_base_uri'];
    name = json['name'];
    placeId = json['place_id'];
    plusCode =
        json['plus_code'] != null ? PlusCode.fromJson(json['plus_code']) : null;
    rating = json['rating'];
    reference = json['reference'];
    scope = json['scope'];
    types = json['types'].cast<String>();
    userRatingsTotal = json['user_ratings_total'];
    vicinity = json['vicinity'];
    openingHours = json['opening_hours'] != null
        ? OpeningHours.fromJson(json['opening_hours'])
        : null;
    if (json['photos'] != null) {
      photos = <Photos>[];
      json['photos'].forEach((v) {
        photos!.add(Photos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['business_status'] = businessStatus;
    if (geometry != null) {
      data['geometry'] = geometry!.toJson();
    }
    data['icon'] = icon;
    data['icon_background_color'] = iconBackgroundColor;
    data['icon_mask_base_uri'] = iconMaskBaseUri;
    data['name'] = name;
    data['place_id'] = placeId;
    if (plusCode != null) {
      data['plus_code'] = plusCode!.toJson();
    }
    data['rating'] = rating;
    data['reference'] = reference;
    data['scope'] = scope;
    data['types'] = types;
    data['user_ratings_total'] = userRatingsTotal;
    data['vicinity'] = vicinity;
    if (openingHours != null) {
      data['opening_hours'] = openingHours!.toJson();
    }
    if (photos != null) {
      data['photos'] = photos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Geometry {
  Location? location;
  Viewport? viewport;

  Geometry({this.location, this.viewport});

  Geometry.fromJson(Map<String, dynamic> json) {
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    viewport =
        json['viewport'] != null ? Viewport.fromJson(json['viewport']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (location != null) {
      data['location'] = location!.toJson();
    }
    if (viewport != null) {
      data['viewport'] = viewport!.toJson();
    }
    return data;
  }
}

class Location {
  double? lat;
  double? lng;

  Location({this.lat, this.lng});

  Location.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['lng'] = lng;
    return data;
  }
}

class Viewport {
  Location? northeast;
  Location? southwest;

  Viewport({this.northeast, this.southwest});

  Viewport.fromJson(Map<String, dynamic> json) {
    northeast =
        json['northeast'] != null ? Location.fromJson(json['northeast']) : null;
    southwest =
        json['southwest'] != null ? Location.fromJson(json['southwest']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (northeast != null) {
      data['northeast'] = northeast!.toJson();
    }
    if (southwest != null) {
      data['southwest'] = southwest!.toJson();
    }
    return data;
  }
}

class PlusCode {
  String? compoundCode;
  String? globalCode;

  PlusCode({this.compoundCode, this.globalCode});

  PlusCode.fromJson(Map<String, dynamic> json) {
    compoundCode = json['compound_code'];
    globalCode = json['global_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['compound_code'] = compoundCode;
    data['global_code'] = globalCode;
    return data;
  }
}

class OpeningHours {
  bool? openNow;

  OpeningHours({this.openNow});

  OpeningHours.fromJson(Map<String, dynamic> json) {
    openNow = json['open_now'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['open_now'] = openNow;
    return data;
  }
}

class Photos {
  int? height;
  List<String>? htmlAttributions;
  String? photoReference;
  int? width;

  Photos({this.height, this.htmlAttributions, this.photoReference, this.width});

  Photos.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    htmlAttributions = json['html_attributions'].cast<String>();
    photoReference = json['photo_reference'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['height'] = height;
    data['html_attributions'] = htmlAttributions;
    data['photo_reference'] = photoReference;
    data['width'] = width;
    return data;
  }
}

// import 'package:json_annotation/json_annotation.dart';

// part 'nearbys_model.g.dart';

// @JsonSerializable()
// class BaseModel {
//   BaseModel(this.results);
//   List<Map<String, dynamic>>? results;

//   factory BaseModel.fromJson(Map<String, dynamic> json) {
//     return _$BaseModelFromJson(json);
//   }
//   Map<String, dynamic> toJson() {
//     return _$BaseModelToJson(this);
//   }
// }

// @JsonSerializable()
// class PlacesNearbySearchResponseModel {
//   List<String>? html_attributions;
//   List<Place>? results;
//   // PlacesSearchStatus? status;
//   String? error_message;
//   List<String>? info_messages;
//   String? next_page_token;
//   PlacesNearbySearchResponseModel(
//     this.html_attributions,
//     this.results,
//     // this.status,
//     this.error_message,
//     this.info_messages,
//     this.next_page_token,
//   );
//   // factory NearbyPlacesModel.fromJson(Map<String, dynamic> json) {
//   //   // return _$NearbyPlacesModelFromJson(json);
//   // }
//   // Map<String, dynamic> toJson() {
//   //   // return _$NearbyPlacesModelToJson(this);
//   // }

//   Map<String, dynamic> toJson() {
//     return _$PlacesNearbySearchResponseModelToJson(this);
//   }

//   factory PlacesNearbySearchResponseModel.fromJson(Map<String, dynamic> json) {
//     return _$PlacesNearbySearchResponseModelFromJson(json);
//   }
// }

// @JsonSerializable()
// class Place {
//   List<AddressComponent>? address_components;
//   String? adr_address;
//   String? business_status;
//   String? formatted_address;
//   String? formatted_phone_number;
//   Geometry? geometry;
//   String? icon;
//   String? icon_background_color;
//   String? icon_mask_base_uri;
//   String? international_phone_number;
//   String? name;
//   PlaceOpeningHours? opening_hours;
//   bool? permanently_closed;
//   List<PlacePhoto>? photos;
//   String? place_id;
//   PlusCode? plus_code;
//   double? price_level;
//   double? rating;
//   String? reference;
//   List<PlaceReview>? review;
//   String? scope;
//   List<String>? types;
//   String? url;
//   double? user_ratings_total;
//   double? utc_offset;
//   String? vicinity;
//   String? website;
//   Place({
//     this.address_components,
//     this.adr_address,
//     this.business_status,
//     this.formatted_address,
//     this.formatted_phone_number,
//     this.geometry,
//     this.icon,
//     this.icon_background_color,
//     this.icon_mask_base_uri,
//     this.international_phone_number,
//     this.name,
//     this.permanently_closed,
//     this.photos,
//     this.place_id,
//     this.plus_code,
//     this.price_level,
//     this.rating,
//     this.reference,
//     this.review,
//     this.scope,
//     this.types,
//     this.url,
//     this.user_ratings_total,
//     this.utc_offset,
//     this.vicinity,
//     this.website,
//   });
//   Map<String, dynamic> toJson() {
//     return _$PlaceToJson(this);
//   }

//   factory Place.fromJson(Map<String, dynamic> json) {
//     return _$PlaceFromJson(json);
//   }
// }

// @JsonSerializable()
// class PlaceReview {
//   List<String>? author_name;
//   double? rating;
//   String? relative_time_description;
//   double? time;
//   String? author_url;
//   String? language;
//   String? profile_photo_url;
//   String? text;
//   PlaceReview(
//     this.author_name,
//     this.rating,
//     this.relative_time_description,
//     this.time,
//     this.author_url,
//     this.language,
//     this.profile_photo_url,
//     this.text,
//   );
//   Map<String, dynamic> toJson() {
//     return _$PlaceReviewToJson(this);
//   }

//   factory PlaceReview.fromJson(Map<String, dynamic> json) {
//     return _$PlaceReviewFromJson(json);
//   }
// }

// @JsonSerializable()
// class PlusCode {
//   String? global_code;
//   String? compound_code;
//   PlusCode(
//     this.compound_code,
//     this.global_code,
//   );
//   Map<String, dynamic> toJson() {
//     return _$PlusCodeToJson(this);
//   }

//   factory PlusCode.fromJson(Map<String, dynamic> json) {
//     return _$PlusCodeFromJson(json);
//   }
// }

// @JsonSerializable()
// class PlacePhoto {
//   double? height;
//   List<String>? html_attributions;
//   List<String>? photo_reference;
//   double? width;
//   PlacePhoto(
//     this.height,
//     this.html_attributions,
//     this.photo_reference,
//     this.width,
//   );
//   Map<String, dynamic> toJson() {
//     return _$PlacePhotoToJson(this);
//   }

//   factory PlacePhoto.fromJson(Map<String, dynamic> json) {
//     return _$PlacePhotoFromJson(json);
//   }
// }

// @JsonSerializable()
// class PlaceOpeningHours {
//   bool? open_now;
//   List<PlaceOpeningHoursPeriod>? periods;
//   List<String>? weekday_text;
//   PlaceOpeningHours(
//     this.open_now,
//     this.periods,
//     this.weekday_text,
//   );
//   Map<String, dynamic> toJson() {
//     return _$PlaceOpeningHoursToJson(this);
//   }

//   factory PlaceOpeningHours.fromJson(Map<String, dynamic> json) {
//     return _$PlaceOpeningHoursFromJson(json);
//   }
// }

// @JsonSerializable()
// class PlaceOpeningHoursPeriod {
//   PlaceOpeningHoursPeriodDetail? close;
//   PlaceOpeningHoursPeriodDetail? open;
//   PlaceOpeningHoursPeriod(this.close, this.open);
//   Map<String, dynamic> toJson() {
//     return _$PlaceOpeningHoursPeriodToJson(this);
//   }

//   factory PlaceOpeningHoursPeriod.fromJson(Map<String, dynamic> json) {
//     return _$PlaceOpeningHoursPeriodFromJson(json);
//   }
// }

// @JsonSerializable()
// class PlaceOpeningHoursPeriodDetail {
//   double? day;
//   String? time;
//   PlaceOpeningHoursPeriodDetail(
//     this.day,
//     this.time,
//   );
//   Map<String, dynamic> toJson() {
//     return _$PlaceOpeningHoursPeriodDetailToJson(this);
//   }

//   factory PlaceOpeningHoursPeriodDetail.fromJson(Map<String, dynamic> json) {
//     return _$PlaceOpeningHoursPeriodDetailFromJson(json);
//   }
// }

// @JsonSerializable()
// class Geometry {
//   LatLngLiteral? location;
//   Bounds? viewport;
//   Geometry(
//     this.location,
//     this.viewport,
//   );
//   Map<String, dynamic> toJson() {
//     return _$GeometryToJson(this);
//   }

//   factory Geometry.fromJson(Map<String, dynamic> json) {
//     return _$GeometryFromJson(json);
//   }
// }

// @JsonSerializable()
// class Bounds {
//   LatLngLiteral? northeast;
//   LatLngLiteral? southwest;
//   Bounds(
//     this.northeast,
//     this.southwest,
//   );
//   Map<String, dynamic> toJson() {
//     return _$BoundsToJson(this);
//   }

//   factory Bounds.fromJson(Map<String, dynamic> json) {
//     return _$BoundsFromJson(json);
//   }
// }

// @JsonSerializable()
// class LatLngLiteral {
//   double? lat;
//   double? lng;
//   LatLngLiteral(
//     this.lat,
//     this.lng,
//   );
//   Map<String, dynamic> toJson() {
//     return _$LatLngLiteralToJson(this);
//   }

//   factory LatLngLiteral.fromJson(Map<String, dynamic> json) {
//     return _$LatLngLiteralFromJson(json);
//   }
// }

// @JsonSerializable()
// class AddressComponent {
//   String? long_name;
//   String? short_name;
//   List<String>? types;
//   AddressComponent(
//     this.long_name,
//     this.short_name,
//     this.types,
//   );
//   Map<String, dynamic> toJson() {
//     return _$AddressComponentToJson(this);
//   }

//   factory AddressComponent.fromJson(Map<String, dynamic> json) {
//     return _$AddressComponentFromJson(json);
//   }
// }
