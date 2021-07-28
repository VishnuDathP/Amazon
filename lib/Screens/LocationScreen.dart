import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue[300],
      height: 40,
      child: GestureDetector(
        onTap: (){print('Address');},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(Icons.location_on),
              Text('Deliver To ',style: TextStyle(fontWeight: FontWeight.bold),),
              Icon(Icons.keyboard_arrow_down_outlined)
            ],
          ),
        ),
      ),
    );
  }
}
