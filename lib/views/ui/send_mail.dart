import 'package:ecommerce/helper/color_helper.dart';
import 'package:ecommerce/helper/text_style_helper.dart';
import 'package:ecommerce/views/ui/login.dart';
import 'package:ecommerce/views/widget/shared_widget/custom_button.dart';
import 'package:flutter/material.dart';

class SendMailToReset extends StatelessWidget {
  const SendMailToReset({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ColorHelper.darkpurple,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const Image(
                image: AssetImage(
                  'assets/images/image 4.png',
                ),
                height: 150,
                width: 70,
              ),
              Text(
                "We send you an Email to reset your password.",
                style: TextStyleHelper.textStylefontSize16
                    .copyWith(fontWeight: FontWeight.w700),
              ),
              CustomElevatedButton(
                  widthButton: 80,
                  backColor: ColorHelper.lightPurple,
                  //  sideColor: HexColor('8E6CEF').withOpacity(.5),
                  fontColor: Colors.white,
                  fontWeight: FontWeight.bold,
                  buttonText: "Return to Log in",
                  onPressedFunction: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => const LogIn()));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
