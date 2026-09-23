class SurahDetailModel {
  final int? code;
  final String? status;
  final SurahDetailData? data;

  SurahDetailModel({
    this.code,
    this.status,
    this.data,
  });

  factory SurahDetailModel.fromJson(Map<String, dynamic> json) {
    return SurahDetailModel(
      code: json['code'],
      status: json['status'],
      data: json['data'] != null
          ? SurahDetailData.fromJson(json['data'])
          : null,
    );
  }
}

class SurahDetailData {
  final int? number;
  final String? name;
  final String? englishName;
  final String? englishNameTranslation;
  final int? numberOfAyahs;
  final String? revelationType;
  final List<Ayah>? ayahs;

  SurahDetailData({
    this.number,
    this.name,
    this.englishName,
    this.englishNameTranslation,
    this.numberOfAyahs,
    this.revelationType,
    this.ayahs,
  });

  factory SurahDetailData.fromJson(Map<String, dynamic> json) {
    return SurahDetailData(
      number: json['number'],
      name: json['name'],
      englishName: json['englishName'],
      englishNameTranslation:
          json['englishNameTranslation'],
      numberOfAyahs: json['numberOfAyahs'],
      revelationType: json['revelationType'],
      ayahs: json['ayahs'] != null
          ? List<Ayah>.from(
              json['ayahs'].map(
                (x) => Ayah.fromJson(x),
              ),
            )
          : null,
    );
  }
}

class Ayah {
  final int? number;
  final String? text;
  final int? numberInSurah;
  final int? juz;
  final int? manzil;
  final int? page;
  final int? ruku;
  final int? hizbQuarter;
  final bool? sajda;

  Ayah({
    this.number,
    this.text,
    this.numberInSurah,
    this.juz,
    this.manzil,
    this.page,
    this.ruku,
    this.hizbQuarter,
    this.sajda,
  });

  factory Ayah.fromJson(Map<String, dynamic> json) {
    return Ayah(
      number: json['number'],
      text: json['text'],
      numberInSurah: json['numberInSurah'],
      juz: json['juz'],
      manzil: json['manzil'],
      page: json['page'],
      ruku: json['ruku'],
      hizbQuarter: json['hizbQuarter'],
      sajda: json['sajda'] ?? false,
    );
  }
}