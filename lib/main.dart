import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_api_prodect/util/app_routes.dart';

void main(){
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: app_routes,
    )
  );
}