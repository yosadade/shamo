import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class DetailChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget chatInput() {
      return Container(
        margin: EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 45,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                    color: backgroundColor4,
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: TextFormField(
                    decoration: InputDecoration.collapsed(
                        hintText: 'Typle Message...',
                        hintStyle: subtitleTextStyle.copyWith(
                            fontSize: 14, fontWeight: regular)),
                  ),
                ),
              ),
            ),
            SizedBox(width: 20),
            Image.asset('assets/button_send.png', width: 45, height: 45)
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: PreferredSize(
        child: AppBar(
          backgroundColor: backgroundColor1,
          centerTitle: true,
          title: Row(
            children: [
              Image.asset('assets/image_shop_logo_online.png',
                  width: 50, height: 50),
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shoe Store',
                    style: primaryTextStyle.copyWith(
                        fontSize: 14, fontWeight: medium),
                  ),
                  Text(
                    'Online',
                    style: secondaryTextStyle.copyWith(
                        fontSize: 14, fontWeight: light),
                  )
                ],
              )
            ],
          ),
        ),
        preferredSize: Size.fromHeight(70),
      ),
      bottomNavigationBar: chatInput(),
    );
  }
}
