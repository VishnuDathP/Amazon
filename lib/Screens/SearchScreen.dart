import 'package:amazon_clone/Routes/RoutePages.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue[200],
      child: Container(
        margin: EdgeInsets.fromLTRB(10,10,10,15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: const Offset(0.0, 3.0),
              blurRadius: 5.0,
            ),
          ],
        ),
        child: TextField(
          autofillHints: [AutofillHints.name],
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search,color: Colors.black,),
            hintText: "Search",
            suffixIcon: IconButton(
              icon: Icon(Icons.camera_alt_outlined),
              onPressed: (){print('Camara');},
            ),
            border: InputBorder.none,
          ),
        ),


        // child: Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     SizedBox(
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           IconButton(
        //             onPressed: (){Navigator.pushNamed(context, SearchPageRoute);},
        //             icon: Icon(Icons.search,),
        //           ),
        //           GestureDetector(
        //             onTap: (){Navigator.pushNamed(context, SearchPageRoute);},
        //             child: Text('Search',style: TextStyle(color: Colors.grey[700]),)
        //           ),
        //         ],
        //       ),
        //     ),
        //     IconButton(
        //       onPressed: (){print('camara');},
        //       icon: Icon(Icons.camera_alt_outlined),
        //     ),
        //   ],
        // ),


      ),
    );
  }
}
