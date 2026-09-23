class SurahModel {
  final int? code;
  final String? status;
  final List<Datum>? data;

  SurahModel({
    this.code,
    this.status,
    this.data,
  });

  factory SurahModel.fromJson(Map<String, dynamic> json) {
    return SurahModel(
      code: json['code'],
      status: json['status'],
      data: json['data'] != null
          ? List<Datum>.from(
              json['data'].map((x) => Datum.fromJson(x)),
            )
          : null,
    );
  }
}

class Datum {
  final int? number;
  final String? name;
  final String? englishName;
  final String? englishNameTranslation;
  final int? numberOfAyahs;
  final String? revelationType;

  Datum({
    this.number,
    this.name,
    this.englishName,
    this.englishNameTranslation,
    this.numberOfAyahs,
    this.revelationType,
  });

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      number: json['number'],
      name: json['name'],
      englishName: json['englishName'],
      englishNameTranslation: json['englishNameTranslation'],
      numberOfAyahs: json['numberOfAyahs'],
      revelationType: json['revelationType'],
    );
  }
}