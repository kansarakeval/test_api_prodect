import 'package:flutter/material.dart';
import 'package:test_api_prodect/screen/detail/view/detail_screen.dart';
import 'package:test_api_prodect/screen/home/view/home_screen.dart';
import 'package:test_api_prodect/screen/like/view/like_screen.dart';

Map<String,WidgetBuilder> app_routes={
  '/': (context) => const HomeScreen(),
  'like': (context) => const LikeScreen(),
  'detail': (context) => const DetailScreen(),
};