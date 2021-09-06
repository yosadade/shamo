import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/cart_model.dart';
import 'package:shamo/providers/cart_provider.dart';
import 'package:shamo/theme.dart';

class CartCard extends StatelessWidget {
  final CartModel cart;
  CartCard(this.cart);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    return Container(
      margin: EdgeInsets.only(top: defaultMargin),
      decoration: BoxDecoration(
        color: backgroundColor4,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Column(children: [
        Row(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      image: NetworkImage(cart.product!.galleries![0].url))),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cart.product!.name!,
                    style: primaryTextStyle.copyWith(
                        fontSize: 14, fontWeight: semiBold),
                  ),
                  SizedBox(height: 2),
                  Text(
                    '\$${cart.product!.price}',
                    style: priceTextStyle.copyWith(
                        fontSize: 14, fontWeight: regular),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                GestureDetector(
                    onTap: () {
                      cartProvider.addQuantity(cart.id!);
                    },
                    child: Image.asset('assets/button_add.png', width: 16)),
                SizedBox(width: 2),
                Text(
                  cart.quantity.toString(),
                  style: primaryTextStyle.copyWith(
                      fontSize: 14, fontWeight: medium),
                ),
                SizedBox(width: 2),
                GestureDetector(
                    onTap: () {
                      cartProvider.reduceQuantity(cart.id!);
                    },
                    child: Image.asset('assets/button_min.png', width: 16)),
              ],
            )
          ],
        ),
        SizedBox(
          height: 12,
        ),
        GestureDetector(
          onTap: () {
            cartProvider.removeCart(cart.id!);
          },
          child: Row(
            children: [
              Image.asset(
                'assets/icon_trash.png',
                width: 10,
              ),
              SizedBox(
                width: 4,
              ),
              Text('Remove',
                  style:
                      alertTextStyle.copyWith(fontSize: 12, fontWeight: light)),
            ],
          ),
        )
      ]),
    );
  }
}
