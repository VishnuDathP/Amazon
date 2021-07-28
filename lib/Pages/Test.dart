import 'package:amazon_clone/Models/DealoftheDayModel.dart';
import 'package:amazon_clone/Models/DrawerItemsModel.dart';
import 'package:flutter/material.dart';
class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {

  List<DrawerItemsModel> ListItems = [
    DrawerItemsModel(Options: "Home"),
    DrawerItemsModel(Options: "Shop by Category"),
    DrawerItemsModel(Options: "Today's Deals"),
    DrawerItemsModel(Options: "Your Orders"),
    DrawerItemsModel(Options: "Buy Again"),
    DrawerItemsModel(Options: "Your Wish List"),
    DrawerItemsModel(Options: "Your Account"),
    DrawerItemsModel(Options: "Amazon Pay"),
    DrawerItemsModel(Options: "Prime"),
    DrawerItemsModel(Options: "Sell on Amazon"),
    DrawerItemsModel(Options: "Programs and Features"),
    DrawerItemsModel(Options: "Language"),
    DrawerItemsModel(Options: "Your Notifications"),
    DrawerItemsModel(Options: "Settings"),
    DrawerItemsModel(Options: "Customer Service"),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (BuildContext context, int index){
        return ListTile(
          title: Text(ListItems[index].Options,style: TextStyle(fontSize: 18,),),
        );
      },
    );
  }
}
