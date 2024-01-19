class People {
  String id;
  Name name;
  String email;
  String picture;
  Location location;

  People({
    required this.id,
    required this.name,
    required this.email,
    required this.picture,
    required this.location,
  });

  factory People.fromJson(Map<String, dynamic> json) => People(
        id: json["_id"],
        name: Name.fromJson(json["name"]),
        email: json["email"],
        picture: json["picture"],
        location: Location.fromJson(json["location"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name.toJson(),
        "email": email,
        "picture": picture,
        "location": location.toJson(),
      };
}

class Location {
  double? latitude;
  double? longitude;

  Location({
    required this.latitude,
    required this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}

class Name {
  String last;
  String first;

  Name({
    required this.last,
    required this.first,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        last: json["last"],
        first: json["first"],
      );

  Map<String, dynamic> toJson() => {
        "last": last,
        "first": first,
      };
}
