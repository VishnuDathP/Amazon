import 'package:amazon_clone/Blocs/Bloc/ProductDetailsBloc.dart';
import 'package:amazon_clone/Blocs/Events/ShopEvent.dart';
import 'package:amazon_clone/Blocs/States/ShopState.dart';
import 'package:amazon_clone/Models/ProductDetailsModel.dart';
import 'package:amazon_clone/Pages/ProductDetailsPage.dart';
import 'package:amazon_clone/Routes/RoutePages.dart';
import 'package:amazon_clone/Screens/SmartPhoneDealScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DealoftheDayScreen extends StatefulWidget {
  const DealoftheDayScreen({Key? key}) : super(key: key);

  @override
  _DealoftheDayScreenState createState() => _DealoftheDayScreenState();
}

class _DealoftheDayScreenState extends State<DealoftheDayScreen> {
  var bloc = ProductDetailsBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsBloc, ShopState>(
      bloc: bloc,
      builder: (BuildContext context, state) {
        if (state is LoadPageState) {
          state as LoadPageState;
          return Container(
              color: Colors.white,
              margin: EdgeInsets.only(top: 10, bottom: 10),
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Deal of the Day',
                        style: TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 10,
                    ),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 4.0,
                          crossAxisSpacing: 4.0),
                      itemCount: state.dealofDay.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        //return Image(image: AssetImage(images[index].image),fit: BoxFit.fill,);
                        return FlatButton(
                          color: Colors.grey[50],
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductDetailsPage(),
                                    settings: RouteSettings(
                                        arguments: Arg(
                                            prod_id: state.dealofDay[index].id,
                                            prod_price:
                                                state.dealofDay[index].price,
                                            prod_image:
                                                state.dealofDay[index].image,
                                            prod_name:
                                                state.dealofDay[index].name))));
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                child: Image(
                                  image:
                                      AssetImage(state.dealofDay[index].image),
                                  height: 130,
                                ),
                              ),
                              Text(state.dealofDay[index].name,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey[800])),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            "See all deals",
                            style: TextStyle(
                                fontSize: 15, color: Colors.indigoAccent),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ));
        } else
          return Container(
            child: Text('No Data Found'),
          );
      },
    );
  }
}
