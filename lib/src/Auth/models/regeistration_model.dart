import 'dart:convert';

RegistrationModel registrationModelFromJson(String str) =>
    RegistrationModel.fromJson(json.decode(str));

String registrationModelToJson(RegistrationModel data) =>
    json.encode(data.toJson());

class RegistrationModel {
  final String password;
  final String firstName;
  final String lastName;
  final String email;

  RegistrationModel({
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  factory RegistrationModel.fromJson(Map<String, dynamic> json) =>
      RegistrationModel(
        password: json["password"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "password": password,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
      };
}
