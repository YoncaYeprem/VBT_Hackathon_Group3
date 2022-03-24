import 'package:json_annotation/json_annotation.dart';

part 'nearbys_model.g.dart';

@JsonSerializable()
class BaseModel {
  BaseModel(this.results);
  List<Map>? results;

  factory BaseModel.fromJson(Map<String, dynamic> json) {
    return _$BaseModelFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$BaseModelToJson(this);
  }
}

@JsonSerializable()
class PlacesNearbySearchResponseModel {
  List<String>? html_attributions;
  List<Place>? results;
  // PlacesSearchStatus? status;
  String? error_message;
  List<String>? info_messages;
  String? next_page_token;
  PlacesNearbySearchResponseModel(
    this.html_attributions,
    this.results,
    // this.status,
    this.error_message,
    this.info_messages,
    this.next_page_token,
  );
  // factory NearbyPlacesModel.fromJson(Map<String, dynamic> json) {
  //   // return _$NearbyPlacesModelFromJson(json);
  // }
  // Map<String, dynamic> toJson() {
  //   // return _$NearbyPlacesModelToJson(this);
  // }

  Map<String, dynamic> toJson() {
    return _$PlacesNearbySearchResponseModelToJson(this);
  }

  factory PlacesNearbySearchResponseModel.fromJson(Map<String, dynamic> json) {
    return _$PlacesNearbySearchResponseModelFromJson(json);
  }
}

@JsonSerializable()
class Place {
  List<AddressComponent>? address_components;
  String? adr_address;
  String? business_status;
  String? formatted_address;
  String? formatted_phone_number;
  Geometry? geometry;
  String? icon;
  String? icon_background_color;
  String? icon_mask_base_uri;
  String? international_phone_number;
  String? name;
  PlaceOpeningHours? opening_hours;
  bool? permanently_closed;
  List<PlacePhoto>? photos;
  String? place_id;
  PlusCode? plus_code;
  double? price_level;
  double? rating;
  String? reference;
  List<PlaceReview>? review;
  String? scope;
  List<String>? types;
  String? url;
  double? user_ratings_total;
  double? utc_offset;
  String? vicinity;
  String? website;
  Place({
    this.address_components,
    this.adr_address,
    this.business_status,
    this.formatted_address,
    this.formatted_phone_number,
    this.geometry,
    this.icon,
    this.icon_background_color,
    this.icon_mask_base_uri,
    this.international_phone_number,
    this.name,
    this.permanently_closed,
    this.photos,
    this.place_id,
    this.plus_code,
    this.price_level,
    this.rating,
    this.reference,
    this.review,
    this.scope,
    this.types,
    this.url,
    this.user_ratings_total,
    this.utc_offset,
    this.vicinity,
    this.website,
  });
  Map<String, dynamic> toJson() {
    return _$PlaceToJson(this);
  }

  factory Place.fromJson(Map<String, dynamic> json) {
    return _$PlaceFromJson(json);
  }
}

@JsonSerializable()
class PlaceReview {
  List<String>? author_name;
  double? rating;
  String? relative_time_description;
  double? time;
  String? author_url;
  String? language;
  String? profile_photo_url;
  String? text;
  PlaceReview(
    this.author_name,
    this.rating,
    this.relative_time_description,
    this.time,
    this.author_url,
    this.language,
    this.profile_photo_url,
    this.text,
  );
  Map<String, dynamic> toJson() {
    return _$PlaceReviewToJson(this);
  }

  factory PlaceReview.fromJson(Map<String, dynamic> json) {
    return _$PlaceReviewFromJson(json);
  }
}

@JsonSerializable()
class PlusCode {
  String? global_code;
  String? compound_code;
  PlusCode(
    this.compound_code,
    this.global_code,
  );
  Map<String, dynamic> toJson() {
    return _$PlusCodeToJson(this);
  }

  factory PlusCode.fromJson(Map<String, dynamic> json) {
    return _$PlusCodeFromJson(json);
  }
}

@JsonSerializable()
class PlacePhoto {
  double? height;
  List<String>? html_attributions;
  List<String>? photo_reference;
  double? width;
  PlacePhoto(
    this.height,
    this.html_attributions,
    this.photo_reference,
    this.width,
  );
  Map<String, dynamic> toJson() {
    return _$PlacePhotoToJson(this);
  }

  factory PlacePhoto.fromJson(Map<String, dynamic> json) {
    return _$PlacePhotoFromJson(json);
  }
}

@JsonSerializable()
class PlaceOpeningHours {
  bool? open_now;
  List<PlaceOpeningHoursPeriod>? periods;
  List<String>? weekday_text;
  PlaceOpeningHours(
    this.open_now,
    this.periods,
    this.weekday_text,
  );
  Map<String, dynamic> toJson() {
    return _$PlaceOpeningHoursToJson(this);
  }

  factory PlaceOpeningHours.fromJson(Map<String, dynamic> json) {
    return _$PlaceOpeningHoursFromJson(json);
  }
}

@JsonSerializable()
class PlaceOpeningHoursPeriod {
  PlaceOpeningHoursPeriodDetail? close;
  PlaceOpeningHoursPeriodDetail? open;
  PlaceOpeningHoursPeriod(this.close, this.open);
  Map<String, dynamic> toJson() {
    return _$PlaceOpeningHoursPeriodToJson(this);
  }

  factory PlaceOpeningHoursPeriod.fromJson(Map<String, dynamic> json) {
    return _$PlaceOpeningHoursPeriodFromJson(json);
  }
}

@JsonSerializable()
class PlaceOpeningHoursPeriodDetail {
  double? day;
  String? time;
  PlaceOpeningHoursPeriodDetail(
    this.day,
    this.time,
  );
  Map<String, dynamic> toJson() {
    return _$PlaceOpeningHoursPeriodDetailToJson(this);
  }

  factory PlaceOpeningHoursPeriodDetail.fromJson(Map<String, dynamic> json) {
    return _$PlaceOpeningHoursPeriodDetailFromJson(json);
  }
}

@JsonSerializable()
class Geometry {
  LatLngLiteral? location;
  Bounds? viewport;
  Geometry(
    this.location,
    this.viewport,
  );
  Map<String, dynamic> toJson() {
    return _$GeometryToJson(this);
  }

  factory Geometry.fromJson(Map<String, dynamic> json) {
    return _$GeometryFromJson(json);
  }
}

@JsonSerializable()
class Bounds {
  LatLngLiteral? northeast;
  LatLngLiteral? southwest;
  Bounds(
    this.northeast,
    this.southwest,
  );
  Map<String, dynamic> toJson() {
    return _$BoundsToJson(this);
  }

  factory Bounds.fromJson(Map<String, dynamic> json) {
    return _$BoundsFromJson(json);
  }
}

@JsonSerializable()
class LatLngLiteral {
  double? lat;
  double? lng;
  LatLngLiteral(
    this.lat,
    this.lng,
  );
  Map<String, dynamic> toJson() {
    return _$LatLngLiteralToJson(this);
  }

  factory LatLngLiteral.fromJson(Map<String, dynamic> json) {
    return _$LatLngLiteralFromJson(json);
  }
}

@JsonSerializable()
class AddressComponent {
  String? long_name;
  String? short_name;
  List<String>? types;
  AddressComponent(
    this.long_name,
    this.short_name,
    this.types,
  );
  Map<String, dynamic> toJson() {
    return _$AddressComponentToJson(this);
  }

  factory AddressComponent.fromJson(Map<String, dynamic> json) {
    return _$AddressComponentFromJson(json);
  }
}
