import 'dart:ffi';
import 'package:amazon_clone/Pages/CartPage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amazon_clone/Pages/HomePage.dart';
import 'package:amazon_clone/Routes/RoutePages.dart' as Router;
import 'package:flutter/material.dart';

import 'Blocs/Bloc/ProductDetailsBloc.dart';

void main(){
runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductDetailsBloc>(create: (context) => ProductDetailsBloc(),),
        BlocProvider<CartBloc>(create: (context) => CartBloc(),lazy: false,),
        BlocProvider<CounterBloc>(create: (context) => CounterBloc(InitialSt()))
      ],
      child: MaterialApp(
        title: 'Amazon',
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
          primaryIconTheme: IconThemeData(color: Colors.black,size: 30),
        ),
        onGenerateRoute: Router.generateRoute,
        initialRoute: Router.Home,
      ),
    );
  }
}
