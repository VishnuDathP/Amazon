import 'dart:ffi';

import 'package:amazon_clone/Pages/HomePage.dart';
import 'package:amazon_clone/Routes/RoutePages.dart' as Router;
import 'package:flutter/material.dart';

void main(){
runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazon',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primaryIconTheme: IconThemeData(color: Colors.black,size: 30),
      ),
      onGenerateRoute: Router.generateRoute,
      initialRoute: Router.Home,
    );
  }
}
