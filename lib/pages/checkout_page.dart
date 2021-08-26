import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/checkout_cart.dart';

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          SizedBox(height: defaultMargin,),
          Text('List Items', style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),),
          CheckoutCart()
        ],
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: AppBar(
        backgroundColor: backgroundColor1,
        elevation: 0,
        centerTitle: true,
        title: Text('Checkout Details', style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: medium),),
      ),
      body: content(),
    );
  }
}