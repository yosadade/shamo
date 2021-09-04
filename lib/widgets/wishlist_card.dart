import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/product_model.dart';
import 'package:shamo/providers/wishlist_provider.dart';
import 'package:shamo/theme.dart';

class WishlistCard extends StatelessWidget {
  final ProductModel product;

  WishlistCard(this.product);

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: backgroundColor4),
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(top: 10, bottom: 14, left: 12, right: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(product.galleries![0].url, width: 60)),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name!,
                  style: primaryTextStyle.copyWith(
                      fontSize: 14, fontWeight: semiBold),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(width: 2),
                Text(
                  '\$${product.price}',
                  style: priceTextStyle.copyWith(
                      fontSize: 14, fontWeight: regular),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              wishlistProvider.setProduct(product);
            },
            child: Image.asset(
              'assets/button_whislist_blue.png',
              width: 34,
            ),
          )
        ],
      ),
    );
  }
}
