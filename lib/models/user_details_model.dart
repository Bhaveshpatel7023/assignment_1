
class UserDetailsModel {
  String message;
  List<Datum> data;

  UserDetailsModel({
    required this.message,
    required this.data,
  });

  factory UserDetailsModel.fromJson(Map<String, dynamic> json) => UserDetailsModel(
    message: json["message"],
    data: List<Datum>.from(json["Data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "Data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  int id;
  String name;
  String email;
  int phone;
  String gender;
  String country;
  String state;
  String city;

  Datum({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
    required this.country,
    required this.state,
    required this.city,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    gender: json["gender"],
    country: json["country"],
    state: json["state"],
    city: json["city"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "gender": gender,
    "country": country,
    "state": state,
    "city": city,
  };
}
