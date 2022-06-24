import 'dart:async';

import 'package:flutter/material.dart';
import 'package:valeta/components/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer( const Duration(seconds: 5), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const OnboardScreen()));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              'assets/Logo.jpg',
              scale: 5,
            ),
            Column(
              children: const [
                 Text(
                   'From',
                   style: TextStyle(
                     color: Colors.blueGrey,
                     fontSize: 12.0,
                   ),
                 ),
                SizedBox(height: 5.0),
                Text(
                  'Humblar',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
