import 'package:amazon_clone/Blocs/Bloc/ProductDetailsBloc.dart';
import 'package:amazon_clone/Pages/CartTest.dart';
import 'package:amazon_clone/Pages/Test.dart';
import 'package:amazon_clone/Routes/RoutePages.dart';
import 'package:amazon_clone/Screens/CartBodyScreen.dart';
import 'package:amazon_clone/Screens/DrawerHeaderScreen.dart';
import 'package:amazon_clone/Screens/DrawerScreen.dart';
import 'package:amazon_clone/Screens/LocationScreen.dart';
import 'package:amazon_clone/Screens/SaveForLater.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<CartBloc>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[200],
        //leading: IconButton(icon: Icon(Icons.menu),onPressed: (){},),
        title: SizedBox(
          height: 30,
          child: Image.asset("assets/images/amazon.png"),
        ),
        actions: [
          IconButton(icon: Icon(Icons.search_rounded),onPressed: (){},iconSize: 30,),
          IconButton(icon: Icon(Icons.mic),onPressed: (){},iconSize: 30),
          Badge(
            badgeColor: Colors.yellowAccent,
            position: BadgePosition.topStart(start: 20,),
            badgeContent: Text('${bloc.repo.cartList.length.toString()}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            child: IconButton(icon: Icon(Icons.shopping_cart_outlined),onPressed: (){},iconSize: 30,),
          ),
        ],
        shadowColor: Colors.transparent,
      ),
      drawer: DrawerScreen(),

      body: ListView(
        children: [
          LocationScreen(),
          //CartBodyScreen(),
          CartTest(),
          //SaveForLater()
          //Test()
        ],
      ),
    );
  }
}
