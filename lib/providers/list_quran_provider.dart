import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:quran_offline/models/data_quran.dart';

class ListQuranProvider with ChangeNotifier {
  List _listQuran = [];

  List get listQuran => _listQuran;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<dynamic> getQuran(BuildContext context) async {
    _isLoading = true;
    try {
      final response = await DefaultAssetBundle.of(context).loadString('assets/quran.json');
      final data = json.decode(response);
      _listQuran = data;
      _isLoading = false;
      log('Quran: $listQuran');
    } catch (e) {
      _isLoading = false;
      log('Quran: $e');
    }
  }

  Future<List<Quran>> getListQuran() async {
    _isLoading = true;
    var response = await rootBundle.loadString('assets/quran.json');

    if (response.isNotEmpty) {
      _isLoading = false;
      return quranFromJson(response);
    } else {
      _isLoading = false;
      return [];
    }
  }
}