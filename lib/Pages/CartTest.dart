import 'package:amazon_clone/Blocs/Bloc/ProductDetailsBloc.dart';
import 'package:amazon_clone/Blocs/Events/ShopEvent.dart';
import 'package:amazon_clone/Blocs/States/ShopState.dart';
import 'package:amazon_clone/Models/ProductDetailsModel.dart';
import 'package:amazon_clone/Repository/ProductDetailsRepo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartTest extends StatefulWidget {
  const CartTest({Key? key}) : super(key: key);

  @override
  _CartTestState createState() => _CartTestState();
}

class _CartTestState extends State<CartTest> {
  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<CartBloc>(context, listen: true);
    return BlocListener<CartBloc, CartState>(
      listener: (context, state) {},
      child: BlocBuilder<CartBloc, CartState>(
          bloc: bloc,
          builder: (BuildContext context, state) {
            if (state is InitialCartState) {
            }
            if (state is ViewCartState) {
              return Container(
                color: Colors.white,
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Shopping Cart',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        Text(
                          'Subtotal ₹${bloc.repo.calculateTotalAmount.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.only(top: 10, bottom: 10),
                          child: FlatButton(
                            onPressed: () {},
                            minWidth: double.infinity,
                            padding: EdgeInsets.all(16),
                            color: Colors.yellow,
                            child: Text('Proceed to Buy (${state.cartList.length.toString()} items)'),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: state.cartList.length,
                        itemBuilder: (context, index) {
                          var total = (state.cartList[index].price *
                              state.cartList[index].quantity)
                              .toString();
                          return Column(
                            children: [
                              Divider(
                                thickness: 1,
                              ),
                              Row(
                                children: [
                                  Image(
                                    image: AssetImage(
                                        state.cartList[index].image),
                                    height: 100,
                                    width: 100,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(state.cartList[index].name),
                                      Text(
                                        '₹' + total,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  MaterialButton(
                                      onPressed: () {
                                        setState(() {});
                                        bloc.add(DecrementCartItemEvent(
                                            item: CartListModel(
                                                id: state
                                                    .cartList[index].id,
                                                name: state
                                                    .cartList[index].name,
                                                price: state
                                                    .cartList[index]
                                                    .price,
                                                image: state
                                                    .cartList[index]
                                                    .image,
                                                quantity: 1)));
                                      },
                                      splashColor: Colors.red,
                                      minWidth: 10,
                                      color: Colors.grey[400],
                                      child: Icon(
                                          Icons.delete_outline_rounded)),
                                  Container(
                                    decoration: BoxDecoration(
                                      border:
                                      Border.all(color: Colors.grey),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Text(state
                                          .cartList[index].quantity
                                          .toString()),
                                    ),
                                  ),
                                  MaterialButton(
                                      onPressed: () {
                                        setState(() {});
                                        var itemtobeAdded = CartListModel(
                                            id: state.cartList[index].id,
                                            name: state
                                                .cartList[index].name,
                                            price: state
                                                .cartList[index].price,
                                            image: state
                                                .cartList[index].image,
                                            quantity: 1);
                                        var addEvent = AddtoCartEvent(
                                            item: itemtobeAdded);
                                        bloc.add(addEvent);
                                      },
                                      splashColor: Colors.blue,
                                      minWidth: 10,
                                      color: Colors.grey[400],
                                      child: Icon(Icons.add))
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                children: [
                                  OutlineButton(
                                    onPressed: () {
                                      setState(() {});
                                      var a = CartListModel(
                                          quantity: state
                                              .cartList[index].quantity,
                                          image:
                                          state.cartList[index].image,
                                          price:
                                          state.cartList[index].price,
                                          name:
                                          state.cartList[index].name,
                                          id: state.cartList[index].id);
                                      bloc.add(
                                          RemoveFromCartEvent(item: a));
                                    },
                                    splashColor: Colors.red,
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 0.5),
                                    child: Text('Delete'),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  OutlineButton(
                                    onPressed: () {},
                                    splashColor: Colors.green,
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 0.5),
                                    child: Text('Save for later'),
                                  )
                                ],
                              )
                            ],
                          );
                        })
                  ],
                ),
              );
            } else {
              return Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(top: 10, bottom: 10),
                height: 400,
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shopping cart',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    Row(
                      children: [
                        Image(
                          image: AssetImage('assets/images/cart.jpg'),
                          height: 200,
                          width: 200,
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Your Amazon Basket is \nempty',
                                style: TextStyle(fontSize: 16),
                              ),
                              Padding(padding: EdgeInsets.only(top: 10)),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  'See recommendations',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.indigoAccent),
                                ),
                              )
                            ]),
                      ],
                    ),
                    Center(
                      child: FlatButton(
                          color: Colors.yellow,
                          onPressed: () {},
                          child: Text('Sign in to your account'),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          padding: EdgeInsets.only(
                              left: 50, right: 50, top: 10, bottom: 10)),
                    ),
                    Center(
                      child: FlatButton(
                        onPressed: () {},
                        child: Text('Sign up now'),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.only(
                            left: 80, right: 80, top: 10, bottom: 10),
                      ),
                    ),
                  ],
                ),
              );
            }
          }),
    );
  }
}
