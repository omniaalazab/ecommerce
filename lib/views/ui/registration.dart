import 'package:ecommerce/controller/Users/user_cubit.dart';
import 'package:ecommerce/controller/registration/registeration_cubit.dart';
import 'package:ecommerce/controller/registration/registration_state.dart';
import 'package:ecommerce/controller/validatio_function.dart/validation_function.dart';
import 'package:ecommerce/helper/color_helper.dart';
import 'package:ecommerce/helper/text_style_helper.dart';
import 'package:ecommerce/views/ui/login.dart';
import 'package:ecommerce/views/widget/shared_widget/custom_button.dart';
import 'package:ecommerce/views/widget/shared_widget/dialog_toast.dart';
import 'package:ecommerce/views/widget/shared_widget/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController firstNameController = TextEditingController();

  TextEditingController mailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  bool isObsecurePass = true;
  bool isObsecureConf = true;

  bool isObsecureConfirmPass = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => RegistrationCubit(),
        child: Scaffold(
          //  backgroundColor: HexColor('1D182A'),
          body: BlocConsumer<RegistrationCubit, RegistrationStatus>(
              listener: (context, state) {
            if (state is RegistrationSuccess) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LogIn()),
              );
            } else if (state is RegistrationLoading) {
              CreateDialogToaster.showErrorDialogDefult(
                  "loading", "Please wait...");
            } else if (state is RegistrationFailure) {
              if (state.error == 'weak-password') {
                CreateDialogToaster.showErrorToast("password very weak");
              } else if (state.error == 'email-already-in-use') {
                CreateDialogToaster.showErrorToast(
                    " This mail account is already used , please use  another account");
              } else {
                CreateDialogToaster.showErrorToast(state.error);
              }
            }
          }, builder: (context, state) {
            return SingleChildScrollView(
              child: SafeArea(
                  child: Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10.0, 20, 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                child: const Icon(
                                    Icons.arrow_back_ios_new_rounded),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Text(
                                "Create Account",
                                style: TextStyleHelper.textStylefontSize22
                                    .copyWith(fontWeight: FontWeight.w700),
                              ),
                            ]),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Form(
                        key: formState,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomAllTextField(
                                labelText: "Firstname",
                                textFieldController: firstNameController,
                                validatorFunction: (value) {
                                  CheckEmptyValidationTextField.checkIsEmpty(
                                      value);
                                  return null;
                                }),
                            const SizedBox(
                              height: 15,
                            ),
                            CustomAllTextField(
                                labelText: "LastName",
                                textFieldController: lastNameController,
                                validatorFunction: (value) {
                                  CheckEmptyValidationTextField.checkIsEmpty(
                                      value);
                                  return null;
                                }),
                            const SizedBox(
                              height: 15,
                            ),
                            CustomAllTextField(
                                labelText: "Email",
                                textFieldController: mailController,
                                validatorFunction: (value) {
                                  CheckEmptyValidationTextField.checkIsEmpty(
                                      value);
                                  return null;
                                }),
                            const SizedBox(
                              height: 15,
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
                                  CheckEmptyValidationTextField.checkIsEmpty(
                                      value);
                                  if (value!.length < 8) {
                                    return "password is weak";
                                  }
                                  return null;
                                }),
                            const SizedBox(
                              height: 15,
                            ),
                            CustomAllTextField(
                                labelText: "Confirm Password",
                                isObsecure: isObsecureConf,
                                suffix: IconButton(
                                  icon: isObsecureConf
                                      ? const Icon(Icons.visibility)
                                      : const Icon(Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      isObsecureConf = !isObsecureConf;
                                    });
                                  },
                                ),
                                textFieldController: confirmPasswordController,
                                validatorFunction: (value) {
                                  CheckEmptyValidationTextField.checkIsEmpty(
                                      value);
                                  if (passwordController.text != value) {
                                    return "dosen't match password ";
                                  }
                                  return null;
                                }),
                            const SizedBox(
                              height: 25,
                            ),
                            CustomElevatedButton(
                              backColor: ColorHelper.lightPurple,
                              alignButton: MainAxisAlignment.center,
                              //sideColor: HexColor('8E6CEF').withOpacity(.5),
                              fontColor: Colors.white,
                              fontWeight: FontWeight.bold,
                              buttonText: "Continue",
                              onPressedFunction: () async {
                                if (formState.currentState!.validate()) {
                                  // context
                                  //     .read<RegistrationCubit>()
                                  //     .registration(Users(
                                  //       email: mailController.text,
                                  //       password:
                                  //           passwordRegistrationController.text,
                                  //       userName: userNameController.text,
                                  //       phoneNo: phoneNumberRegistrationController
                                  //           .text,
                                  //       cityName: selectedDropmenuController.text,
                                  //       cityId: selectedCityId,
                                  //     ));
                                  context.read<UserCubit>().addUser(
                                      mailController.text,
                                      firstNameController.text,
                                      passwordController.text,
                                      lastNameController.text);
                                  context
                                      .read<RegistrationCubit>()
                                      .registerWithEmailAndPassword(
                                          email: mailController.text,
                                          password: passwordController.text);
                                }
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(" Have Already Account",
                                    style: TextStyleHelper.textStylefontSize14
                                        .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: ColorHelper.grey,
                                    )),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          (context),
                                          MaterialPageRoute(
                                              builder: (_) => const LogIn()));
                                    },
                                    child: Text(
                                      "Sign in",
                                      style: TextStyleHelper.textStylefontSize14
                                          .copyWith(
                                        color: HexColor('8E6CEF'),
                                      ),
                                    )),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )),
            );
          }),
        ));
  }
}
