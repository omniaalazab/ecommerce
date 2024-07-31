import 'package:ecommerce/helper/color_helper.dart';
import 'package:ecommerce/helper/text_style_helper.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

// ignore: must_be_immutable
class CustomAllTextField extends StatefulWidget {
  const CustomAllTextField({
    super.key,
    required this.labelText,
    required this.textFieldController,
    required this.validatorFunction,
    this.keyboardType = TextInputType.text,
    // required this.onSavedFunction,
    this.isObsecure = false,
    this.prefix = const SizedBox(
      height: 1,
    ),
    this.suffix = const SizedBox(
      height: 1,
    ),
    //PrefixLoginWidget(),
  });
  final TextEditingController textFieldController;

  final String labelText;
  final String? Function(String?)? validatorFunction;
  final TextInputType keyboardType;
  final Widget prefix;
  final Widget suffix;
  //Function(String?)? onSavedFunction;

  final bool isObsecure;
  @override
  State<CustomAllTextField> createState() =>
      _CustomTextFieldWithphoneKeyBoardState();
}

class _CustomTextFieldWithphoneKeyBoardState extends State<CustomAllTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isObsecure,
      keyboardType: widget.keyboardType,
      cursorColor: HexColor('8E6CEF'),
      controller: widget.textFieldController,
      onChanged: (value) {},
      decoration: InputDecoration(
        suffixIcon: widget.suffix,
        filled: true,
        fillColor: ColorHelper.purple,
        prefixIcon: widget.prefix,
        contentPadding: EdgeInsets.zero,
        label: Text(
          widget.labelText,
          style: TextStyleHelper.textStylefontSize15.copyWith(
            color: ColorHelper.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: HexColor('8E6CEF').withOpacity(.5),
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: HexColor('342F3F'),
            width: 1,
          ),
        ),
      ),
      validator: widget.validatorFunction,
      //onSaved: widget.onSavedFunction,
    );
  }
}
