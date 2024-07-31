import 'package:ecommerce/controller/Users/user_cubit.dart';
import 'package:ecommerce/controller/auth/signout_cubit.dart';
import 'package:ecommerce/controller/profile/profile_cubit.dart';
import 'package:ecommerce/controller/profile/profile_state.dart';
import 'package:ecommerce/controller/send_mail_function.dart';
import 'package:ecommerce/controller/users/user_state.dart';
import 'package:ecommerce/helper/text_style_helper.dart';
import 'package:ecommerce/views/ui/help.dart';
import 'package:ecommerce/views/ui/show_address.dart';
import 'package:ecommerce/views/ui/show_payment.dart';
import 'package:ecommerce/views/ui/wish_list.dart';
import 'package:ecommerce/views/widget/shared_widget/dialog_toast.dart';
import 'package:ecommerce/views/widget/shared_widget/setting_container_row.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    context.read<UserCubit>().fetchUserData();
    context.read<ProfileCubit>().fetchProfileImage(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 80),
            BlocConsumer<ProfileCubit, ProfileStatus>(
              listener: (context, state) {
                if (state is ProfileFailure) {
                  CreateDialogToaster.showErrorToast("Oops, There is error");
                }
              },
              builder: (context, state) {
                if (state is ProfileSuccess) {
                  return InkWell(
                    onTap: () {
                      context.read<ProfileCubit>().changeProfileImage(context);
                    },
                    child: CircleAvatar(
                      backgroundImage: state.imageProvider,
                      radius: 35,
                    ),
                  );
                }
                return InkWell(
                  onTap: () {
                    context.read<ProfileCubit>().changeProfileImage(context);
                  },
                  child: const CircleAvatar(
                    backgroundImage: AssetImage("assets/images/Ellipse 13.png"),
                    radius: 35,
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BlocBuilder<UserCubit, UserState>(
                      builder: (context, state) {
                        if (state.user.isNotEmpty) {
                          return Container(
                            alignment: Alignment.topLeft,
                            child: Column(
                              children: [
                                Text(state.user[0].userName),
                                const SizedBox(height: 10),
                                Text("${user!.email}"),
                              ],
                            ),
                          );
                        } else {
                          return const CircularProgressIndicator();
                        }
                      },
                    ),
                    const SizedBox(height: 40),
                    Column(
                      children: [
                        SettingContainerRow(
                          rowTitle: "Address",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const ShowAddressInfo()),
                            );
                          },
                        ),
                        const SizedBox(height: 15),
                        SettingContainerRow(
                          rowTitle: "WishList",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const Wishlist()),
                            );
                          },
                        ),
                        const SizedBox(height: 15),
                        SettingContainerRow(
                          rowTitle: "Payment",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const ShowPaymentInfo()),
                            );
                          },
                        ),
                        const SizedBox(height: 15),
                        SettingContainerRow(
                          rowTitle: "Help",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const Help()),
                            );
                          },
                        ),
                        const SizedBox(height: 15),
                        SettingContainerRow(
                          rowTitle: "Support",
                          onPressed: () {
                            EcommerceSendMail.sendMail(
                              toEmail: 'abdallahzidano176@gmail.com',
                              subject: '',
                              body: '',
                            );
                          },
                        ),
                        BlocBuilder<UserCubit, UserState>(
                          builder: (context, state) {
                            return Container(
                              alignment: Alignment.center,
                              child: TextButton(
                                onPressed: () {
                                  context.read<AuthCubit>().signOut();
                                },
                                child: Text(
                                  "SignOut",
                                  style: TextStyleHelper.textStylefontSize18
                                      .copyWith(color: Colors.red),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
