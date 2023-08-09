import 'dart:convert';

import 'package:http/http.dart' as http;

import '../app_theam/app_colors.dart';
import '../models/user_details_model.dart';


class ApiMethode {
  Future<void> PostData(name,email,phone,gender,country,state,city) async {
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse(
        baseUrl));
    request.body = json.encode({
      "id": 99,
      "name": name,
      "email": email,
      "phone": phone,
      "gender": gender,
      "country": country,
      "state": state,
      "city": city
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }
  }
}