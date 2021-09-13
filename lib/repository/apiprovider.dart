
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:greenpen/model/comic.dart';

import 'package:http/http.dart';

class ApiProvider {
  Client client = Client();
  var responseJson;
  int index = 20;
  List<ComicModel> comicList = [];

  Future<ComicModel> fetchAlbum(int index) async {
      final response =
          await client.get(Uri.parse('https://xkcd.com/$index/info.0.json'));

      if (response.statusCode == 503) {
        throw Exception("Please Check Yor internet or Wifi connection");
      }

      if (response.statusCode == 200) {
        responseJson = json.decode(response.body);

        return ComicModel.fromJson(responseJson);
      } else {
        throw Exception('Failed to load album');
      }
  }


}
