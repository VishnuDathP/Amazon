import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselScreen extends StatefulWidget {
  const CarouselScreen({Key? key}) : super(key: key);

  @override
  _CarouselScreenState createState() => _CarouselScreenState();
}

class _CarouselScreenState extends State<CarouselScreen> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CarouselSlider(
        items: [
          Image(
            image: AssetImage("assets/images/carousal.jpg"),
            fit: BoxFit.cover,
          ),
          Image(
            image: AssetImage("assets/images/tea.jpg"),
            fit: BoxFit.contain,
          ),
          Image(
            image: AssetImage("assets/images/carousal1.jpg"),
            fit: BoxFit.cover,
          ),
          Image(
            image: AssetImage("assets/images/electronics.jpg"),
            fit: BoxFit.cover,
          )
        ],
        options: CarouselOptions(
          height: 200.0,
          autoPlay: true,
        ),
      ),
    );
  }
}
