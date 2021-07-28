import 'package:amazon_clone/Routes/RoutePages.dart';
import 'package:amazon_clone/Screens/CartBodyScreen.dart';
import 'package:amazon_clone/Screens/DrawerHeaderScreen.dart';
import 'package:amazon_clone/Screens/DrawerScreen.dart';
import 'package:amazon_clone/Screens/LocationScreen.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
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
          IconButton(icon: Icon(Icons.shopping_cart_outlined),onPressed: (){},iconSize: 30),
        ],
        shadowColor: Colors.transparent,
      ),
      drawer: DrawerScreen(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            LocationScreen(),
            CartBodyScreen(),
          ],
        ),
      ),
    );
  }
}
