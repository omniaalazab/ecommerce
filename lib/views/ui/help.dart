import 'package:ecommerce/helper/text_style_helper.dart';
import 'package:ecommerce/views/widget/shared_widget/custom_title_pagerow.dart';
import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                TitlePageRow(
                    pageTitle: "Help",
                    onPressedBackButton: () {
                      Navigator.pop(context);
                    }),
                const SizedBox(
                  height: 30,
                ),
                Text("Welcome to E-Commerce Help & Support!",
                    style: TextStyleHelper.textStylefontSize20
                        .copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 10,
                ),
                Text(
                    "Thank you for choosing [Your App Name] for your shopping needs. We're here to ensure you have a seamless and enjoyable experience. Whether you're browsing for the latest products, managing your account, or tracking your orders, our Help & Support page is designed to assist you every step of the way.",
                    style: TextStyleHelper.textStylefontSize14),
                const SizedBox(
                  height: 10,
                ),
                Text("How to Use This Help Page:",
                    style: TextStyleHelper.textStylefontSize20
                        .copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 10,
                ),
                HelpRow(
                  helpRowTitle:
                      "Browse the Sections: Navigate through different sections to find answers to your queries.",
                ),
                const SizedBox(
                  height: 10,
                ),
                HelpRow(
                  helpRowTitle:
                      "Search for Help: Use the search bar at the top to quickly find specific information.",
                ),
                const SizedBox(
                  height: 10,
                ),
                HelpRow(
                  helpRowTitle:
                      "Contact Us: If you can't find what you're looking for, our support team is here to help. ",
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                    "We're committed to providing you with the best service possible. Happy shopping!",
                    style: TextStyleHelper.textStylefontSize14),
                const SizedBox(
                  height: 10,
                ),
              ],
            )));
  }
}

class HelpRow extends StatelessWidget {
  HelpRow({
    required this.helpRowTitle,
    super.key,
  });
  String helpRowTitle;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      // width: MediaQuery.of(context).size.width * .9,
      child: Row(
        children: [
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Text(
              "Search for Help: Use the search bar at the top to quickly find specific information.",
              style: TextStyleHelper.textStylefontSize14
                  .copyWith(fontWeight: FontWeight.w400),
              overflow: TextOverflow.visible,
            ),
          ),
        ],
      ),
    );
  }
}
