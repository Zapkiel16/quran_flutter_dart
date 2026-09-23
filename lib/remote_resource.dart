import 'package:dio/dio.dart';

import 'package:quran_flutter/surah_model.dart';
import 'package:quran_flutter/detail_surah_model.dart';

class RemoteResource {
  final Dio dio = Dio();

  RemoteResource() {
    dio.options.baseUrl = 'https://api.alquran.cloud/v1';

    dio.options.headers = {
      'Accept': 'application/json',
    };
  }

  Future<List<Datum>> fetchQuran() async {
    try {
      final response = await dio.get('/surah');

      final model = SurahModel.fromJson(
        response.data,
      );

      return model.data ?? [];
    } catch (e) {
      throw Exception(
        'Gagal mengambil daftar surah: $e',
      );
    }
  }

  Future<DetailSurahData?> fetchSurahDetail(
    int surahNumber,
  ) async {
    try {
      final responses = await Future.wait([
        dio.get(
          '/surah/$surahNumber/ar.alafasy',
        ),
        dio.get(
          '/surah/$surahNumber/id.indonesian',
        ),
      ]);

      final arabicModel = DetailSurahModel.fromJson(
        responses[0].data,
      );

      final translationModel = DetailSurahModel.fromJson(
        responses[1].data,
      );

      final arabicData = arabicModel.data;
      final translationData = translationModel.data;

      if (arabicData == null) {
        return null;
      }

      if (translationData != null) {
        for (
          int i = 0;
          i < arabicData.ayahs.length;
          i++
        ) {
          if (i < translationData.ayahs.length) {
            arabicData.ayahs[i].translation =
                translationData.ayahs[i].text;
          }
        }
      }

      return arabicData;
    } catch (e) {
      throw Exception(
        'Gagal mengambil detail surah: $e',
      );
    }
  }
}