// To parse this JSON data, do
//
//     final businessModel = businessModelFromJson(jsonString);

import 'dart:convert';

BusinessModel businessModelFromJson(String str) => BusinessModel.fromJson(json.decode(str));

String businessModelToJson(BusinessModel data) => json.encode(data.toJson());

class BusinessModel {
    List<Result> results;
    int currentPage;
    int totalPages;
    int totalResults;

    BusinessModel({
        required this.results,
        required this.currentPage,
        required this.totalPages,
        required this.totalResults,
    });

    factory BusinessModel.fromJson(Map<String, dynamic> json) => BusinessModel(
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        currentPage: json["currentPage"],
        totalPages: json["totalPages"],
        totalResults: json["totalResults"],
    );

    Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "currentPage": currentPage,
        "totalPages": totalPages,
        "totalResults": totalResults,
    };
}

class Result {
    String id;
    List<College> college;
    List<College> hospital;
    List<Hotel> hotel;
    List<College> restaurants;

    Result({
        required this.id,
        required this.college,
        required this.hospital,
        required this.hotel,
        required this.restaurants,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["_id"],
        college: List<College>.from(json["college"].map((x) => College.fromJson(x))),
        hospital: List<College>.from(json["hospital"].map((x) => College.fromJson(x))),
        hotel: List<Hotel>.from(json["hotel"].map((x) => Hotel.fromJson(x))),
        restaurants: List<College>.from(json["restaurants"].map((x) => College.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "college": List<dynamic>.from(college.map((x) => x.toJson())),
        "hospital": List<dynamic>.from(hospital.map((x) => x.toJson())),
        "hotel": List<dynamic>.from(hotel.map((x) => x.toJson())),
        "restaurants": List<dynamic>.from(restaurants.map((x) => x.toJson())),
    };
}

class College {
    String businessId;
    String phoneNumber;
    String name;
    String fullAddress;
    double latitude;
    double longitude;
    dynamic reviewCount;
    dynamic rating;
    Timezone timezone;
    String website;
    String placeId;
    String placeLink;
    String types;
    PriceLevel priceLevel;
    String sunday;
    String monday;
    String tuesday;
    String wednesday;
    String thursday;
    String friday;
    String saturday;
    String city;
    bool verified;
    String photos;
    String state;
    String description;

    College({
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

    factory College.fromJson(Map<String, dynamic> json) => College(
        businessId: json["business_id"],
        phoneNumber: json["phone_number"],
        name: json["name"],
        fullAddress: json["full_address"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        reviewCount: json["review_count"],
        rating: json["rating"],
        timezone: timezoneValues.map[json["timezone"]]!,
        website: json["website"],
        placeId: json["place_id"],
        placeLink: json["place_link"],
        types: json["types"],
        priceLevel: priceLevelValues.map[json["price_level"]]!,
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

    Map<String, dynamic> toJson() => {
        "business_id": businessId,
        "phone_number": phoneNumber,
        "name": name,
        "full_address": fullAddress,
        "latitude": latitude,
        "longitude": longitude,
        "review_count": reviewCount,
        "rating": rating,
        "timezone": timezoneValues.reverse[timezone],
        "website": website,
        "place_id": placeId,
        "place_link": placeLink,
        "types": types,
        "price_level": priceLevelValues.reverse[priceLevel],
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

enum PriceLevel {
    EMPTY,
    PRICE_LEVEL
}

final priceLevelValues = EnumValues({
    "": PriceLevel.EMPTY,
    "\u0024\u0024": PriceLevel.PRICE_LEVEL
});

enum Timezone {
    AMERICA_CHICAGO,
    AMERICA_DETROIT,
    AMERICA_NEW_YORK,
    ASIA_CALCUTTA,
    ASIA_DHAKA,
    ASIA_KARACHI,
    ASIA_KATMANDU
}

final timezoneValues = EnumValues({
    "America/Chicago": Timezone.AMERICA_CHICAGO,
    "America/Detroit": Timezone.AMERICA_DETROIT,
    "America/New_York": Timezone.AMERICA_NEW_YORK,
    "Asia/Calcutta": Timezone.ASIA_CALCUTTA,
    "Asia/Dhaka": Timezone.ASIA_DHAKA,
    "Asia/Karachi": Timezone.ASIA_KARACHI,
    "Asia/Katmandu": Timezone.ASIA_KATMANDU
});

class Hotel {
    String businessId;
    String phoneNumber;
    String name;
    String fullAddress;
    double latitude;
    double longitude;
    int reviewCount;
    double rating;
    Timezone timezone;
    String website;
    String placeId;
    String placeLink;
    String types;
    PriceLevel priceLevel;
    Day sunday;
    Day monday;
    Day tuesday;
    Day wednesday;
    Day thursday;
    Day friday;
    Day saturday;
    City city;
    bool verified;
    String photos;
    State state;
    String description;

    Hotel({
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

    factory Hotel.fromJson(Map<String, dynamic> json) => Hotel(
        businessId: json["business_id"],
        phoneNumber: json["phone_number"],
        name: json["name"],
        fullAddress: json["full_address"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        reviewCount: json["review_count"],
        rating: json["rating"]?.toDouble(),
        timezone: timezoneValues.map[json["timezone"]]!,
        website: json["website"],
        placeId: json["place_id"],
        placeLink: json["place_link"],
        types: json["types"],
        priceLevel: priceLevelValues.map[json["price_level"]]!,
        sunday: dayValues.map[json["Sunday"]]!,
        monday: dayValues.map[json["Monday"]]!,
        tuesday: dayValues.map[json["Tuesday"]]!,
        wednesday: dayValues.map[json["Wednesday"]]!,
        thursday: dayValues.map[json["Thursday"]]!,
        friday: dayValues.map[json["Friday"]]!,
        saturday: dayValues.map[json["Saturday"]]!,
        city: cityValues.map[json["city"]]!,
        verified: json["verified"],
        photos: json["photos"],
        state: stateValues.map[json["state"]]!,
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "business_id": businessId,
        "phone_number": phoneNumber,
        "name": name,
        "full_address": fullAddress,
        "latitude": latitude,
        "longitude": longitude,
        "review_count": reviewCount,
        "rating": rating,
        "timezone": timezoneValues.reverse[timezone],
        "website": website,
        "place_id": placeId,
        "place_link": placeLink,
        "types": types,
        "price_level": priceLevelValues.reverse[priceLevel],
        "Sunday": dayValues.reverse[sunday],
        "Monday": dayValues.reverse[monday],
        "Tuesday": dayValues.reverse[tuesday],
        "Wednesday": dayValues.reverse[wednesday],
        "Thursday": dayValues.reverse[thursday],
        "Friday": dayValues.reverse[friday],
        "Saturday": dayValues.reverse[saturday],
        "city": cityValues.reverse[city],
        "verified": verified,
        "photos": photos,
        "state": stateValues.reverse[state],
        "description": description,
    };
}




class Hospital {
    String businessId;
    String phoneNumber;
    String name;
    String fullAddress;
    double latitude;
    double longitude;
    int reviewCount;
    double rating;
    Timezone timezone;
    String website;
    String placeId;
    String placeLink;
    String types;
    PriceLevel priceLevel;
    Day sunday;
    Day monday;
    Day tuesday;
    Day wednesday;
    Day thursday;
    Day friday;
    Day saturday;
    City city;
    bool verified;
    String photos;
    State state;
    String description;

    Hospital({
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

    factory Hospital.fromJson(Map<String, dynamic> json) => Hospital(
        businessId: json["business_id"],
        phoneNumber: json["phone_number"],
        name: json["name"],
        fullAddress: json["full_address"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        reviewCount: json["review_count"],
        rating: json["rating"]?.toDouble(),
        timezone: timezoneValues.map[json["timezone"]]!,
        website: json["website"],
        placeId: json["place_id"],
        placeLink: json["place_link"],
        types: json["types"],
        priceLevel: priceLevelValues.map[json["price_level"]]!,
        sunday: dayValues.map[json["Sunday"]]!,
        monday: dayValues.map[json["Monday"]]!,
        tuesday: dayValues.map[json["Tuesday"]]!,
        wednesday: dayValues.map[json["Wednesday"]]!,
        thursday: dayValues.map[json["Thursday"]]!,
        friday: dayValues.map[json["Friday"]]!,
        saturday: dayValues.map[json["Saturday"]]!,
        city: cityValues.map[json["city"]]!,
        verified: json["verified"],
        photos: json["photos"],
        state: stateValues.map[json["state"]]!,
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "business_id": businessId,
        "phone_number": phoneNumber,
        "name": name,
        "full_address": fullAddress,
        "latitude": latitude,
        "longitude": longitude,
        "review_count": reviewCount,
        "rating": rating,
        "timezone": timezoneValues.reverse[timezone],
        "website": website,
        "place_id": placeId,
        "place_link": placeLink,
        "types": types,
        "price_level": priceLevelValues.reverse[priceLevel],
        "Sunday": dayValues.reverse[sunday],
        "Monday": dayValues.reverse[monday],
        "Tuesday": dayValues.reverse[tuesday],
        "Wednesday": dayValues.reverse[wednesday],
        "Thursday": dayValues.reverse[thursday],
        "Friday": dayValues.reverse[friday],
        "Saturday": dayValues.reverse[saturday],
        "city": cityValues.reverse[city],
        "verified": verified,
        "photos": photos,
        "state": stateValues.reverse[state],
        "description": description,
    };
}



class Restaurant {
    String businessId;
    String phoneNumber;
    String name;
    String fullAddress;
    double latitude;
    double longitude;
    int reviewCount;
    double rating;
    Timezone timezone;
    String website;
    String placeId;
    String placeLink;
    String types;
    PriceLevel priceLevel;
    Day sunday;
    Day monday;
    Day tuesday;
    Day wednesday;
    Day thursday;
    Day friday;
    Day saturday;
    City city;
    bool verified;
    String photos;
    State state;
    String description;

    Restaurant({
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

    factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        businessId: json["business_id"],
        phoneNumber: json["phone_number"],
        name: json["name"],
        fullAddress: json["full_address"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        reviewCount: json["review_count"],
        rating: json["rating"]?.toDouble(),
        timezone: timezoneValues.map[json["timezone"]]!,
        website: json["website"],
        placeId: json["place_id"],
        placeLink: json["place_link"],
        types: json["types"],
        priceLevel: priceLevelValues.map[json["price_level"]]!,
        sunday: dayValues.map[json["Sunday"]]!,
        monday: dayValues.map[json["Monday"]]!,
        tuesday: dayValues.map[json["Tuesday"]]!,
        wednesday: dayValues.map[json["Wednesday"]]!,
        thursday: dayValues.map[json["Thursday"]]!,
        friday: dayValues.map[json["Friday"]]!,
        saturday: dayValues.map[json["Saturday"]]!,
        city: cityValues.map[json["city"]]!,
        verified: json["verified"],
        photos: json["photos"],
        state: stateValues.map[json["state"]]!,
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "business_id": businessId,
        "phone_number": phoneNumber,
        "name": name,
        "full_address": fullAddress,
        "latitude": latitude,
        "longitude": longitude,
        "review_count": reviewCount,
        "rating": rating,
        "timezone": timezoneValues.reverse[timezone],
        "website": website,
        "place_id": placeId,
        "place_link": placeLink,
        "types": types,
        "price_level": priceLevelValues.reverse[priceLevel],
        "Sunday": dayValues.reverse[sunday],
        "Monday": dayValues.reverse[monday],
        "Tuesday": dayValues.reverse[tuesday],
        "Wednesday": dayValues.reverse[wednesday],
        "Thursday": dayValues.reverse[thursday],
        "Friday": dayValues.reverse[friday],
        "Saturday": dayValues.reverse[saturday],
        "city": cityValues.reverse[city],
        "verified": verified,
        "photos": photos,
        "state": stateValues.reverse[state],
        "description": description,
    };
}


enum City {
    KATHMANDU_NEPAL,
    MACHAPOKHARI_NEPAL
}

final cityValues = EnumValues({
    "Kathmandu, Nepal": City.KATHMANDU_NEPAL,
    "Machapokhari, Nepal": City.MACHAPOKHARI_NEPAL
});

enum Day {
    EMPTY,
    THE_7_AM_9_PM
}

final dayValues = EnumValues({
    "": Day.EMPTY,
    "7 AM-9 PM": Day.THE_7_AM_9_PM
});

enum State {
    EMPTY,
    OPEN_CLOSES_9_PM
}

final stateValues = EnumValues({
    "": State.EMPTY,
    "Open . Closes 9 PM": State.OPEN_CLOSES_9_PM
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
