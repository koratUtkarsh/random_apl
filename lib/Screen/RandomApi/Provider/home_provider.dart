import 'package:flutter/material.dart';
import 'package:random_apl/Screen/RandomApi/model/random_model.dart';
import 'package:random_apl/Utils/helper.dart';

class HomeProvider extends ChangeNotifier
{
  Future<Randommodel> GetData()
  async {
    ApiHelper apiHelper = ApiHelper();
    Randommodel r1 = await apiHelper.Apicalling();
    return r1;
  }



}