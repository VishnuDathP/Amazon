import 'package:amazon_clone/Blocs/Bloc/ProductDetailsBloc.dart';
import 'package:amazon_clone/Pages/Test.dart';
import 'package:amazon_clone/Routes/RoutePages.dart';
import 'package:amazon_clone/Screens/CarouselScreen.dart';
import 'package:amazon_clone/Screens/CategoryScreen.dart';
import 'package:amazon_clone/Screens/DealoftheDayScreen.dart';
import 'package:amazon_clone/Screens/DrawerHeaderScreen.dart';
import 'package:amazon_clone/Screens/DrawerScreen.dart';
import 'package:amazon_clone/Screens/LocationScreen.dart';
import 'package:amazon_clone/Screens/SearchScreen.dart';
import 'package:amazon_clone/Screens/SmartPhoneDealScreen.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<CartBloc>(context);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(

        backgroundColor: Colors.lightBlue[200],
        //leading: IconButton(icon: Icon(Icons.menu),onPressed: (){},),
        //title: SearchScreen(),
        title:
        SizedBox(
          height: 30,
          child: Image.asset("assets/images/amazon.png"),
        ),
        actions: [
          IconButton(icon: Icon(Icons.mic),onPressed: (){},iconSize: 30),
          Badge(
            badgeColor: Colors.yellowAccent,
            position: BadgePosition.topStart(start: 20,),
            badgeContent: Text('${bloc.repo.cartList.length.toString()}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            child: IconButton(icon: Icon(Icons.shopping_cart_outlined),onPressed: (){Navigator.pushNamed(context, CartRoute);},iconSize: 30,),
          ),
          //IconButton(icon: Icon(Icons.shopping_cart_outlined),onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Test()));},iconSize: 30),
        ],
        shadowColor: Colors.transparent,
      ),
      drawer: DrawerScreen(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SearchScreen(),
            LocationScreen(),
            CategoryScreen(),
            CarouselScreen(),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: GestureDetector(
                onTap: (){},
                child: Image(
                  width: double.infinity,
                  image: AssetImage("assets/images/offer2.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            DealoftheDayScreen(),
            SmartPhoneDealScreen(),
          ],
        ),
      ),
    );
  }
}
