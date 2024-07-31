import 'package:ecommerce/helper/color_helper.dart';
import 'package:ecommerce/helper/text_style_helper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class CreateDialogToaster {
  static Future showErrorDialogDefult(String msgTitle, String masgContent) {
    return Get.defaultDialog(
      // titlePadding:
      //     const EdgeInsets.only(top: 10),

      title: msgTitle,
      titleStyle: TextStyleHelper.textStylefontSize22
          .copyWith(fontWeight: FontWeight.w700),

      content: Container(
        width: 100,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 15,
              ),
              Text(
                masgContent,
                style: TextStyleHelper.textStylefontSize13,
              ),
              const SizedBox(
                height: 15,
              ),
              CircularProgressIndicator(
                color: ColorHelper.lightPurple,
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void showErrorToast(String msgText) {
    Fluttertoast.showToast(
        msg: msgText,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 6,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static void showSucessToast(String msgText) {
    Fluttertoast.showToast(
        msg: msgText,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 6,
        backgroundColor: const Color.fromARGB(255, 50, 161, 23),
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
