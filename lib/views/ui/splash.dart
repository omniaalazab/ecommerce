import 'package:ecommerce/helper/color_helper.dart';
import 'package:ecommerce/helper/text_style_helper.dart';
import 'package:ecommerce/views/ui/registration.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  double opacity = 0;
  startAnimation() {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        opacity = 1;
      });
    });
    Future.delayed(const Duration(seconds: 10), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const Registration(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.darkpurple,
      body: SafeArea(
        child: Center(
          child: AnimatedOpacity(
            duration: const Duration(seconds: 5),
            opacity: opacity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Store', style: TextStyleHelper.textStylefontSize24),
                //
                // Container(
                //   alignment: Alignment.center,
                //   width: double.infinity,
                //   height:700,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(30),
                //     color: ColorHelper.darkpurple,
                //   ),
                //   child:

                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
