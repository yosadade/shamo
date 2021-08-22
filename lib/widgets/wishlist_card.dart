import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class WishlistCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              child: Image.asset('assets/image_shoes.png', width: 60)),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Terrex Urban Low',
                  style: primaryTextStyle.copyWith(
                      fontSize: 14, fontWeight: semiBold),
                  overflow: TextOverflow.ellipsis,

                ),
                SizedBox(width: 2),
                Text(
                  '\$143,98',
                  style: priceTextStyle.copyWith(
                      fontSize: 14, fontWeight: regular),
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/button_whislist_blue.png',
            width: 34,
          )
        ],
      ),
    );
  }
}
