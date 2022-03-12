import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:thingiversemobile/models/thingiverse/image.dart';
import 'package:thingiversemobile/models/thingiverse/model.dart';
import 'package:thingiversemobile/models/thingiverse/modelDetail.dart';

class Thingiverse {
  Thingiverse.privateConstructor() {
    _baseUrl = 'https://api.thingiverse.com';
    _apiKey = dotenv.env["API_KEY"] ?? "";
  }

  late String _baseUrl, _apiKey;

  static final Thingiverse _instance = Thingiverse.privateConstructor();
  factory Thingiverse() => _instance;

  Future<List<ThingiverseModel>?> getNewest() async {
    var url = Uri.parse('$_baseUrl/newest?access_token=$_apiKey');
    var response = await http.get(url, headers: {
      'Accept': 'application/json',
      'authorization': 'Bearer $_apiKey'
    });
    if (response.statusCode == 200) {
      var decoded = jsonDecode(response.body);
      var models =
          (decoded as List).map((e) => ThingiverseModel.fromJson(e)).toList();
      return models;
    }
    return null;
  }

  Future<List<ThingiverseModel>?> getPopular() async {
    var url = Uri.parse('$_baseUrl/popular?access_token=$_apiKey');
    var response = await http.get(url, headers: {
      'Accept': 'application/json',
      'authorization': 'Bearer $_apiKey'
    });
    if (response.statusCode == 200) {
      var decoded = jsonDecode(response.body);
      var models =
          (decoded as List).map((e) => ThingiverseModel.fromJson(e)).toList();
      return models;
    }
    return null;
  }

  Future<ThingiverseModelDetail?> getSingle(int id) async {
    var url1 = Uri.parse('$_baseUrl/things/$id?access_token=$_apiKey');
    var url2 = Uri.parse('$_baseUrl/things/$id/images?access_token=$_apiKey');
    var response1 = await http.get(url1, headers: {
      'Accept': 'application/json',
      'authorization': 'Bearer $_apiKey'
    });
    var response2 = await http.get(url2, headers: {
      'Accept': 'application/json',
      'authorization': 'Bearer $_apiKey'
    });
    if (response1.statusCode == 200) {
      var decoded2 = jsonDecode(response2.body);
      var images =
          (decoded2 as List).map((e) => ThingiverseImage.fromJson(e)).toList();

      var decoded1 = jsonDecode(response1.body);
      var model = ThingiverseModelDetail.fromJson(decoded1, images);
      return model;
    }
    return null;
  }
}
