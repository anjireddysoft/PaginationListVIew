import 'package:greenpen/model/album.dart';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:greenpen/model/booking.dart';
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

// Sir this method written for post call but iam getting correct service if i
// get correct service just uncommenting the commenting code in the bellow method
  Future<List<BookingModel>> createBooking() async {
    /* var map = {
      'title': "title",
      "Id":id,
      "UserId":userId
    };

    var jsonBody = json.encode(map);*/
    final response = await client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/albums'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      /* body: jsonBody*/
    );
    responseJson = json.decode(response.body);

    if (response.statusCode == 503) {
      throw Exception("Please Check Yor internet or Wifi connection");
    }

    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      List<BookingModel> bookingList =
          list.map((model) => BookingModel.fromJson(model)).toList();
      return bookingList;
    } else {
      throw Exception("Failed to load bookingData");
    }
  }
}
