import 'package:farmer_eats/features/authentication/login/presentation/login_screen.dart';
import 'package:farmer_eats/features/authentication/reset/presentation/reset_screen.dart';
import 'package:flutter/material.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
  static route() {
    return MaterialPageRoute(builder: (context) => const ForgotScreen());
  }
}

class _ForgotScreenState extends State<ForgotScreen> {
  /// The button is an [InkWell] that displays a [Row] containing a
  /// [Icon] representing an arrow pointing left and a [Text] widget
  /// displaying the string "Back".
  ///
  /// The button is styled with a padding of 10 horizontal and
  /// 10 vertical, and the icon and text are styled with a black color
  /// and a font size of 12 and a font weight of 500, respectively.
  // Widget _backButton() {
  //   return InkWell(
  //     onTap: () {
  //       Navigator.pop(context);
  //     },
  //     child: Container(
  //       padding: const EdgeInsets.symmetric(horizontal: 10),
  //       child: Row(
  //         children: <Widget>[
  //           Container(
  //             padding: const EdgeInsets.only(left: 0, top: 10, bottom: 10),
  //             child: const Icon(Icons.keyboard_arrow_left, color: Colors.black),
  //           ),
  //           const Text('Back',
  //               style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget _entryField(
    String hint,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
              decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: const TextStyle(color: Colors.grey),
                  alignLabelWithHint: true,
                  prefixIcon: Icon(Icons.local_phone_outlined),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  ),
                  fillColor: Color.fromRGBO(238, 237, 236, 1),
                  filled: true))
        ],
      ),
    );
  }

  Widget _submitButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: MaterialButton(
        minWidth: double.infinity,
        onPressed: () {
          Navigator.of(context).push(ResetScreen.route());
        },
        height: 60,
        color: const Color.fromRGBO(213, 113, 91, 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: const Text(
          'Send Code',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  // Widget _divider() {
  //   return Padding(
  //     padding: const EdgeInsets.only(top: 8.0),
  //     child: Container(
  //       margin: const EdgeInsets.symmetric(vertical: 10),
  //       child: Row(
  //         children: <Widget>[
  //           SizedBox(
  //             width: 20,
  //           ),
  //           Expanded(
  //             child: Padding(
  //               padding: EdgeInsets.symmetric(horizontal: 10),
  //               child: Divider(
  //                 thickness: 1,
  //               ),
  //             ),
  //           ),
  //           RichText(
  //             text: TextSpan(
  //                 text: 'or login with',
  //                 style: TextStyle(color: Color.fromRGBO(38, 28, 18, 0.3))),
  //           ),
  //           Expanded(
  //             child: Padding(
  //               padding: EdgeInsets.symmetric(horizontal: 10),
  //               child: Divider(
  //                 thickness: 1,
  //               ),
  //             ),
  //           ),
  //           SizedBox(
  //             width: 20,
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // Widget _socialButtons() {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 10),
  //     child: Row(
  //       mainAxisAlignment:
  //           MainAxisAlignment.spaceEvenly, // Aligns evenly across the row
  //       children: [
  //         // Google Icon with Rounded Rectangle Border
  //         _buildIconContainer(
  //           icon: Icons
  //               .g_mobiledata_outlined, // Change this to custom Google icon if needed
  //           color: Colors.red,
  //         ),
  //         // Apple Icon with Rounded Rectangle Border
  //         _buildIconContainer(
  //           icon: Icons.apple,
  //           color: Colors.black,
  //         ),
  //         // Facebook Icon with Rounded Rectangle Border
  //         _buildIconContainer(
  //           icon:
  //               Icons.facebook, // Change this to custom Facebook icon if needed
  //           color: Colors.blue,
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget _buildIconContainer({required IconData icon, required Color color}) {
  //   return Container(
  //     padding: EdgeInsets.symmetric(horizontal: 29.0, vertical: 8.0),
  //     decoration: BoxDecoration(
  //       border: Border.all(color: Colors.grey),
  //       borderRadius: BorderRadius.circular(30.0), // Rounded rectangle border
  //     ),
  //     child: Icon(
  //       icon,
  //       color: color,
  //       size: 30.0, // Adjust the icon size as needed
  //     ),
  //   );
  // }

  Widget _rememberYourPasswordLabel() {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.only(top: 10, bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            'Remember your pasword?',
            style: TextStyle(
                color: const Color(0x00000000).withOpacity(0.3),
                fontSize: 13,
                fontWeight: FontWeight.w600),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).maybePop();
            },
            style: ButtonStyle(
              overlayColor: WidgetStateProperty.all(Colors.transparent),
            ),
            child: Text(
              'Login',
              style: TextStyle(
                  color: Color(0xfff79c4f),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
          text: 'd',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Color(0xffe46b10)),
          children: [
            TextSpan(
              text: 'ev',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
              text: 'rnz',
              style: TextStyle(color: Color(0xffe46b10), fontSize: 30),
            ),
          ]),
    );
  }

  // Widget _phoneNumberWidget() {
  //   return Column(
  //     children: <Widget>[
  //       _entryField("Phone Number"),

  //     ],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.only(left: 28, top: 8, right: 28, bottom: 8),
      children: [
        Container(
          padding: const EdgeInsets.only(top: 18),
          child: RichText(
              text: const TextSpan(
                  text: 'FarmerEats',
                  style: TextStyle(fontWeight: FontWeight.w600))),
        ),
        Container(
          padding: const EdgeInsets.only(top: 80),
          child: RichText(
              text: const TextSpan(
                  text: 'Forgot Password?',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30))),
        ),
        //
        _rememberYourPasswordLabel(),
        //
        _entryField("Phone Number"),
        //
        // _entryField("Password", isPassword: true),
        //
        _submitButton(),
        //
      ],
    )

        // Stack(
        //   children: <Widget>[

        //     Container(
        //       padding: EdgeInsets.symmetric(horizontal: 20),
        //       child: SingleChildScrollView(
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.center,
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: <Widget>[
        //             SizedBox(height: height * .2),
        //             _title(),
        //             SizedBox(height: 50),
        //             _emailPasswordWidget(),
        //             SizedBox(height: 20),
        //             _submitButton(),
        //             Container(
        //               padding: EdgeInsets.symmetric(vertical: 10),
        //               alignment: Alignment.centerRight,
        //               child: Text('Forgot Password ?',
        //                   style: TextStyle(
        //                       fontSize: 14, fontWeight: FontWeight.w500)),
        //             ),
        //             _divider(),
        //             _facebookButton(),
        //             SizedBox(height: height * .055),
        //             _createAccountLabel(),
        //           ],
        //         ),
        //       ),
        //     ),
        //     Positioned(top: 40, left: 0, child: _backButton()),
        //   ],
        // )
        );
  }
}
