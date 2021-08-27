import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class CheckoutSuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    content(){
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/icon_empty_cart.png', width: 69),
            SizedBox(height: 20,),
            Text('You made a transaction', style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),),
            SizedBox(height: 12,),
            Text('Stay at home while we', style: subtitleTextStyle.copyWith(fontSize: 14, fontWeight: regular),),
            Text('prepare your dream shoes', style: subtitleTextStyle.copyWith(fontSize: 14, fontWeight: regular)),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        elevation: 0,
        title: Text('Checkout Success', style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: medium),
        ),
      ),
      body: content(),
    );
  }
}