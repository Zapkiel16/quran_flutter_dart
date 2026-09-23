class DetailSurahModel {
  int? code;
  String? status;
  DetailSurahData? data;

  DetailSurahModel({
    this.code,
    this.status,
    this.data,
  });

  factory DetailSurahModel.fromJson(Map<String, dynamic> json) {
    return DetailSurahModel(
      code: json['code'],
      status: json['status'],
      data: json['data'] != null
          ? DetailSurahData.fromJson(json['data'])
          : null,
    );
  }
}

class DetailSurahData {
  int? number;
  String? name;
  String? englishName;
  String? englishNameTranslation;
  int? numberOfAyahs;
  String? revelationType;
  List<Ayat> ayahs;

  DetailSurahData({
    this.number,
    this.name,
    this.englishName,
    this.englishNameTranslation,
    this.numberOfAyahs,
    this.revelationType,
    this.ayahs = const [],
  });

  factory DetailSurahData.fromJson(Map<String, dynamic> json) {
    return DetailSurahData(
      number: json['number'],
      name: json['name'],
      englishName: json['englishName'],
      englishNameTranslation: json['englishNameTranslation'],
      numberOfAyahs: json['numberOfAyahs'],
      revelationType: json['revelationType'],
      ayahs: json['ayahs'] != null
          ? List<Ayat>.from(
              json['ayahs'].map(
                (x) => Ayat.fromJson(x),
              ),
            )
          : [],
    );
  }
}

class Ayat {
  int? number;
  int? numberInSurah;
  String? text;
  String? audio;
  String? translation;

  Ayat({
    this.number,
    this.numberInSurah,
    this.text,
    this.audio,
    this.translation,
  });

  factory Ayat.fromJson(Map<String, dynamic> json) {
    return Ayat(
      number: json['number'],
      numberInSurah: json['numberInSurah'],
      text: json['text'],
      audio: json['audio'],
    );
  }
}