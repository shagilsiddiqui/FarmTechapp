import 'dart:convert';

GeocodingApi geocodingApiFromJson(String str) => GeocodingApi.fromJson(json.decode(str));

String geocodingApiToJson(GeocodingApi data) => json.encode(data.toJson());

class GeocodingApi {
    GeocodingApi({
        this.results,
        this.status,
    });

    List<Result> results;
    String status;

    factory GeocodingApi.fromJson(Map<String, dynamic> json) => GeocodingApi(
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "status": status,
    };
}

class Result {
    Result({
        this.addressComponents,
        this.formattedAddress,
        this.geometry,
        this.placeId,
        //this.plusCode,
        this.types,
    });

    List<AddressComponent> addressComponents;
    String formattedAddress;
    Geometry geometry;
    String placeId;
    //PlusCode plusCode;
    List<String> types;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        addressComponents: List<AddressComponent>.from(json["address_components"].map((x) => AddressComponent.fromJson(x))),
        formattedAddress: json["formatted_address"],
        geometry: Geometry.fromJson(json["geometry"]),
        placeId: json["place_id"],
        //plusCode: PlusCode.fromJson(json["plus_code"]),
        types: List<String>.from(json["types"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "address_components": List<dynamic>.from(addressComponents.map((x) => x.toJson())),
        "formatted_address": formattedAddress,
        "geometry": geometry.toJson(),
        "place_id": placeId,
        //"plus_code": plusCode.toJson(),
        "types": List<dynamic>.from(types.map((x) => x)),
    };
}

class AddressComponent {
    AddressComponent({
        this.longName,
        this.shortName,
        this.types,
    });

    String longName;
    String shortName;
    List<String> types;

    factory AddressComponent.fromJson(Map<String, dynamic> json) => AddressComponent(
        longName: json["long_name"],
        shortName: json["short_name"],
        types: List<String>.from(json["types"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "long_name": longName,
        "short_name": shortName,
        "types": List<dynamic>.from(types.map((x) => x)),
    };
}

class Geometry {
    Geometry({
        this.location,
        this.locationType,
        //this.viewport,
    });

    Locti location;
    String locationType;
    //Viewport viewport;

    factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        location: Locti.fromJson(json["location"]),
        locationType: json["location_type"],
        //viewport: Viewport.fromJson(json["viewport"]),
    );

    Map<String, dynamic> toJson() => {
        "location": location.toJson(),
        "location_type": locationType,
        //"viewport": viewport.toJson(),
    };
}

class Locti {
    Locti({
        this.lat,
        this.lng,
    });

    double lat;
    double lng;

    factory Locti.fromJson(Map<String, dynamic> json) => Locti(
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
    };
}