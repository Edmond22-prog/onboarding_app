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
            "Track your train journey easily and share with friends and family",
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

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    const color1 = Color(0xff33cc9f);
    const color2 = Color(0xff4276a6);
    const color3 = Color(0xffccf2e7);

    return Scaffold(
      appBar: (_currentPage != 0)
          ? AppBar(
              leading: IconButton(
                onPressed: () {
                  _controller.previousPage(duration: const Duration(seconds: 1), curve: Curves.easeOutQuint);
                },
                icon: const Icon(Icons.arrow_back),
                color: Colors.black,
              ),
              backgroundColor: Colors.white,
              elevation: 0,
            )
          : AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
            ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: _controller,
              itemCount: _pages.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
                print("Current page index $index");
              },
              itemBuilder: (context, int index) {
                return _pages[index];
              },
            ),
          ),
          Column(
            children: [
              SmoothPageIndicator(
                controller: _controller,
                count: _pages.length,
                effect: const ExpandingDotsEffect(
                    dotHeight: 8,
                    dotWidth: 11,
                    activeDotColor: color1,
                    dotColor: color3),
              ),
              const SizedBox(
                height: 40,
              ),
              (_currentPage != 2)
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: width / 15),
                          child: TextButton(
                              onPressed: () {
                                _controller.jumpToPage(2);
                              },
                              child: const Text(
                                "Skip",
                                style: TextStyle(
                                    color: color2, fontWeight: FontWeight.bold),
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: width / 15),
                          child: TextButton(
                            onPressed: () {
                              _controller.nextPage(duration: const Duration(seconds: 1), curve: Curves.easeOutQuint);
                            },
                            style: TextButton.styleFrom(
                                backgroundColor: color1,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: const Icon(Icons.arrow_forward_ios,
                                color: Colors.white),
                          ),
                        )
                      ],
                    )
                  : ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.symmetric(
                            horizontal: width / 3, vertical: height / 50),
                        primary: color1,
                      ),
                      child: const Text("Get started"),
                    ),
            ],
          )
        ],
      ),
    );
  }
}
