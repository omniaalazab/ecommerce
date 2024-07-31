import 'package:ecommerce/controller/notification/notification_cubit.dart';
import 'package:ecommerce/controller/notification/notification_state.dart';
import 'package:ecommerce/helper/color_helper.dart';
import 'package:ecommerce/helper/text_style_helper.dart';

import 'package:ecommerce/views/ui/categories.dart';
import 'package:ecommerce/views/ui/notification_details.dart';
import 'package:ecommerce/views/widget/shared_widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  void initState() {
    context.read<NotificationCubit>().initialize();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: ColorHelper.darkpurple,
        body: BlocBuilder<NotificationCubit, NotificationState>(
            builder: (context, state) {
      if (state.notificationModel.isEmpty) {
        return Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Image(
              image: AssetImage(
                "assets/images/bell 1.png",
              ),
              height: 250,
              width: 100,
            ),
            Text(
              "No Notification  yet",
              style: TextStyleHelper.textStylefontSize20
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 70,
            ),
            CustomElevatedButton(
              buttonText: "Explore categories",
              alignButton: MainAxisAlignment.center,
              fontWeight: FontWeight.w500,
              textSize: 18,
              onPressedFunction: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const ShopByCategory()));
              },
              backColor: ColorHelper.lightPurple,
              fontColor: Colors.white,
              widthButton: 50,
            )
          ]),
        );
      } else {
        return Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Text("Notification",
                    style: TextStyleHelper.textStylefontSize20
                        .copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 40,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.notificationModel.length,
                    itemBuilder: (context, index) {
                      final notificationModel = state.notificationModel[index];

                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: ColorHelper.purple,
                              borderRadius: BorderRadius.circular(20)),
                          child: ListTile(
                            leading:
                                const Icon(Icons.notifications_active_rounded),
                            title: Text(
                              '${notificationModel.title} ',
                              style: TextStyleHelper.textStylefontSize15,
                            ),
                            subtitle: Text('${notificationModel.body} '),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NotificationDetailPage(
                                    notification: notificationModel,
                                  ),
                                ),
                              );
                              const SizedBox(
                                height: 40,
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      }
    }));
  }
}
