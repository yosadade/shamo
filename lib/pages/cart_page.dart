import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/card_cart.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget emptyCart() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon_empty_cart.png',
              width: 79,
            ),
            SizedBox(height: 20),
            Text('Opss! Your Cart is Empty',
                style: primaryTextStyle.copyWith(
                    fontSize: 16, fontWeight: medium)),
            SizedBox(height: 12),
            Text('Let\'s find your favorite shoes',
                style: secondaryTextStyle.copyWith(
                    fontSize: 14, fontWeight: regular)),
            SizedBox(height: 20),
            Container(
                width: 154,
                height: 44,
                child: TextButton(
                  child: Text(
                    'Explore Store',
                    style: primaryTextStyle.copyWith(
                        fontSize: 16, fontWeight: medium),
                  ),
                  style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: primaryColor),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/home', (route) => false);
                  },
                ))
          ],
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          CartCard(),
        ],
      );
    }

    Widget customBottomNav() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        height: 180,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Subtotal',
                    style: primaryTextStyle.copyWith(
                        fontSize: 14, fontWeight: semiBold)),
                Text('\$287,96',
                    style: priceTextStyle.copyWith(
                        fontSize: 14, fontWeight: regular)),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Divider(thickness: 0.5, color: subtitleColor),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    backgroundColor: primaryColor,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Continue to Checkout',
                        style: primaryTextStyle.copyWith(
                            fontSize: 16, fontWeight: semiBold)),
                    Icon(
                      Icons.arrow_forward,
                      color: primaryTextColor,
                    )
                  ],
                ),
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
        title: Text(
          'Your Cart',
          style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: medium),
        ),
        elevation: 0,
      ),
      body: content(),
      bottomNavigationBar: customBottomNav(),
    );
  }
}
