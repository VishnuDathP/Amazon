import 'package:flutter/material.dart';

class DrawerHeaderScreen extends StatelessWidget {
  const DrawerHeaderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.lightBlue[200],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 25,
              child: Icon(Icons.account_circle_outlined,color: Colors.white70,size: 30,),
            ),
            SizedBox(width: 10,),
            Text('Hello, User',style: TextStyle(fontSize: 23,),)
          ],
        ),
      ),
    );
  }
}
