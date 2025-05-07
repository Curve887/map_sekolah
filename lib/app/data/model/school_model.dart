// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    bool isSuccess;
    String message;
    List<Datum> data;

    Welcome({
        required this.isSuccess,
        required this.message,
        required this.data,
    });

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        isSuccess: json["isSuccess"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String id;
    String name;
    String latitude;
    String longitude;
    String imagePath;
    String accreditation;
    String establishedYear;
    String rating;
    String history;

    Datum({
        required this.id,
        required this.name,
        required this.latitude,
        required this.longitude,
        required this.imagePath,
        required this.accreditation,
        required this.establishedYear,
        required this.rating,
        required this.history,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        imagePath: json["image_path"],
        accreditation: json["accreditation"],
        establishedYear: json["established_year"],
        rating: json["rating"],
        history: json["history"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "latitude": latitude,
        "longitude": longitude,
        "image_path": imagePath,
        "accreditation": accreditation,
        "established_year": establishedYear,
        "rating": rating,
        "history": history,
    };
}
