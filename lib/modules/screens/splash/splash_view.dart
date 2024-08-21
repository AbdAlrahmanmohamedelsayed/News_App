import 'package:flutter/material.dart';
import 'package:news_app/core/config/pageRoutesName.dart';

class SplashView extends StatefulWidget {
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, PageRoutesName.homepage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image:
              DecorationImage(image: AssetImage('assets/images/pattern.png')),
          color: Colors.white),
      child: SizedBox(width: 300, child: Image.asset('assets/images/logo.png')),
    );
  }
}
