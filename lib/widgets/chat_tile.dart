import 'package:flutter/material.dart';
import 'package:shamo/pages/detail_chat.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/models/product_model.dart';

class ChatTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailChat(UninitializedProductModel())));
      },
      child: Container(
        margin: EdgeInsets.only(top: 33),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/icon_shop_logo.png', height: 54, width: 54),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Shoe Store',
                        style: primaryTextStyle.copyWith(
                            fontSize: 15, fontWeight: regular),
                      ),
                      Text(
                        'Good night, This item is on',
                        style: secondaryTextStyle.copyWith(
                            fontSize: 14, fontWeight: light),
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
                SizedBox(width: 24),
                Text(
                  'Now',
                  style: secondaryTextStyle.copyWith(
                      fontSize: 10, fontWeight: regular),
                )
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Divider(
              thickness: 1,
              color: Color(0xff2B2939),
            )
          ],
        ),
      ),
    );
  }
}
