import 'package:amazon_clone/Blocs/Bloc/ProductDetailsBloc.dart';
import 'package:amazon_clone/Blocs/Events/ShopEvent.dart';
import 'package:amazon_clone/Blocs/States/ShopState.dart';
import 'package:amazon_clone/Models/ProductDetailsModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SaveForLater extends StatefulWidget {
  const SaveForLater({Key? key}) : super(key: key);

  @override
  _SaveForLaterState createState() => _SaveForLaterState();
}

class _SaveForLaterState extends State<SaveForLater> {
  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<SaveForLaterBloc>(context, listen: true);
    return BlocListener<SaveForLaterBloc, SaveForLaterState>(
      listener: (context, state) {},
      child: BlocBuilder<SaveForLaterBloc, SaveForLaterState>(
          bloc: bloc,
          builder: (BuildContext context, state) {
            if (state is InitialSaveForLaterState) {
            }
            if (state is ViewSaveForLaterState) {
              return Container(
                color: Colors.white,
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: state.saveForLaterList.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Divider(
                                thickness: 1,
                              ),
                              Row(
                                children: [
                                  Image(
                                    image: AssetImage(
                                        state.saveForLaterList[index].image),
                                    height: 100,
                                    width: 100,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(state.saveForLaterList[index].name),
                                      Text(
                                        '₹ ${state.saveForLaterList[index].price}',
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
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                children: [
                                  OutlineButton(
                                    onPressed: () {
                                      setState(() {});
                                      // var a = CartListModel(
                                      //     quantity: state
                                      //         .cartList[index].quantity,
                                      //     image:
                                      //     state.cartList[index].image,
                                      //     price:
                                      //     state.cartList[index].price,
                                      //     name:
                                      //     state.cartList[index].name,
                                      //     id: state.cartList[index].id);
                                      // bloc.add(
                                      //     RemoveFromCartEvent(item: a));
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
                                    child: Text('Move to cart'),
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
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Saved for later (0 items)',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                  ],
                ),
              );
            }
          }),
    );
  }
}
