import 'package:amazon_clone/Models/DealoftheDayModel.dart';
import 'package:amazon_clone/Pages/ProductDetailsPage.dart';
import 'package:amazon_clone/Routes/RoutePages.dart';
import 'package:flutter/material.dart';

class SmartPhoneDealScreen extends StatefulWidget {
  const SmartPhoneDealScreen({Key? key}) : super(key: key);

  @override
  _SmartPhoneDealScreenState createState() => _SmartPhoneDealScreenState();
}

class _SmartPhoneDealScreenState extends State<SmartPhoneDealScreen> {

  List<DealoftheDayModel> images =[
    DealoftheDayModel(image: 'assets/images/phone1.jpg',titile: "OnePlus: Up to ₹4,000 off with Coupons"),
    DealoftheDayModel(image: 'assets/images/phone2.jpg',titile: "Redmi: Up to ₹5,000 on exchange"),
    DealoftheDayModel(image: 'assets/images/phone3.jpg',titile: "Samsung: Up to ₹9,000 off"),
    DealoftheDayModel(image: 'assets/images/phone4.jpg',titile: "iQOO: Up to ₹3,000 off with Coupons"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Text('Savings up to ₹9,000 |\n Smartphones from top brands',style: TextStyle(fontSize: 25),),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 10,),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 4.0,
                    crossAxisSpacing: 4.0
                ),
                itemCount: images.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index){
                  //return Image(image: AssetImage(images[index].image),fit: BoxFit.fill,);
                  return FlatButton(
                    color: Colors.grey[50],
                    onPressed: (){Navigator.pushNamed(context, ProductDetailsRoute);},
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          child: Image(image: AssetImage(images[index].image),height: 120,),
                        ),
                        Text(images[index].titile,style: TextStyle(fontSize: 16,color: Colors.grey[800])),
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
                    onTap: (){},
                    child: Text("See all deals",style: TextStyle(fontSize: 15,color: Colors.indigoAccent),),
                  ),
                ),
              ],
            )

          ],
        )
    );
  }
}
