// To parse this JSON data, do
//
//     final authorizationModel = authorizationModelFromJson(jsonString);

import 'package:meta/meta.dart';

class HeaderModel {
  HeaderModel({
    @required this.token,
  });

  final String? token;

  factory HeaderModel.fromJson(Map<String, dynamic> json) => HeaderModel(
        token: json["token"],
      );

  Map<String, String> toHeader() => {
        "token": token!,
      };

  Map<String, String> toParams() => {
        "access-token": token!,
      };
}
