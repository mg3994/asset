import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/rendering.dart';

// This resource is taken from AFG Programmer 100 days UI

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List<Color> colors = [
    Colors.green,
    Colors.red.shade300,
    Colors.yellow.shade700,
  ];
  final List<List<String>> products = [
    [
      'assets/ob_green.png',
      'Quality',
      "Sell your farm fresh products directly to\n consumers, cutting out the middleman and\n reducing emissions of the global supply chain. "
    ],
    [
      'assets/ob_orange.png',
      'Convenient',
      "Our team of delivery drivers will make sure\n your orders are picked up on time and\n promptly delivered to your customers."
    ],
    [
      'assets/ob_yellow.png',
      'Local',
      "We love the earth and know you do too! Join us\n in reducing our local carbon footprint one order\n at a time. "
    ]
  ];

  int currentIndex = 0;

  void _next() {
    setState(() {
      if (currentIndex < products.length - 1) {
        currentIndex++;
      } else {
        currentIndex = currentIndex;
      }
    });
  }

  void _preve() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
      } else {
        currentIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return Container(
          color: colors[currentIndex],
          child: Column(
            children: <Widget>[
              GestureDetector(
                onHorizontalDragEnd: (DragEndDetails details) {
                  if (details.velocity.pixelsPerSecond.dx > 0) {
                    _preve();
                  } else if (details.velocity.pixelsPerSecond.dx < 0) {
                    _next();
                  }
                },
                child: FadeInUp(
                    duration: Duration(milliseconds: 800),
                    child: Container(
                      width: double.infinity,
                      height: constraints.biggest.height * .6,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(products[currentIndex][0]),
                              fit: BoxFit.fitWidth)),
                      // child: Container(
                      //   decoration: BoxDecoration(
                      //       gradient: LinearGradient(
                      //           begin: Alignment.bottomRight,
                      //           colors: [
                      //         Colors.grey.shade700.withOpacity(.9),
                      //         Colors.grey.withOpacity(.0),
                      //       ])),
                      // ),
                    )),
              ),
              Expanded(
                child: Transform.translate(
                  offset: Offset(0, 1),
                  child: SingleChildScrollView(
                    child: FadeInUp(
                        duration: Duration(milliseconds: 1000),
                        child: Container(
                          height: constraints.biggest.height * .4,
                          width: double.infinity,
                          padding: EdgeInsets.all(30),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                children: [
                                  FadeInUp(
                                      duration: Duration(milliseconds: 1300),
                                      child: Text(
                                        products[currentIndex][1],
                                        style: TextStyle(
                                            color: Colors.grey[800],
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      FadeInUp(
                                          duration:
                                              Duration(milliseconds: 1400),
                                          child: Text(
                                            textAlign: TextAlign.center,
                                            softWrap: true,
                                            maxLines: 3,
                                            overflow: TextOverflow.clip,
                                            products[currentIndex][2],
                                            style: TextStyle(fontSize: 12),
                                          )),
                                    ],
                                  ),
                                  FadeInUp(
                                    duration: Duration(milliseconds: 1600),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        FadeInUp(
                                            duration:
                                                Duration(milliseconds: 1000),
                                            child: Container(
                                              padding: EdgeInsets.only(top: 30),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.min,
                                                children: _buildIndicator(),
                                              ),
                                            ))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              FadeInUp(
                                  duration: Duration(milliseconds: 1700),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 80),
                                    child: MaterialButton(
                                      onPressed: () {},
                                      height: 60,
                                      color: colors[currentIndex],
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: Center(
                                        child: Text(
                                          "Join the movement!",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  )),
                              //
                              FadeInUp(
                                  duration: Duration(milliseconds: 1800),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 80),
                                    child: TextButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                        overlayColor: WidgetStateProperty.all(
                                            Colors
                                                .transparent), // No ripple effect
                                        padding: WidgetStateProperty.all(
                                            EdgeInsets
                                                .zero), // Remove extra padding
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Login",
                                          style: TextStyle(
                                            color: Colors.black,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        )),
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }

  Widget _indicator(bool isActive) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      height: 5, // Larger height if active
      width: isActive ? 12 : 6, // Wider if active, smaller if not
      decoration: BoxDecoration(
          borderRadius:
              isActive ? BorderRadius.circular(10) : BorderRadius.circular(50),
          color: Colors.grey[800]),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < products.length; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }

    return indicators;
  }
}
