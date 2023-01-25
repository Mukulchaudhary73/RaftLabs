import 'dart:convert';

SampleApi sampleApiFromJson(String str) => SampleApi.fromJson(json.decode(str));

String sampleApiToJson(SampleApi data) => json.encode(data.toJson());

class SampleApi {
  SampleApi({
    this.api,
    this.description,
    this.auth,
    this.https,
    this.cors,
    this.link,
    this.category,
  });

  String? api;
  String? description;
  String? auth;
  bool? https;
  String? cors;
  String? link;
  String? category;

  factory SampleApi.fromJson(Map<String, dynamic> json) => SampleApi(
        api: json["API"],
        description: json["Description"],
        auth: json["Auth"],
        https: json["HTTPS"],
        cors: json["Cors"],
        link: json["Link"],
        category: json["Category"],
      );

  Map<String, dynamic> toJson() => {
        "API": api,
        "Description": description,
        "Auth": auth,
        "HTTPS": https,
        "Cors": cors,
        "Link": link,
        "Category": category,
      };
}
