// business_model_entity.dart

class BusinessModelEntity {
  final List<ResultEntity> results;
  final int currentPage;
  final int totalPages;
  final int totalResults;

  BusinessModelEntity({
    required this.results,
    required this.currentPage,
    required this.totalPages,
    required this.totalResults,
  });

  // Factory to convert from raw JSON to Entity
  factory BusinessModelEntity.fromJson(Map<String, dynamic> json) {
    return BusinessModelEntity(
      results: List<ResultEntity>.from(
        json["results"].map((x) => ResultEntity.fromJson(x)),
      ),
      currentPage: json["currentPage"],
      totalPages: json["totalPages"],
      totalResults: json["totalResults"],
    );
  }

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "currentPage": currentPage,
        "totalPages": totalPages,
        "totalResults": totalResults,
      };
}

class ResultEntity {
  final String id;
  final List<CollegeEntity> college;
  final List<CollegeEntity> hospital;
  final List<HotelEntity> hotel;
  final List<CollegeEntity> restaurants;

  ResultEntity({
    required this.id,
    required this.college,
    required this.hospital,
    required this.hotel,
    required this.restaurants,
  });

  factory ResultEntity.fromJson(Map<String, dynamic> json) {
    return ResultEntity(
      id: json["_id"],
      college: List<CollegeEntity>.from(
        json["college"].map((x) => CollegeEntity.fromJson(x)),
      ),
      hospital: List<CollegeEntity>.from(
        json["hospital"].map((x) => CollegeEntity.fromJson(x)),
      ),
      hotel: List<HotelEntity>.from(
        json["hotel"].map((x) => HotelEntity.fromJson(x)),
      ),
      restaurants: List<CollegeEntity>.from(
        json["restaurants"].map((x) => CollegeEntity.fromJson(x)),
      ),
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "college": List<dynamic>.from(college.map((x) => x.toJson())),
        "hospital": List<dynamic>.from(hospital.map((x) => x.toJson())),
        "hotel": List<dynamic>.from(hotel.map((x) => x.toJson())),
        "restaurants": List<dynamic>.from(restaurants.map((x) => x.toJson())),
      };
}

class CollegeEntity {
  final String businessId;
  final String phoneNumber;
  final String name;
  final String fullAddress;
  final double latitude;
  final double longitude;
  final dynamic reviewCount;
  final dynamic rating;
  final String timezone;
  final String website;
  final String placeId;
  final String placeLink;
  final String types;
  final String priceLevel;
  final String sunday;
  final String monday;
  final String tuesday;
  final String wednesday;
  final String thursday;
  final String friday;
  final String saturday;
  final String city;
  final bool verified;
  final List<String> photos;
  final String state;
  final String description;

  CollegeEntity({
    required this.businessId,
    required this.phoneNumber,
    required this.name,
    required this.fullAddress,
    required this.latitude,
    required this.longitude,
    required this.reviewCount,
    required this.rating,
    required this.timezone,
    required this.website,
    required this.placeId,
    required this.placeLink,
    required this.types,
    required this.priceLevel,
    required this.sunday,
    required this.monday,
    required this.tuesday,
    required this.wednesday,
    required this.thursday,
    required this.friday,
    required this.saturday,
    required this.city,
    required this.verified,
    required this.photos,
    required this.state,
    required this.description,
  });

  factory CollegeEntity.fromJson(Map<String, dynamic> json) {
    return CollegeEntity(
      businessId: json["business_id"],
      phoneNumber: json["phone_number"],
      name: json["name"],
      fullAddress: json["full_address"],
      latitude: json["latitude"]?.toDouble(),
      longitude: json["longitude"]?.toDouble(),
      reviewCount: json["review_count"],
      rating: json["rating"],
      timezone: json["timezone"],
      website: json["website"],
      placeId: json["place_id"],
      placeLink: json["place_link"],
      types: json["types"],
      priceLevel: json["price_level"],
      sunday: json["Sunday"],
      monday: json["Monday"],
      tuesday: json["Tuesday"],
      wednesday: json["Wednesday"],
      thursday: json["Thursday"],
      friday: json["Friday"],
      saturday: json["Saturday"],
      city: json["city"],
      verified: json["verified"],
      photos: json['photos'] is String
          ? [json['photos']]
          : List<String>.from(json['photos'] ?? []),
      state: json["state"],
      description: json["description"],
    );
  }

  Map<String, dynamic> toJson() => {
        "business_id": businessId,
        "phone_number": phoneNumber,
        "name": name,
        "full_address": fullAddress,
        "latitude": latitude,
        "longitude": longitude,
        "review_count": reviewCount,
        "rating": rating,
        "timezone": timezone,
        "website": website,
        "place_id": placeId,
        "place_link": placeLink,
        "types": types,
        "price_level": priceLevel,
        "Sunday": sunday,
        "Monday": monday,
        "Tuesday": tuesday,
        "Wednesday": wednesday,
        "Thursday": thursday,
        "Friday": friday,
        "Saturday": saturday,
        "city": city,
        "verified": verified,
        "photos": photos,
        "state": state,
        "description": description,
      };
}

class HospitalEntity {
  final String businessId;
  final String phoneNumber;
  final String name;
  final String fullAddress;
  final double latitude;
  final double longitude;
  final dynamic reviewCount;
  final dynamic rating;
  final String timezone;
  final String website;
  final String placeId;
  final String placeLink;
  final String types;
  final String priceLevel;
  final String sunday;
  final String monday;
  final String tuesday;
  final String wednesday;
  final String thursday;
  final String friday;
  final String saturday;
  final String city;
  final bool verified;
  final List<String> photos;
  final String state;
  final String description;

  HospitalEntity({
    required this.businessId,
    required this.phoneNumber,
    required this.name,
    required this.fullAddress,
    required this.latitude,
    required this.longitude,
    required this.reviewCount,
    required this.rating,
    required this.timezone,
    required this.website,
    required this.placeId,
    required this.placeLink,
    required this.types,
    required this.priceLevel,
    required this.sunday,
    required this.monday,
    required this.tuesday,
    required this.wednesday,
    required this.thursday,
    required this.friday,
    required this.saturday,
    required this.city,
    required this.verified,
    required this.photos,
    required this.state,
    required this.description,
  });

  factory HospitalEntity.fromJson(Map<String, dynamic> json) {
    return HospitalEntity(
      businessId: json["business_id"],
      phoneNumber: json["phone_number"],
      name: json["name"],
      fullAddress: json["full_address"],
      latitude: json["latitude"]?.toDouble(),
      longitude: json["longitude"]?.toDouble(),
      reviewCount: json["review_count"],
      rating: json["rating"],
      timezone: json["timezone"],
      website: json["website"],
      placeId: json["place_id"],
      placeLink: json["place_link"],
      types: json["types"],
      priceLevel: json["price_level"],
      sunday: json["Sunday"],
      monday: json["Monday"],
      tuesday: json["Tuesday"],
      wednesday: json["Wednesday"],
      thursday: json["Thursday"],
      friday: json["Friday"],
      saturday: json["Saturday"],
      city: json["city"],
      verified: json["verified"],
      photos: json['photos'] is String
          ? [json['photos']]
          : List<String>.from(json['photos'] ?? []),
      state: json["state"],
      description: json["description"],
    );
  }

  Map<String, dynamic> toJson() => {
        "business_id": businessId,
        "phone_number": phoneNumber,
        "name": name,
        "full_address": fullAddress,
        "latitude": latitude,
        "longitude": longitude,
        "review_count": reviewCount,
        "rating": rating,
        "timezone": timezone,
        "website": website,
        "place_id": placeId,
        "place_link": placeLink,
        "types": types,
        "price_level": priceLevel,
        "Sunday": sunday,
        "Monday": monday,
        "Tuesday": tuesday,
        "Wednesday": wednesday,
        "Thursday": thursday,
        "Friday": friday,
        "Saturday": saturday,
        "city": city,
        "verified": verified,
        "photos": photos,
        "state": state,
        "description": description,
      };
}

class HotelEntity {
  final String businessId;
  final String phoneNumber;
  final String name;
  final String fullAddress;
  final double latitude;
  final double longitude;
  final dynamic reviewCount;
  final double rating;
  final String timezone;
  final String website;
  final String placeId;
  final String placeLink;
  final String types;
  final String priceLevel;
  final String sunday;
  final String monday;
  final String tuesday;
  final String wednesday;
  final String thursday;
  final String friday;
  final String saturday;
  final String city;
  final bool verified;
  final String photos;
  final String state;
  final String description;

  HotelEntity({
    required this.businessId,
    required this.phoneNumber,
    required this.name,
    required this.fullAddress,
    required this.latitude,
    required this.longitude,
    required this.reviewCount,
    required this.rating,
    required this.timezone,
    required this.website,
    required this.placeId,
    required this.placeLink,
    required this.types,
    required this.priceLevel,
    required this.sunday,
    required this.monday,
    required this.tuesday,
    required this.wednesday,
    required this.thursday,
    required this.friday,
    required this.saturday,
    required this.city,
    required this.verified,
    required this.photos,
    required this.state,
    required this.description,
  });

  factory HotelEntity.fromJson(Map<String, dynamic> json) {
    return HotelEntity(
      businessId: json["business_id"],
      phoneNumber: json["phone_number"],
      name: json["name"],
      fullAddress: json["full_address"],
      latitude: json["latitude"]?.toDouble(),
      longitude: json["longitude"]?.toDouble(),
      reviewCount: json["review_count"],
      rating: json["rating"]?.toDouble(),
      timezone: json["timezone"],
      website: json["website"],
      placeId: json["place_id"],
      placeLink: json["place_link"],
      types: json["types"],
      priceLevel: json["price_level"],
      sunday: json["Sunday"],
      monday: json["Monday"],
      tuesday: json["Tuesday"],
      wednesday: json["Wednesday"],
      thursday: json["Thursday"],
      friday: json["Friday"],
      saturday: json["Saturday"],
      city: json["city"],
      verified: json["verified"],
      photos: json["photos"],
      state: json["state"],
      description: json["description"],
    );
  }

  Map<String, dynamic> toJson() => {
        "business_id": businessId,
        "phone_number": phoneNumber,
        "name": name,
        "full_address": fullAddress,
        "latitude": latitude,
        "longitude": longitude,
        "review_count": reviewCount,
        "rating": rating,
        "timezone": timezone,
        "website": website,
        "place_id": placeId,
        "place_link": placeLink,
        "types": types,
        "price_level": priceLevel,
        "Sunday": sunday,
        "Monday": monday,
        "Tuesday": tuesday,
        "Wednesday": wednesday,
        "Thursday": thursday,
        "Friday": friday,
        "Saturday": saturday,
        "city": city,
        "verified": verified,
        "photos": photos,
        "state": state,
        "description": description,
      };
}


class RestaurantEntity {
  final String businessId;
  final String phoneNumber;
  final String name;
  final String fullAddress;
  final double latitude;
  final double longitude;
  final dynamic reviewCount;
  final double rating;
  final String timezone;
  final String website;
  final String placeId;
  final String placeLink;
  final String types;
  final String priceLevel;
  final String sunday;
  final String monday;
  final String tuesday;
  final String wednesday;
  final String thursday;
  final String friday;
  final String saturday;
  final String city;
  final bool verified;
  final String photos;
  final String state;
  final String description;

  RestaurantEntity({
    required this.businessId,
    required this.phoneNumber,
    required this.name,
    required this.fullAddress,
    required this.latitude,
    required this.longitude,
    required this.reviewCount,
    required this.rating,
    required this.timezone,
    required this.website,
    required this.placeId,
    required this.placeLink,
    required this.types,
    required this.priceLevel,
    required this.sunday,
    required this.monday,
    required this.tuesday,
    required this.wednesday,
    required this.thursday,
    required this.friday,
    required this.saturday,
    required this.city,
    required this.verified,
    required this.photos,
    required this.state,
    required this.description,
  });

  factory RestaurantEntity.fromJson(Map<String, dynamic> json) {
    return RestaurantEntity(
      businessId: json["business_id"],
      phoneNumber: json["phone_number"],
      name: json["name"],
      fullAddress: json["full_address"],
      latitude: json["latitude"]?.toDouble(),
      longitude: json["longitude"]?.toDouble(),
      reviewCount: json["review_count"],
      rating: json["rating"]?.toDouble(),
      timezone: json["timezone"],
      website: json["website"],
      placeId: json["place_id"],
      placeLink: json["place_link"],
      types: json["types"],
      priceLevel: json["price_level"],
      sunday: json["Sunday"],
      monday: json["Monday"],
      tuesday: json["Tuesday"],
      wednesday: json["Wednesday"],
      thursday: json["Thursday"],
      friday: json["Friday"],
      saturday: json["Saturday"],
      city: json["city"],
      verified: json["verified"],
      photos: json["photos"],
      state: json["state"],
      description: json["description"],
    );
  }

  Map<String, dynamic> toJson() => {
        "business_id": businessId,
        "phone_number": phoneNumber,
        "name": name,
        "full_address": fullAddress,
        "latitude": latitude,
        "longitude": longitude,
        "review_count": reviewCount,
        "rating": rating,
        "timezone": timezone,
        "website": website,
        "place_id": placeId,
        "place_link": placeLink,
        "types": types,
        "price_level": priceLevel,
        "Sunday": sunday,
        "Monday": monday,
        "Tuesday": tuesday,
        "Wednesday": wednesday,
        "Thursday": thursday,
        "Friday": friday,
        "Saturday": saturday,
        "city": city,
        "verified": verified,
        "photos": photos,
        "state": state,
        "description": description,
      };
}
