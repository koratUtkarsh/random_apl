import 'package:http/http.dart 'as http;
import 'dart:convert';

import 'package:random_apl/Screen/RandomApi/model/random_model.dart';

class ApiHelper
{
  Future<Randommodel> Apicalling()
  async {
    String link = "https://randomuser.me/api/";
    Uri uri = Uri.parse(link);
    var respon = await http.get(uri);
    var json = jsonDecode(respon.body);
    Randommodel r1 = Randommodel.fromJson(json);
    return r1;


  }
}