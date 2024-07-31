import 'package:ecommerce/controller/reset_password/reset_cubit.dart';
import 'package:ecommerce/controller/reset_password/reset_state.dart';
import 'package:ecommerce/controller/validatio_function.dart/validation_function.dart';
import 'package:ecommerce/helper/color_helper.dart';
import 'package:ecommerce/helper/text_style_helper.dart';

import 'package:ecommerce/views/ui/send_mail.dart';
import 'package:ecommerce/views/widget/shared_widget/custom_button.dart';
import 'package:ecommerce/views/widget/shared_widget/dialog_toast.dart';
import 'package:ecommerce/views/widget/shared_widget/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FordgetPassword extends StatefulWidget {
  const FordgetPassword({super.key});

  @override
  State<FordgetPassword> createState() => _FordgetPasswordState();
}

class _FordgetPasswordState extends State<FordgetPassword> {
  TextEditingController passwordController = TextEditingController();

  TextEditingController mailController = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  bool isObsecurePass = true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ResetCubit(),
      child: Scaffold(
          //   backgroundColor: ColorHelper.darkpurple,
          body:
              BlocConsumer<ResetCubit, ResetStatus>(listener: (context, state) {
        if (state is ResetSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const SendMailToReset()),
          );
        } else if (state is ResetFailure) {
          CreateDialogToaster.showErrorToast(state.errorMessage);
        } else if (state is ResetLoading) {
          CreateDialogToaster.showErrorDialogDefult("loading", "wait Please");
        }
      }, builder: (context, state) {
        return SafeArea(
            child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  height: 140,
                  width: double.infinity,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        CircleAvatar(
                          backgroundColor: ColorHelper.purple,
                          child: const Icon(Icons.arrow_back_ios_new_rounded),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Text(
                          "Forget Password",
                          style: TextStyleHelper.textStylefontSize22
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                      ]),
                ),
                const SizedBox(
                  height: 30,
                ),
                Form(
                  key: formState,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomAllTextField(
                          labelText: "Email Address",
                          keyboardType: TextInputType.emailAddress,
                          textFieldController: mailController,
                          validatorFunction: (value) {
                            CheckEmptyValidationTextField.checkIsEmpty(value);
                            return null;
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomElevatedButton(
                        backColor: ColorHelper.lightPurple,
                        //  sideColor: ColorHelper.black,
                        fontColor: Colors.white,
                        fontWeight: FontWeight.bold,
                        buttonText: "Continue",
                        onPressedFunction: () async {
                          if (formState.currentState!.validate()) {
                            // context.read<LoginCubit>().login(Users(
                            //     email: mailController.text,
                            //     password: passwordController.text));
                            context
                                .read<ResetCubit>()
                                .resetPassword(mailController.text);
                            //  email: mailController.text,
                            //  password: passwordController.text);
                          }
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
      })),
    );
  }
}
