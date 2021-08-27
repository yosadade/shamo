import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class CheckoutSuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    content() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/icon_empty_cart.png', width: 69),
            SizedBox(
              height: 20,
            ),
            Text(
              'You made a transaction',
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Stay at home while we',
              style:
                  subtitleTextStyle.copyWith(fontSize: 14, fontWeight: regular),
            ),
            Text('prepare your dream shoes',
                style: subtitleTextStyle.copyWith(
                    fontSize: 14, fontWeight: regular)),
            Container(
              margin: EdgeInsets.only(top: defaultMargin),
              height: 44,
              width: 196,
              decoration: BoxDecoration(
                  color: primaryColor, borderRadius: BorderRadius.circular(12)),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/home', (route) => false);
                },
                child: Text('Order Other Shoes',
                    style: primaryTextStyle.copyWith(
                        fontSize: 16, fontWeight: medium)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 12),
              height: 44,
              width: 196,
              decoration: BoxDecoration(
                  color: Color(0xff39374B), borderRadius: BorderRadius.circular(12)),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/checkout-success', (route) => false);
                },
                child: Text('View My Order',
                    style: primaryTextStyle.copyWith(
                        fontSize: 16, fontWeight: medium, color: Color(0xffB7B6BF))),
              ),
            )
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
        title: Text(
          'Checkout Success',
          style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: medium),
        ),
      ),
      body: content(),
    );
  }
}
