import 'package:flutter/material.dart';

class SliderPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  SliderPage(
      {required this.title, required this.description, required this.image});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: width * 0.6,
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            title,
            style: const TextStyle(
                color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Text(
              description,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.blueGrey,
                fontWeight: FontWeight.normal
              ),
              textAlign: TextAlign.left,
            ),
          )
        ],
      ),
    );
  }
}
