import 'package:amazon_clone/Blocs/Bloc/ProductDetailsBloc.dart';
import 'package:amazon_clone/Blocs/States/ShopState.dart';
import 'package:amazon_clone/Models/ProductDetailsModel.dart';
import 'package:amazon_clone/Pages/ProductDetailsPage.dart';
import 'package:amazon_clone/Routes/RoutePages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class SmartPhoneDealScreen extends StatefulWidget {
  const SmartPhoneDealScreen({Key? key}) : super(key: key);

  @override
  _SmartPhoneDealScreenState createState() => _SmartPhoneDealScreenState();
}

class _SmartPhoneDealScreenState extends State<SmartPhoneDealScreen> {

  @override
  Widget build(BuildContext context) {

    var bloc = Provider.of<ProductDetailsBloc>(context);
    return BlocBuilder<ProductDetailsBloc, ShopState>(
      bloc: bloc,
      builder: (BuildContext context, state) {
        if (state is LoadPageState) {
          state as LoadPageState;
          return Container(
              color: Colors.white,
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Savings up to ₹9,000 |\n Smartphones from top brands',
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
                      itemCount: state.smartphoneDeal.length,
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
                                            prod_id:
                                                state.smartphoneDeal[index].id,
                                            prod_image: state
                                                .smartphoneDeal[index].image,
                                            prod_name: state
                                                .smartphoneDeal[index].name,
                                            prod_price: state
                                                .smartphoneDeal[index]
                                                .price))));
                          },
                          // onPressed: (){Navigator.of(context).push(new MaterialPageRoute(
                          //   builder: (context) => ProductDetailsPage(),
                          //   settings: RouteSettings(
                          //     arguments: state.smartphoneDeal[index].id
                          //   )
                          // ));},
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                child: Image(
                                  image: AssetImage(
                                      state.smartphoneDeal[index].image),
                                  height: 120,
                                ),
                              ),
                              Text(state.smartphoneDeal[index].name,
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
                          onTap: () {
                            Navigator.of(context).pushNamed(ProductDetailsRoute,
                                arguments: 'hii');
                          },
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

class Arg {
  final String prod_id;
  final String prod_name;
  final String prod_image;
  final int prod_price;

  Arg(
      {required this.prod_id,
      required this.prod_name,
      required this.prod_image,
      required this.prod_price});

}
