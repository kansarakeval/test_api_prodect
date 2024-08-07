import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_api_prodect/screen/home/model/home_model.dart';
class ApiHelper{

 static ApiHelper helper = ApiHelper._();

 ApiHelper._();

 Future<HomeModel?> homeApiCall() async {
   String api = "https://dummyjson.com/products";
   var response = await http.get(Uri.parse(api));
   if(response.statusCode == 200){
     var json = jsonDecode(response.body);
     HomeModel model= HomeModel.mapToModel(json);
     return model;
   }
   return null;
 }
}