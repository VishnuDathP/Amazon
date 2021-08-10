import 'package:amazon_clone/Pages/HomePage.dart';
import 'package:amazon_clone/Routes/RoutePages.dart' as Routes;
import 'package:amazon_clone/Routes/RoutePages.dart';
import 'package:flutter/material.dart';

import 'DrawerHeaderScreen.dart';
class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeaderScreen(),
          ListTile(
            title: Text('Home',style: TextStyle(fontSize: 18,color: Colors.black87),),
            //onTap: (){MaterialPageRoute(builder: (BuildContext context) => HomePage() );},
            //onTap: (){Navigator.pushNamed(context, Routes.Home);},
            onTap: (){Navigator.pushReplacementNamed(context, Home);},
            //onTap: (){Navigator.pop(context, (r) => r.settings.name == Routes.Home);},
          ),
          ListTile(
            title: Text('Shop by Category',style: TextStyle(fontSize: 18,color: Colors.black87),),
          ),
          ListTile(
            title: Text("Today's Deals",style: TextStyle(fontSize: 18,color: Colors.black87),),
          ),
          Divider(color: Colors.grey[850],),
          ListTile(
            title: Text('Your Orders',style: TextStyle(fontSize: 18,color: Colors.black87),),
          ),
          ListTile(
            title: Text('Buy Again',style: TextStyle(fontSize: 18,color: Colors.black87),),
          ),
          ListTile(
            title: Text('Your Wish List',style: TextStyle(fontSize: 18,color: Colors.black87),),
          ),
          ListTile(
            title: Text('Your Account',style: TextStyle(fontSize: 18,color: Colors.black87),),
          ),
          ListTile(
            title: Text('Amazon Pay',style: TextStyle(fontSize: 18,color: Colors.black87),),
          ),
          ListTile(
            title: Text('Prime',style: TextStyle(fontSize: 18,color: Colors.black87),),
          ),
          ListTile(
            title: Text('Sell on Amazon',style: TextStyle(fontSize: 18,color: Colors.black87),),
          ),
          ListTile(
            title: Text('Programs and Features',style: TextStyle(fontSize: 18,color: Colors.black87),),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
          ),
          ListTile(
            title: Text('Language',style: TextStyle(fontSize: 18,color: Colors.black87),),
          ),
          ListTile(
            title: Text('Your Notifications',style: TextStyle(fontSize: 18,color: Colors.black87),),
          ),
          ListTile(
            title: Text('Settings',style: TextStyle(fontSize: 18,color: Colors.black87),),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
          ),
          ListTile(
            title: Text('Customer Service',style: TextStyle(fontSize: 18,color: Colors.black87),),
          ),
        ],
      ),
    );
  }
}
