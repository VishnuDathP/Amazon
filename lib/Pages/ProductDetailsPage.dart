import 'package:badges/badges.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amazon_clone/Blocs/Bloc/ProductDetailsBloc.dart';
import 'package:amazon_clone/Blocs/Events/ShopEvent.dart';
import 'package:amazon_clone/Blocs/States/ShopState.dart';
import 'package:amazon_clone/Models/ProductDetailsModel.dart';
import 'package:amazon_clone/Pages/Test.dart';
import 'package:amazon_clone/Repository/ProductDetailsRepo.dart';
import 'package:amazon_clone/Routes/RoutePages.dart';
import 'package:amazon_clone/Screens/DealoftheDayScreen.dart';
import 'package:amazon_clone/Screens/DrawerScreen.dart';
import 'package:amazon_clone/Screens/SmartPhoneDealScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({Key? key}) : super(key: key);

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  late List<CartListModel> cartItems;

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as Arg;
    var bloc = BlocProvider.of<CartBloc>(context);

    return BlocBuilder<CartBloc, CartState>(
        builder: (BuildContext context, state) {
          if (state is InitialState) {
            state as InitialState;
          }
          if (state is ViewCartState) {
            state as ViewCartState;
            cartItems = state.cartList;
          }
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
                IconButton(
                  icon: Icon(Icons.search_rounded),
                  onPressed: () {},
                  iconSize: 30,
                ),
                IconButton(icon: Icon(Icons.mic), onPressed: () {}, iconSize: 30),
                Badge(
                  badgeColor: Colors.yellowAccent,
                  position: BadgePosition.topStart(start: 20,),
                  badgeContent: Text('${bloc.repo.cartList.length.toString()}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  child: IconButton(icon: Icon(Icons.shopping_cart_outlined),onPressed: (){Navigator.pushNamed(context, CartRoute);},iconSize: 30,),
                ),
              ],
              shadowColor: Colors.transparent,
            ),
            drawer: DrawerScreen(),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Brand:Samsung',
                          style: TextStyle(color: Colors.indigo),
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.orangeAccent,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.orangeAccent,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.orangeAccent,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.orangeAccent,
                        ),
                        Icon(
                          Icons.star_half_outlined,
                          color: Colors.orangeAccent,
                        ),
                        Text(
                          '129',
                          style: TextStyle(color: Colors.indigo),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                            'Samsung mobile S20 ultra, 128Gb hdd and 8Gb ram with \nsnapdragon octa core processor')
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Image(
                      image: AssetImage(productId.prod_image),
                      width: double.infinity,
                      fit: BoxFit.fill,
                      height: 350,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "₹ " + productId.prod_price.toString(),
                          style: TextStyle(fontSize: 25),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FlatButton(
                      minWidth: double.infinity,
                      padding: EdgeInsets.all(20),
                      color: Colors.orangeAccent,
                      onPressed: () {},
                      child: Text('Buy Now'),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FlatButton(
                      minWidth: double.infinity,
                      padding: EdgeInsets.all(20),
                      color: Colors.yellow,
                      onPressed: () {
                        var itemtobeAdded = CartListModel(
                            id: productId.prod_id,
                            name: productId.prod_name,
                            price: productId.prod_price,
                            image: productId.prod_image,
                            quantity: 1);
                        var addEvent = AddtoCartEvent(item: itemtobeAdded);
                        bloc.add(addEvent);
                        showAlertDialog(context);
                      },
                      //onPressed: isAdded? null : (){showAlertDialog(context);},
                      child: Text('Add to Cart'),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });

  }
}

showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    backgroundColor: Colors.white70,
    content: Text(
      "Successfully Added to cart",
      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
