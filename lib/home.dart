import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:victoria_app1/slider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentPage = 0;
  final PageController _controller = PageController();

  final List<Widget> _pages = [
    SliderPage(
        title: "Track your Journey",
        description:
            "Track your train journey easliy and share with friends and family",
        image: "assets/onboard01.png"),
    SliderPage(
        title: "Real time notifications",
        description:
            "Get clear indications of which seats have been booked, are available or about to be paid for",
        image: "assets/onboard02.png"),
    SliderPage(
        title: "Reschedule your train",
        description: "Reschedule or cancel your train journey in 3 easy steps!",
        image: "assets/onboard03.png")
  ];

  // _onPageChanged (int index) {
  //   setState((){
  //     _currentPage = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // Permet d'empiler des objets
        children: [
          PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: _controller,
            itemCount: _pages.length,
            onPageChanged: (index) {
              // Change le numéro de la page actuelle
              setState(() {
                _currentPage = index;
              });
              print("Current page index $index");
            },
            itemBuilder: (context, int index) {
              return _pages[index];
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SmoothPageIndicator(
                controller: _controller,
                count: _pages.length,
                effect: const ExpandingDotsEffect(
                    dotHeight: 10,
                    dotWidth: 12,
                    activeDotColor: Color(0xff33cc9f),
                    dotColor: Color(0xffccf2e7)),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 30),
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Skip",
                          style: TextStyle(
                            color: Color(0xff4276a6),
                            fontWeight: FontWeight.bold
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, bottom: 30),
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          backgroundColor: const Color(0xff33cc9f),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: const Icon(Icons.arrow_forward_ios,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
