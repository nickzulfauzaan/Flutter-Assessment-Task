import 'dart:convert';

// Convert JSON string to CountryCode object
CountryCode CountryCodeFromJson(String str) =>
    CountryCode.fromJson(json.decode(str));

// Convert CountryCode object to JSON string
String CountryCodeToJson(CountryCode data) => json.encode(data.toJson());

class CountryCode {
  List<Country> data;

  CountryCode({
    required this.data,
  });

  factory CountryCode.fromJson(Map<String, dynamic> json) => CountryCode(
        data: List<Country>.from(json['data'].map((x) => Country.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'data': List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Country {
  String name;
  String dialCode;
  String flag;
  String code;

  Country({
    required this.name,
    required this.dialCode,
    required this.flag,
    required this.code,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json['name'],
        dialCode: json['dialCode'],
        flag: json['flag'],
        code: json['code'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'dialCode': dialCode,
        'flag': flag,
        'code': code,
      };
}
