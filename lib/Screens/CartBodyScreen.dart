import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartBodyScreen extends StatefulWidget {
  const CartBodyScreen({Key? key}) : super(key: key);

  @override
  _CartBodyScreenState createState() => _CartBodyScreenState();
}

class _CartBodyScreenState extends State<CartBodyScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 10,bottom: 10),
      height: 400,
      width: double.infinity,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Shopping cart',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          Divider(color: Colors.black,),
          Row(
            children: [
              Image(image: AssetImage('assets/images/cart.jpg'),height: 200,width: 200,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Your Amazon Basket is \nempty',style: TextStyle(fontSize: 16),),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  GestureDetector(
                    onTap: (){},
                    child: Text('See recommendations',style: TextStyle(fontSize: 15,color: Colors.indigoAccent),),
                  )
                ]
              ),
            ],
          ),
          Center(
            child: FlatButton(
              color: Colors.yellow,
              onPressed: (){},
              child: Text('Sign in to your account'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)
              ),
              padding: EdgeInsets.only(left: 50,right: 50,top: 10,bottom: 10)
            ),
          ),
          Center(
            child: FlatButton(
              onPressed: (){},
              child: Text('Sign up now'),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.only(left: 80,right: 80,top: 10,bottom: 10),
            ),
          ),
        ],
      ),
    );
    // return Container(
    //   padding: EdgeInsets.all(10),
    //   margin: EdgeInsets.only(top: 10,bottom: 10),
    //   height: 400,
    //   width: double.infinity,
    //   decoration: BoxDecoration(
    //     image: DecorationImage(
    //       image: AssetImage('assets/images/cart.jpg'),
    //       fit: BoxFit.fill
    //     )
    //   ),
    //   child: Column(
    //     children: [
    //       Row(
    //         children: [
    //           Text('Shopping cart',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
    //         ],
    //       ),
    //       Divider(color: Colors.black,),
    //       Text('Your Amazon Basket is empty',style: TextStyle(fontSize: 16),)
    //     ],
    //   ),
    // );
  }
}
