import 'package:amazon_clone/Models/DealoftheDayModel.dart';
import 'package:amazon_clone/Routes/RoutePages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DealoftheDayScreen extends StatefulWidget {
  const DealoftheDayScreen({Key? key}) : super(key: key);

  @override
  _DealoftheDayScreenState createState() => _DealoftheDayScreenState();
}

class _DealoftheDayScreenState extends State<DealoftheDayScreen> {

  List<DealoftheDayModel> images =[
    DealoftheDayModel(image: 'assets/images/alexa.jpg',titile: "Amazon alexa"),
    DealoftheDayModel(image: 'assets/images/Diary.jpg',titile: "Journals"),
    DealoftheDayModel(image: 'assets/images/mobile.png',titile: "Mobile phones"),
    DealoftheDayModel(image: 'assets/images/pic1.jpg',titile: "hii"),
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 10,bottom: 10),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              Text('Deal of the Day',style: TextStyle(fontSize: 25),),
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
                        child: Image(image: AssetImage(images[index].image),height: 130,),
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


// Widget ProductBody(){
//
// }