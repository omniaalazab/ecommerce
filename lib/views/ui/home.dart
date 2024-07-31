// import 'package:ecommerce/helper/color_helper.dart';
// import 'package:ecommerce/helper/text_style_helper.dart';
// import 'package:ecommerce/views/widget/shared_widget/custom_circleavatar.dart';
// import 'package:ecommerce/views/widget/shared_widget/custom_feature_card.dart';
// import 'package:ecommerce/views/widget/shared_widget/text_field.dart';
// import 'package:flutter/material.dart';

// class Home extends StatelessWidget {
//   Home({super.key});
//   TextEditingController searchController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       // appBar: AppBar(
//       //   title: Text(
//       //     'Home Page',
//       //     style: TextStyleHelper.textStylefontSize16,
//       //   ),
//       //   centerTitle: true,
//       //   backgroundColor: Colors.white,
//       //   leading: const Icon(Icons.menu_rounded),
//       //   actions: const [
//       //     SizedBox(
//       //       width: 10,
//       //     ),
//       //     Icon(Icons.notifications_none),
//       //     SizedBox(
//       //       width: 10,
//       //     ),
//       //     Icon(Icons.send_rounded),
//       //     SizedBox(
//       //       width: 10,
//       //     ),
//       //   ],
//       // ),
//       body: Padding(
//           padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
//           child: ListView(
//             children: [
//               Column(
//                 children: [
//                   CustomAllTextField(
//                     labelText: "Search Something",
//                     textFieldController: searchController,
//                     prefix: const Icon(
//                       Icons.search_rounded,
//                       size: 30,
//                     ),
//                     validatorFunction: (value) {
//                       return null;
//                     },
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       //  Column(children: [],)
//                       Text(
//                         "Feature",
//                         style: TextStyleHelper.textStylefontSize14.copyWith(
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                       Text(
//                         "Sea All",
//                         style: TextStyleHelper.textStylefontSize14.copyWith(
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       FeatureCard(
//                         imagePath: 'assets/images/shirt.png',
//                         price: "\$30.0",
//                         productName: "Man Long Shirt",
//                       ),
//                       FeatureCard(
//                         imagePath: 'assets/images/clock.png',
//                         price: "\$100.0",
//                         productName: "Man Watch clock",
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 70,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           "Category",
//                           style: TextStyleHelper.textStylefontSize18.copyWith(
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Text(
//                           "Sea All",
//                           style: TextStyleHelper.textStylefontSize22.copyWith(
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 60,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         CircleAvatarCategory(
//                           imagePath: 'assets/images/dress.png',
//                           color: const Color.fromARGB(255, 155, 189, 216),
//                         ),
//                         CircleAvatarCategory(
//                           imagePath: 'assets/images/shoeses.png',
//                           color: const Color.fromARGB(255, 185, 150, 185),
//                         ),
//                         CircleAvatarCategory(
//                           imagePath: 'assets/images/tshirt.png',
//                           color: const Color.fromARGB(255, 165, 187, 114),
//                         ),
//                         CircleAvatarCategory(
//                           imagePath: 'assets/images/pants.png',
//                           color: const Color.fromARGB(255, 85, 107, 44),
//                         ),
//                         CircleAvatarCategory(
//                           imagePath: 'assets/images/tie.png',
//                           color: const Color.fromARGB(255, 255, 255, 255),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           )),
//     );
//   }
// }
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:ecommerce/helper/color_helper.dart';
import 'package:ecommerce/views/ui/home_detail.dart';
import 'package:ecommerce/views/ui/notification.dart';
import 'package:ecommerce/views/ui/order.dart';
import 'package:ecommerce/views/ui/setting.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Home> {
  int selectedIndex = 0;
  List<String> imagePath = [
    "assets/images/Frame 50.png",
    "assets/images/Frame 54.png",
    "assets/images/Frame 52.png",
    "assets/images/Frame 53.png",
  ];
  List<Map<String, dynamic>> screens = [
    {
      'screen': const HomeDetails(),
    },
    {
      'screen': const NotificationPage(),
    },
    {
      'screen': Order(
        numberOfOrdedItems: 0,
        address: "",
      ),
    },
    {
      'screen': const Setting(),
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        //  backgroundColor: ColorHelper.darkpurple,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        itemCount: imagePath.length,
        tabBuilder: (index, isActive) {
          return Image(
              image: AssetImage(imagePath[index]),
              color: isActive ? ColorHelper.lightPurple : ColorHelper.darkgrey);
        },
        activeIndex: selectedIndex,
        gapLocation: GapLocation.none,
        notchSmoothness: NotchSmoothness.smoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,

        // currentIndex: SelectedIndex,
        // items: [
        //   BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        //   BottomNavigationBarItem(
        //       icon: Icon(Icons.add_chart), label: 'Order'),
        //   BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        // ],
      ),
      body: Center(
        // child: Padding(
        //   padding: const EdgeInsets.all(4),
        child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: screens[selectedIndex]['screen']),
        // ),
      ),
    );
  }
}
