import 'dart:developer';

import 'package:ecommerce/controller/Users/user_cubit.dart';
import 'package:ecommerce/controller/address/address_cubit.dart';
import 'package:ecommerce/controller/auth/signout_cubit.dart';
import 'package:ecommerce/controller/card/add_to_card_cubit.dart';
import 'package:ecommerce/controller/favourite/favourite_cubit.dart';
import 'package:ecommerce/controller/get_specific_product.dart';
import 'package:ecommerce/controller/login/login_cubit.dart';

import 'package:ecommerce/controller/notification/notification_cubit.dart';
import 'package:ecommerce/controller/order/order_cubit.dart';
import 'package:ecommerce/controller/payment/payment_cubit.dart';
import 'package:ecommerce/controller/profile/profile_cubit.dart';
import 'package:ecommerce/controller/registration/registeration_cubit.dart';
import 'package:ecommerce/controller/search/search_cubit.dart';
import 'package:ecommerce/controller/theme_cubit.dart';
import 'package:ecommerce/helper/color_helper.dart';
import 'package:ecommerce/views/ui/auth_handler.dart';

import 'package:firebase_app_check/firebase_app_check.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  getToken();
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.playIntegrity,
  );

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
        // Add other providers here
      ],
      child: const ECommerce(),
    ),
  );
  // runApp(const ECommerce());
}

getToken() async {
  try {
    String? myToken = await FirebaseMessaging.instance.getToken();
    // String token = await Candidate().getToken();
    log("==================================");
    log('$myToken');
  } catch (e) {
    log(e.toString());
  }
}

class ECommerce extends StatelessWidget {
  const ECommerce({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LoginCubit(),
          ),
          BlocProvider(
            create: (context) => RegistrationCubit(),
          ),
          BlocProvider(
            create: (context) => CardCubit(),
          ),
          BlocProvider(create: (_) => AddressCubit()),
          BlocProvider(create: (_) => PaymentCubit()),
          BlocProvider(create: (_) => NotificationCubit()),
          BlocProvider(create: (_) => OrderCubit()),
          BlocProvider(create: (_) => ProfileCubit()),
          BlocProvider(create: (_) => ThemeCubit()),
          BlocProvider(create: (_) => UserCubit()),
          BlocProvider(create: (_) => FavoriteCubit()),
          BlocProvider(create: (_) => AuthCubit()),
          BlocProvider(create: (_) => SearchCubit()),
          BlocProvider(create: (_) => GetSpecificProductCubit()),
        ],
        child:
            BlocBuilder<ThemeCubit, ThemeMode>(builder: (context, themeMode) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: themeMode,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              scaffoldBackgroundColor: Colors.white,
              brightness: Brightness.light,
            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.deepPurple,
              scaffoldBackgroundColor: ColorHelper.darkpurple,
              brightness: Brightness.dark,
            ),
            home: const AuthStateHandler(),
          );
        }));
  }
}
