import 'package:amazon_clone/Models/CategoryModel.dart';
import 'package:flutter/material.dart';
class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  late List<CategoryModel> CategoryList = [
    CategoryModel( CategoryPic:'assets/images/amazon.png', CategoryName:'Prime',),
    CategoryModel( CategoryPic:'assets/images/amazon.png', CategoryName:'Pantry',),
    CategoryModel( CategoryPic:'assets/images/amazon.png', CategoryName:'Mobiles',),
    CategoryModel( CategoryPic:'assets/images/amazon.png', CategoryName:'Fashion',),
    CategoryModel( CategoryPic:'assets/images/amazon.png', CategoryName:'Home',),
    CategoryModel( CategoryPic:'assets/images/amazon.png', CategoryName:'Electronics',),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          itemCount: CategoryList.length,
          itemBuilder: (BuildContext context, int index){
            return Container(
              margin: EdgeInsets.all(10.0),
              width: 60.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.lightBlue,
                    radius: 40,
                    child: Image(
                      image: AssetImage(CategoryList[index].CategoryPic),fit: BoxFit.fill,
                    ),
                  ),
                  Text(CategoryList[index].CategoryName,style: TextStyle(fontSize: 12),)
                ],
              ),

            );
          }
      ),
    );
  }
}
