import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:quran_app/models/details_models.dart';
import 'package:quran_app/ui/pages/detail_surah.dart';

import '../models/quran_models.dart';

class ApiServices with ChangeNotifier {
  final _baseUrl = 'https://equran.id/api';

  Future<List<SurahModel>> getData() async {
    final response = await http.get(Uri.parse(_baseUrl + '/surat'));
    print(response.body);
    if (response.statusCode == 200) {
      Iterable it = jsonDecode(response.body);
      List<SurahModel> surah = it.map((e) => SurahModel.fromJson(e)).toList();
      return surah;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<QuranDetails> getDetail(int nomor) async {
    final response = await http.get(Uri.parse(_baseUrl + '/surat/$nomor'));

    if (response.statusCode == 200) {
      return QuranDetails.fromJson(jsonDecode(response.body));
      // Iterable it = jsonDecode(response.body);
      // QuranDetails surah = it.map((e) => QuranDetails.fromJson(e)).toList();
      // return surah;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
