import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class CartCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                      image: AssetImage('assets/image_shoes.png'))),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Terrex Urban Low',
                    style: primaryTextStyle.copyWith(
                        fontSize: 14, fontWeight: semiBold),
                  ),
                  SizedBox(height: 2),
                  Text(
                    '\$143,98',
                    style: priceTextStyle.copyWith(
                        fontSize: 14, fontWeight: regular),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                GestureDetector(
                    onTap: () {},
                    child: Image.asset('assets/button_add.png', width: 16)),
                SizedBox(width: 2),
                Text(
                  '2',
                  style: primaryTextStyle.copyWith(
                      fontSize: 14, fontWeight: medium),
                ),
                SizedBox(width: 2),
                GestureDetector(
                    onTap: () {},
                    child: Image.asset('assets/button_min.png', width: 16)),
              ],
            )
          ],
        ),
        SizedBox(
          height: 12,
        ),
        Row(
          children: [
            Image.asset(
              'assets/icon_trash.png',
              width: 10,
            ),
            SizedBox(
              width: 4,
            ),
            Text('Remove', style: alertTextStyle.copyWith(fontSize: 12, fontWeight: light)),
          ],
        )
      ]),
    );
  }
}
