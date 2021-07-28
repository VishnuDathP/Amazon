import 'package:amazon_clone/Screens/DrawerScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({Key? key}) : super(key: key);

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
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
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Brand:Samsung',style: TextStyle(color: Colors.indigo),),
                SizedBox(
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(Icons.star,color: Colors.orangeAccent,),
                    Icon(Icons.star,color: Colors.orangeAccent,),
                    Icon(Icons.star,color: Colors.orangeAccent,),
                    Icon(Icons.star,color: Colors.orangeAccent,),
                    Icon(Icons.star_half_outlined,color: Colors.orangeAccent,),
                  ],
                ),),
                Text('129',style: TextStyle(color: Colors.indigo),),
              ],
            ),
            Row(
              children: [
                Text('Samsung mobile S20 ultra, 128Gb hdd and 8Gb ram with \nsnapdragon octa core processor')
              ],
            ),
            Image(
              image: AssetImage('assets/images/mobile.png'),
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Row(
              children: [
                Text('₹79,000',style: TextStyle(fontSize: 25),)
              ],
            ),
              Expanded(
              child: FlatButton(
                  color: Colors.orangeAccent,
                  onPressed: (){},
                  child: Text('Buy Now'),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  padding: EdgeInsets.only(left: 80,right: 80)
              ),
            ),
            SizedBox(height: 10,),
            Expanded(
              child: FlatButton(
                color: Colors.yellow,
                onPressed: (){},
                child: Text('Add to Cart'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.only(left: 80,right: 80),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
