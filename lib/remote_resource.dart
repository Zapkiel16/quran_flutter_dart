import 'package:dio/dio.dart';
import 'surah_model.dart';
import 'detail_surah_model.dart';

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

      final model = SurahModel.fromJson(response.data);

      return model.data ?? [];
    } catch (e) {
      throw Exception('Gagal mengambil daftar surah: $e');
    }
  }

  Future<SurahDetailData?> fetchSurahDetail(int surahNumber) async {
    try {
      final response = await dio.get(
        '/surah/$surahNumber/quran-uthmani',
      );

      final model = SurahDetailModel.fromJson(response.data);

      return model.data;
    } catch (e) {
      throw Exception('Gagal mengambil detail surah: $e');
    }
  }
}