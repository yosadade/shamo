import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/providers/cart_provider.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/cart_card.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    CartProvider cartProvider = Provider.of<CartProvider>(context);

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
        children: cartProvider.carts.map((cart) => CartCard(cart)).toList()
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
                Text('\$${cartProvider.totalPrice()}',
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
                onPressed: () {
                  Navigator.pushNamed(context, '/checkout');
                },
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
      body: cartProvider.carts.length == 0 ? emptyCart() :content(),
      bottomNavigationBar: cartProvider.carts.length == 0 ? SizedBox() : customBottomNav(),
    );
  }
}
