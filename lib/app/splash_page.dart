import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});
  @override
  Widget build(BuildContext context) => const Scaffold(
    body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(28)),
            child: Image(
              image: AssetImage('assets/applogo/applogo.png'),
              width: 112,
              height: 112,
            ),
          ),
          SizedBox(height: 14),
          Text(
            'MAMA BUS KOI',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
          ),
          SizedBox(height: 22),
          CircularProgressIndicator(),
        ],
      ),
    ),
  );
}
