import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:forniteapp/models/skins_model.dart';
import 'package:http/http.dart' as http;

class SkinProvider extends ChangeNotifier {
  List<Skin> listSkins = [];
  List<String> categorias = [];
  bool _isLoadingSkin = true;

  bool get isLoadingSkin => _isLoadingSkin;

  SkinProvider() {
    getSkins();
  }

  Future<void> getSkins() async {
    final url = Uri.http('fortnite-api.com', '/v2/shop/br');

    final response = await http.get(
      url,
      headers: {
        'key': 'c36a3e2b-5a15-40f1-9e00-60ca93d718f2',
      },
    );

    final jsonData = json.decode(response.body);

    final data = jsonData['data']['featured']['entries'];

    listSkins = List<Skin>.from(data.map((item) => Skin.fromJson(item)));

    // Obtén las categorías directamente desde la lista de skins
    List<String> categorias = obtenerCategoriasDesdeSkins(listSkins);

    // Elimina duplicados y conserva el orden original
    categorias = categorias.toSet().toList();

    print(categorias);

    _isLoadingSkin = false;
    notifyListeners();
  }

  List<String> obtenerCategoriasDesdeSkins(List<Skin> skins) {
    for (var skin in skins) {
      if (skin.layout != null && skin.layout.category != null) {
        categorias.add(skin.layout.category);
      }
    }

    return categorias;
  }
}
