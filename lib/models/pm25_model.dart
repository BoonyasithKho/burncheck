// To parse this JSON data, do
//
//     final pmCurrentPositionModel = pmCurrentPositionModelFromJson(jsonString);

import 'dart:convert';

PmCurrentPositionModel pmCurrentPositionModelFromJson(String str) =>
    PmCurrentPositionModel.fromJson(json.decode(str));

String pmCurrentPositionModelToJson(PmCurrentPositionModel data) =>
    json.encode(data.toJson());

class PmCurrentPositionModel {
  final int status;
  final String errMsg;
  final Data data;

  PmCurrentPositionModel({
    required this.status,
    required this.errMsg,
    required this.data,
  });

  factory PmCurrentPositionModel.fromJson(Map<String, dynamic> json) =>
      PmCurrentPositionModel(
        status: json["status"],
        errMsg: json["errMsg"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "errMsg": errMsg,
    "data": data.toJson(),
  };
}

class Data {
  final dynamic pm25;
  final List<List<dynamic>> graphHistory24Hrs;
  final List<String> graphMetadata;
  final dynamic pm25Avg24Hrs;
  final DatetimeThai datetimeThai;
  final DatetimeEng datetimeEng;
  final Loc loc;
  final List<Pm25Amphoe> pm25Amphoe;

  Data({
    required this.pm25,
    required this.graphHistory24Hrs,
    required this.graphMetadata,
    required this.pm25Avg24Hrs,
    required this.datetimeThai,
    required this.datetimeEng,
    required this.loc,
    required this.pm25Amphoe,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    pm25: json["pm25"],
    graphHistory24Hrs: List<List<dynamic>>.from(
      json["graphHistory24hrs"].map((x) => List<dynamic>.from(x.map((x) => x))),
    ),
    graphMetadata: List<String>.from(json["graphMetadata"].map((x) => x)),
    pm25Avg24Hrs: json["pm25Avg24hrs"],
    datetimeThai: DatetimeThai.fromJson(json["datetimeThai"]),
    datetimeEng: DatetimeEng.fromJson(json["datetimeEng"]),
    loc: Loc.fromJson(json["loc"]),
    pm25Amphoe: List<Pm25Amphoe>.from(
      json["pm25_amphoe"].map((x) => Pm25Amphoe.fromJson(x)),
    ),
  );

  Map<String, dynamic> toJson() => {
    "pm25": pm25,
    "graphHistory24hrs": List<dynamic>.from(
      graphHistory24Hrs.map((x) => List<dynamic>.from(x.map((x) => x))),
    ),
    "graphMetadata": List<dynamic>.from(graphMetadata.map((x) => x)),
    "pm25Avg24hrs": pm25Avg24Hrs,
    "datetimeThai": datetimeThai.toJson(),
    "datetimeEng": datetimeEng.toJson(),
    "loc": loc.toJson(),
    "pm25_amphoe": List<dynamic>.from(pm25Amphoe.map((x) => x.toJson())),
  };
}

class DatetimeEng {
  final String dateEng;
  final String timeEng;

  DatetimeEng({required this.dateEng, required this.timeEng});

  factory DatetimeEng.fromJson(Map<String, dynamic> json) =>
      DatetimeEng(dateEng: json["dateEng"], timeEng: json["timeEng"]);

  Map<String, dynamic> toJson() => {"dateEng": dateEng, "timeEng": timeEng};
}

class DatetimeThai {
  final String dateThai;
  final String timeThai;

  DatetimeThai({required this.dateThai, required this.timeThai});

  factory DatetimeThai.fromJson(Map<String, dynamic> json) =>
      DatetimeThai(dateThai: json["dateThai"], timeThai: json["timeThai"]);

  Map<String, dynamic> toJson() => {"dateThai": dateThai, "timeThai": timeThai};
}

class Loc {
  final String loctext;
  final String loctextEn;
  final dynamic tbIdn;
  final dynamic apIdn;
  final dynamic pvIdn;
  final String tbTn;
  final String apTn;
  final String pvTn;
  final String tbEn;
  final String apEn;
  final String pvEn;

  Loc({
    required this.loctext,
    required this.loctextEn,
    this.tbIdn,
    this.apIdn,
    this.pvIdn,
    required this.tbTn,
    required this.apTn,
    required this.pvTn,
    required this.tbEn,
    required this.apEn,
    required this.pvEn,
  });

  factory Loc.fromJson(Map<String, dynamic> json) => Loc(
    loctext: json["loctext"],
    loctextEn: json["loctext_en"],
    tbIdn: json["tb_idn"],
    apIdn: json["ap_idn"],
    pvIdn: json["pv_idn"],
    tbTn: json["tb_tn"],
    apTn: json["ap_tn"],
    pvTn: json["pv_tn"],
    tbEn: json["tb_en"],
    apEn: json["ap_en"],
    pvEn: json["pv_en"],
  );

  Map<String, dynamic> toJson() => {
    "loctext": loctext,
    "loctext_en": loctextEn,
    "tb_idn": tbIdn,
    "ap_idn": apIdn,
    "pv_idn": pvIdn,
    "tb_tn": tbTn,
    "ap_tn": apTn,
    "pv_tn": pvTn,
    "tb_en": tbEn,
    "ap_en": apEn,
    "pv_en": pvEn,
  };
}

class Pm25Amphoe {
  String? apTn;
  String? apEn;
  int? apIdn;
  double? pm25;
  DateTime? dt;
  double? pm25Avg24Hr;

  Pm25Amphoe({
    this.apTn,
    this.apEn,
    this.apIdn,
    this.pm25,
    this.dt,
    this.pm25Avg24Hr,
  });

  factory Pm25Amphoe.fromJson(Map<String, dynamic> json) => Pm25Amphoe(
    apTn: json["ap_tn"],
    apEn: json["ap_en"],
    apIdn: json["ap_idn"],
    pm25: json["pm25"]?.toDouble(),
    dt: DateTime.parse(json["dt"]),
    pm25Avg24Hr: json["pm25Avg24hr"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "ap_tn": apTn,
    "ap_en": apEn,
    "ap_idn": apIdn,
    "pm25": pm25,
    "dt": dt,
    // "dt": dt.toIso8601String(),
    "pm25Avg24hr": pm25Avg24Hr,
  };
}
