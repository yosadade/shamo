import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/providers/auth_provider.dart';
import 'package:shamo/providers/cart_provider.dart';
import 'package:shamo/providers/transaction_provider.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/checkout_card.dart';
import 'package:shamo/widgets/loading_button.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleCheckout() async {
      setState(() {
        isLoading = true;
      });

      if (await transactionProvider.checkout(
        authProvider.user.token,
        cartProvider.carts,
        cartProvider.totalPrice(),
      )) {
        cartProvider.carts = [];
        Navigator.pushNamedAndRemoveUntil(
            context, '/checkout-success', (route) => false);
      }

      setState(() {
        isLoading = false;
      });
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          Container(
            margin: EdgeInsets.only(top: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'List Items',
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: medium),
                ),
                Column(
                    children: cartProvider.carts
                        .map((cart) => CheckoutCard(cart))
                        .toList()),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: defaultMargin),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: backgroundColor4,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Address Details',
                    style: primaryTextStyle.copyWith(
                        fontSize: 16, fontWeight: medium)),
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Image.asset('assets/icon_store_location.png',
                            width: 40),
                        Image.asset('assets/icon_line.png', height: 30),
                        Image.asset('assets/icon_your_address.png', width: 40),
                      ],
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Store Location',
                              style: secondaryTextStyle.copyWith(
                                  fontSize: 12, fontWeight: light),
                            ),
                            SizedBox(
                              height: 1,
                            ),
                            Text('Adidas Core',
                                style: primaryTextStyle.copyWith(
                                    fontSize: 14, fontWeight: medium)),
                          ],
                        ),
                        SizedBox(
                          height: defaultMargin,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Your Address',
                              style: secondaryTextStyle.copyWith(
                                  fontSize: 12, fontWeight: light),
                            ),
                            SizedBox(
                              height: 1,
                            ),
                            Text('Marsemoon',
                                style: primaryTextStyle.copyWith(
                                    fontSize: 14, fontWeight: medium)),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: defaultMargin),
            padding: EdgeInsets.all(29),
            decoration: BoxDecoration(
              color: backgroundColor4,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Payment Summary',
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: medium),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Product Quantity',
                        style: secondaryTextStyle.copyWith(
                            fontSize: 12, fontWeight: regular)),
                    Text('${cartProvider.totalItems()} Items',
                        style: primaryTextStyle.copyWith(
                            fontSize: 14, fontWeight: medium)),
                  ],
                ),
                SizedBox(
                  height: 13,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Product Price',
                        style: secondaryTextStyle.copyWith(
                            fontSize: 12, fontWeight: regular)),
                    Text('\$${cartProvider.totalPrice()}',
                        style: primaryTextStyle.copyWith(
                            fontSize: 14, fontWeight: medium)),
                  ],
                ),
                SizedBox(
                  height: 13,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Shipping',
                        style: secondaryTextStyle.copyWith(
                            fontSize: 12, fontWeight: regular)),
                    Text('Free',
                        style: primaryTextStyle.copyWith(
                            fontSize: 14, fontWeight: medium)),
                  ],
                ),
                SizedBox(
                  height: 11,
                ),
                Divider(thickness: 0.5, color: subtitleColor),
                SizedBox(
                  height: 11,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total',
                        style: priceTextStyle.copyWith(
                            fontSize: 14, fontWeight: semiBold)),
                    Text('\$${cartProvider.totalPrice()}',
                        style: priceTextStyle.copyWith(
                            fontSize: 14, fontWeight: semiBold)),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: defaultMargin,
          ),
          Divider(thickness: 0.5, color: subtitleColor),
          isLoading
              ? Container(
                margin: EdgeInsets.only(bottom: defaultMargin),
                child: LoadingButton())
              : Container(
                  margin: EdgeInsets.symmetric(vertical: defaultMargin),
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(12)),
                  child: TextButton(
                    onPressed: handleCheckout,
                    child: Text('Checkout Now',
                        style: primaryTextStyle.copyWith(
                            fontSize: 16, fontWeight: semiBold)),
                  ),
                )
        ],
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: AppBar(
        backgroundColor: backgroundColor1,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Checkout Details',
          style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: medium),
        ),
      ),
      body: content(),
    );
  }
}
