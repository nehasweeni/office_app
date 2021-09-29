import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:office_app/model/office.dart';

class OfficeProvider {
  Future<String> _loadOffices() async {
    return rootBundle.loadString('lib/assets/office.json');
  }

  Future<List<Office>> getOffices() async {
    try {
      String jsonString = await _loadOffices();
      var jsonResponse = jsonDecode(jsonString);
      return (jsonResponse as List)
          .map((item) => Office.fromJson(item))
          .toList();
    } on Exception catch (e) {
      stderr.writeln(e);
      throw e;
    }
  }

  Map<String, String> _requestHeader() {
    return {HttpHeaders.contentTypeHeader: ' application/json; charset=utf-8'};
  }

  Future<bool> addOffice(Office office) async {
    try {
      Uri uri = Uri.parse('http://192.168.100.229:8080/add-office');
      String content = jsonEncode(office.toMap());
      print("Content" + content);
      var response = await post(uri, body: content, headers: _requestHeader());
      if (response.statusCode == 200) {
        print("Added Successfully");
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      stderr.writeln(e);
      throw e;
    }
  }
}
