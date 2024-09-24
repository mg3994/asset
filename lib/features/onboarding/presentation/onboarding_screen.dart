import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/rendering.dart';

import '../../authentication/login/presentation/login_screen.dart';

// This resource is taken from AFG Programmer 100 days UI

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List<Color> colors = [
    const Color.fromRGBO(94, 162, 95, 1),
    const Color.fromRGBO(213, 113, 91, 1),
    const Color.fromRGBO(248, 197, 105, 1),
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
              Flexible(
                child: GestureDetector(
                  onHorizontalDragEnd: (DragEndDetails details) {
                    if (details.velocity.pixelsPerSecond.dx > 0) {
                      _preve();
                    } else if (details.velocity.pixelsPerSecond.dx < 0) {
                      _next();
                    }
                  },
                  child: FadeInUp(
                      duration: const Duration(milliseconds: 800),
                      child: Container(
                        width: double.infinity,

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
              ),
              FadeInUp(
                  duration: const Duration(milliseconds: 1000),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50))),
                    child: Column(
                      children: [
                        SizedBox(
                          height: constraints.biggest.height * .05,
                        ),
                        FadeInUp(
                            duration: const Duration(milliseconds: 1300),
                            child: Text(
                              products[currentIndex][1],
                              style: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: constraints.biggest.height * .04,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FadeInUp(
                                duration: const Duration(milliseconds: 1400),
                                child: Text(
                                  textAlign: TextAlign.center,
                                  softWrap: true,
                                  maxLines: 3,
                                  overflow: TextOverflow.clip,
                                  products[currentIndex][2],
                                  style: const TextStyle(fontSize: 12),
                                )),
                          ],
                        ),
                        FadeInUp(
                          duration: const Duration(milliseconds: 1600),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              FadeInUp(
                                  duration: const Duration(milliseconds: 1000),
                                  child: Container(
                                    padding: const EdgeInsets.only(top: 30),
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
                        //
                        SizedBox(height: constraints.biggest.height * .04),
                        FadeInUp(
                            duration: const Duration(milliseconds: 1700),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 80),
                              child: MaterialButton(
                                onPressed: () {},
                                height: 60,
                                color: colors[currentIndex],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                child: const Center(
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
                            duration: const Duration(milliseconds: 1800),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 80, vertical: 10),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .push(LoginScreen.route());
                                },
                                style: ButtonStyle(
                                  overlayColor: WidgetStateProperty.all(
                                      Colors.transparent), // No ripple effect
                                  padding: WidgetStateProperty.all(
                                      EdgeInsets.zero), // Remove extra padding
                                ),
                                child: const Center(
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Colors.black,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ))
            ],
          ),
        );
      }),
    );
  }

  Widget _indicator(bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
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
