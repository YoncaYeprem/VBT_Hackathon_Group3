// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nearbys_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseModel _$BaseModelFromJson(Map<String, dynamic> json) => BaseModel(
      (json['results'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$BaseModelToJson(BaseModel instance) => <String, dynamic>{
      'results': instance.results,
    };

PlacesNearbySearchResponseModel _$PlacesNearbySearchResponseModelFromJson(
        Map<String, dynamic> json) =>
    PlacesNearbySearchResponseModel(
      (json['html_attributions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      (json['results'] as List<dynamic>?)
          ?.map((e) => Place.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['error_message'] as String?,
      (json['info_messages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      json['next_page_token'] as String?,
    );

Map<String, dynamic> _$PlacesNearbySearchResponseModelToJson(
        PlacesNearbySearchResponseModel instance) =>
    <String, dynamic>{
      'html_attributions': instance.html_attributions,
      'results': instance.results,
      'error_message': instance.error_message,
      'info_messages': instance.info_messages,
      'next_page_token': instance.next_page_token,
    };

Place _$PlaceFromJson(Map<String, dynamic> json) => Place(
      address_components: (json['address_components'] as List<dynamic>?)
          ?.map((e) => AddressComponent.fromJson(e as Map<String, dynamic>))
          .toList(),
      adr_address: json['adr_address'] as String?,
      business_status: json['business_status'] as String?,
      formatted_address: json['formatted_address'] as String?,
      formatted_phone_number: json['formatted_phone_number'] as String?,
      geometry: json['geometry'] == null
          ? null
          : Geometry.fromJson(json['geometry'] as Map<String, dynamic>),
      icon: json['icon'] as String?,
      icon_background_color: json['icon_background_color'] as String?,
      icon_mask_base_uri: json['icon_mask_base_uri'] as String?,
      international_phone_number: json['international_phone_number'] as String?,
      name: json['name'] as String?,
      permanently_closed: json['permanently_closed'] as bool?,
      photos: (json['photos'] as List<dynamic>?)
          ?.map((e) => PlacePhoto.fromJson(e as Map<String, dynamic>))
          .toList(),
      place_id: json['place_id'] as String?,
      plus_code: json['plus_code'] == null
          ? null
          : PlusCode.fromJson(json['plus_code'] as Map<String, dynamic>),
      price_level: (json['price_level'] as num?)?.toDouble(),
      rating: (json['rating'] as num?)?.toDouble(),
      reference: json['reference'] as String?,
      review: (json['review'] as List<dynamic>?)
          ?.map((e) => PlaceReview.fromJson(e as Map<String, dynamic>))
          .toList(),
      scope: json['scope'] as String?,
      types:
          (json['types'] as List<dynamic>?)?.map((e) => e as String).toList(),
      url: json['url'] as String?,
      user_ratings_total: (json['user_ratings_total'] as num?)?.toDouble(),
      utc_offset: (json['utc_offset'] as num?)?.toDouble(),
      vicinity: json['vicinity'] as String?,
      website: json['website'] as String?,
    )..opening_hours = json['opening_hours'] == null
        ? null
        : PlaceOpeningHours.fromJson(
            json['opening_hours'] as Map<String, dynamic>);

Map<String, dynamic> _$PlaceToJson(Place instance) => <String, dynamic>{
      'address_components': instance.address_components,
      'adr_address': instance.adr_address,
      'business_status': instance.business_status,
      'formatted_address': instance.formatted_address,
      'formatted_phone_number': instance.formatted_phone_number,
      'geometry': instance.geometry,
      'icon': instance.icon,
      'icon_background_color': instance.icon_background_color,
      'icon_mask_base_uri': instance.icon_mask_base_uri,
      'international_phone_number': instance.international_phone_number,
      'name': instance.name,
      'opening_hours': instance.opening_hours,
      'permanently_closed': instance.permanently_closed,
      'photos': instance.photos,
      'place_id': instance.place_id,
      'plus_code': instance.plus_code,
      'price_level': instance.price_level,
      'rating': instance.rating,
      'reference': instance.reference,
      'review': instance.review,
      'scope': instance.scope,
      'types': instance.types,
      'url': instance.url,
      'user_ratings_total': instance.user_ratings_total,
      'utc_offset': instance.utc_offset,
      'vicinity': instance.vicinity,
      'website': instance.website,
    };

PlaceReview _$PlaceReviewFromJson(Map<String, dynamic> json) => PlaceReview(
      (json['author_name'] as List<dynamic>?)?.map((e) => e as String).toList(),
      (json['rating'] as num?)?.toDouble(),
      json['relative_time_description'] as String?,
      (json['time'] as num?)?.toDouble(),
      json['author_url'] as String?,
      json['language'] as String?,
      json['profile_photo_url'] as String?,
      json['text'] as String?,
    );

Map<String, dynamic> _$PlaceReviewToJson(PlaceReview instance) =>
    <String, dynamic>{
      'author_name': instance.author_name,
      'rating': instance.rating,
      'relative_time_description': instance.relative_time_description,
      'time': instance.time,
      'author_url': instance.author_url,
      'language': instance.language,
      'profile_photo_url': instance.profile_photo_url,
      'text': instance.text,
    };

PlusCode _$PlusCodeFromJson(Map<String, dynamic> json) => PlusCode(
      json['compound_code'] as String?,
      json['global_code'] as String?,
    );

Map<String, dynamic> _$PlusCodeToJson(PlusCode instance) => <String, dynamic>{
      'global_code': instance.global_code,
      'compound_code': instance.compound_code,
    };

PlacePhoto _$PlacePhotoFromJson(Map<String, dynamic> json) => PlacePhoto(
      (json['height'] as num?)?.toDouble(),
      (json['html_attributions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      (json['photo_reference'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      (json['width'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PlacePhotoToJson(PlacePhoto instance) =>
    <String, dynamic>{
      'height': instance.height,
      'html_attributions': instance.html_attributions,
      'photo_reference': instance.photo_reference,
      'width': instance.width,
    };

PlaceOpeningHours _$PlaceOpeningHoursFromJson(Map<String, dynamic> json) =>
    PlaceOpeningHours(
      json['open_now'] as bool?,
      (json['periods'] as List<dynamic>?)
          ?.map((e) =>
              PlaceOpeningHoursPeriod.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['weekday_text'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$PlaceOpeningHoursToJson(PlaceOpeningHours instance) =>
    <String, dynamic>{
      'open_now': instance.open_now,
      'periods': instance.periods,
      'weekday_text': instance.weekday_text,
    };

PlaceOpeningHoursPeriod _$PlaceOpeningHoursPeriodFromJson(
        Map<String, dynamic> json) =>
    PlaceOpeningHoursPeriod(
      json['close'] == null
          ? null
          : PlaceOpeningHoursPeriodDetail.fromJson(
              json['close'] as Map<String, dynamic>),
      json['open'] == null
          ? null
          : PlaceOpeningHoursPeriodDetail.fromJson(
              json['open'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlaceOpeningHoursPeriodToJson(
        PlaceOpeningHoursPeriod instance) =>
    <String, dynamic>{
      'close': instance.close,
      'open': instance.open,
    };

PlaceOpeningHoursPeriodDetail _$PlaceOpeningHoursPeriodDetailFromJson(
        Map<String, dynamic> json) =>
    PlaceOpeningHoursPeriodDetail(
      (json['day'] as num?)?.toDouble(),
      json['time'] as String?,
    );

Map<String, dynamic> _$PlaceOpeningHoursPeriodDetailToJson(
        PlaceOpeningHoursPeriodDetail instance) =>
    <String, dynamic>{
      'day': instance.day,
      'time': instance.time,
    };

Geometry _$GeometryFromJson(Map<String, dynamic> json) => Geometry(
      json['location'] == null
          ? null
          : LatLngLiteral.fromJson(json['location'] as Map<String, dynamic>),
      json['viewport'] == null
          ? null
          : Bounds.fromJson(json['viewport'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GeometryToJson(Geometry instance) => <String, dynamic>{
      'location': instance.location,
      'viewport': instance.viewport,
    };

Bounds _$BoundsFromJson(Map<String, dynamic> json) => Bounds(
      json['northeast'] == null
          ? null
          : LatLngLiteral.fromJson(json['northeast'] as Map<String, dynamic>),
      json['southwest'] == null
          ? null
          : LatLngLiteral.fromJson(json['southwest'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BoundsToJson(Bounds instance) => <String, dynamic>{
      'northeast': instance.northeast,
      'southwest': instance.southwest,
    };

LatLngLiteral _$LatLngLiteralFromJson(Map<String, dynamic> json) =>
    LatLngLiteral(
      (json['lat'] as num?)?.toDouble(),
      (json['lng'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$LatLngLiteralToJson(LatLngLiteral instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

AddressComponent _$AddressComponentFromJson(Map<String, dynamic> json) =>
    AddressComponent(
      json['long_name'] as String?,
      json['short_name'] as String?,
      (json['types'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$AddressComponentToJson(AddressComponent instance) =>
    <String, dynamic>{
      'long_name': instance.long_name,
      'short_name': instance.short_name,
      'types': instance.types,
    };
