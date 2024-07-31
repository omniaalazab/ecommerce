import 'package:ecommerce/helper/color_helper.dart';

import 'package:ecommerce/views/ui/add_payment_method.dart';
import 'package:flutter/material.dart';

class SecuredCardDisplay extends StatelessWidget {
  final String cardNumber;
  final String cardTypeIcon;

  const SecuredCardDisplay({
    super.key,
    required this.cardNumber,
    required this.cardTypeIcon,
  });

  @override
  Widget build(BuildContext context) {
    String maskedCardNumber = cardNumber.length > 4
        ? "**** **** **** ${cardNumber.substring(cardNumber.length - 4)}"
        : cardNumber;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: BoxDecoration(
        color: ColorHelper.purple,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            maskedCardNumber,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
          Image.asset(
            cardTypeIcon,
            height: 24,
            width: 24,
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios),
            color: Colors.white,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const AddPaymentMethod()));
            },
          ),
        ],
      ),
    );
  }
}
