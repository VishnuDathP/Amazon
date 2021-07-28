import 'package:amazon_clone/Pages/CartPage.dart';
import 'package:amazon_clone/Pages/HomePage.dart';
import 'package:amazon_clone/Pages/ProductDetailsPage.dart';
import 'package:flutter/material.dart';

Route<dynamic>generateRoute(RouteSettings settings){
  switch(settings.name){
    case Home:
      return MaterialPageRoute(builder: (context) => HomePage());
    case CartRoute:
      return MaterialPageRoute(builder: (context) => CartPage());
    case ProductDetailsRoute:
      return MaterialPageRoute(builder: (context) => ProductDetailsPage());
    default:
      return MaterialPageRoute(builder: (context) => HomePage());
  }
}

const String Home = '/';
const String CartRoute = '/cart';
const String ProductDetailsRoute = '/product_details';