import 'package:ecommerce/controller/login/login_cubit.dart';
import 'package:ecommerce/controller/login/login_state.dart';
import 'package:ecommerce/controller/validatio_function.dart/validation_function.dart';
import 'package:ecommerce/helper/color_helper.dart';
import 'package:ecommerce/helper/text_style_helper.dart';
import 'package:ecommerce/views/ui/home.dart';

import 'package:ecommerce/views/ui/send_otp.dart';
import 'package:ecommerce/views/widget/shared_widget/custom_button.dart';
import 'package:ecommerce/views/widget/shared_widget/dialog_toast.dart';
import 'package:ecommerce/views/widget/shared_widget/text_form_field.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController passwordController = TextEditingController();

  TextEditingController mailController = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  bool isObsecurePass = true;

  bool isObsecureConfirmPass = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: Scaffold(
          //  backgroundColor: ColorHelper.darkpurple,
          body:
              BlocConsumer<LoginCubit, LoginStatus>(listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Home()),
          );
        } else if (state is LoginFailure) {
          CreateDialogToaster.showErrorToast(state.errorMessage);
        } else if (state is LoginLoading) {
          CreateDialogToaster.showErrorDialogDefult(
              "loading", "Please wait...");
        }
      }, builder: (context, state) {
        return SafeArea(
            child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                  width: double.infinity,
                  child: Text(
                    "Sign in",
                    style: TextStyleHelper.textStylefontSize24
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(
                  height: 40,
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
                      CustomAllTextField(
                          labelText: "Password",
                          isObsecure: isObsecurePass,
                          suffix: IconButton(
                            icon: isObsecurePass
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                isObsecurePass = !isObsecurePass;
                              });
                            },
                          ),
                          textFieldController: passwordController,
                          validatorFunction: (value) {
                            CheckEmptyValidationTextField.checkIsEmpty(value);
                            return null;
                          }),
                      const SizedBox(
                        height: 40,
                      ),
                      CustomElevatedButton(
                        backColor: ColorHelper.lightPurple,
                        alignButton: MainAxisAlignment.center,
                        // sideColor: ColorHelper.black,
                        fontColor: Colors.white,
                        fontWeight: FontWeight.bold,
                        buttonText: "Continue",
                        onPressedFunction: () async {
                          if (formState.currentState!.validate()) {
                            // context.read<LoginCubit>().login(Users(
                            //     email: mailController.text,
                            //     password: passwordController.text));
                            context
                                .read<LoginCubit>()
                                .loginWithEmailAndPassword(
                                    email: mailController.text,
                                    password: passwordController.text);
                          }
                        },
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Forget password ?",
                              style:
                                  TextStyleHelper.textStylefontSize14.copyWith(
                                fontWeight: FontWeight.bold,
                                color: ColorHelper.darkgrey,
                              )),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    (context),
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            const FordgetPassword()));
                              },
                              child: Text(
                                "Reset",
                                style: TextStyleHelper.textStylefontSize14
                                    .copyWith(
                                  color: Colors.white,
                                ),
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      InkWell(
                        onTap: context.read<LoginCubit>().loginWithGoogle,
                        child: Container(
                            width: double.infinity,
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                const Image(
                                  image: AssetImage(
                                      'assets/images/Google - png 0.png'),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                Text("Continue with Google",
                                    style: TextStyleHelper.textStylefontSize20
                                        .copyWith(
                                      fontWeight: FontWeight.bold,
                                    ))
                              ],
                            )),
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
