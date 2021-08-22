import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class WishlistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
          backgroundColor: backgroundColor1,
          centerTitle: true,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Text('Favorite Shoes',
              style:
                  primaryTextStyle.copyWith(fontSize: 18, fontWeight: medium)));
    }

    Widget emptyWishlist() {
      return Expanded(
        child: Container(
          color: backgroundColor3,
          width: double.infinity,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(
              'assets/icon_love.png',
              width: 74,
            ),
            SizedBox(
              height: 23,
            ),
            Text(
              'You don\'t have dream shoes?',
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Let\'s find your favorite shoes',
              style: secondaryTextStyle.copyWith(
                  fontSize: 14, fontWeight: regular),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 44,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                child: Text(
                  'Explore Store',
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: medium),
                ),
              ),
            )
          ]),
        ),
      );
    }

    return Column(
      children: [header(), emptyWishlist()],
    );
  }
}
