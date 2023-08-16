import 'dart:convert';

List<DataModel2> dataModel2FromJson(String str) =>
    List<DataModel2>.from(json.decode(str).map((x) => DataModel2.fromJson(x)));

String dataModel2ToJson(List<DataModel2> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataModel2 {
  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  DataModel2({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory DataModel2.fromJson(Map<String, dynamic> json) => DataModel2(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
      };
}
