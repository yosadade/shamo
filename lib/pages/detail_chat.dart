import 'package:flutter/material.dart';
import 'package:shamo/models/product_model.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/chat_buble.dart';

class DetailChat extends StatefulWidget {
  ProductModel product;
  DetailChat(this.product);

  @override
  _DetailChatState createState() => _DetailChatState();
}

class _DetailChatState extends State<DetailChat> {
  @override
  Widget build(BuildContext context) {
    Widget productPreview() {
      return Container(
        width: 225,
        height: 74,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 20, top: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: primaryColor),
          color: backgroundColor5,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  widget.product.galleries![0].url,
                  width: 54,
                )),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.name!,
                    style: primaryTextStyle.copyWith(
                        fontSize: 14, fontWeight: regular),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(width: 2),
                  Text(
                    '\$${widget.product.price}',
                    style: priceTextStyle.copyWith(
                        fontSize: 14, fontWeight: medium),
                  ),
                ],
              ),
            ),
            GestureDetector(
                onTap: () {
                  setState(() {
                    widget.product = UninitializedProductModel();
                  });
                },
                child: Image.asset('assets/button_close.png', width: 22))
          ],
        ),
      );
    }

    Widget chatInput() {
      return Container(
        margin: EdgeInsets.all(20),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.product is UninitializedProductModel
                  ? SizedBox()
                  : productPreview(),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 45,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
            ]),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          ChatBubble(
              isSender: true,
              hasProduct: true,
              text: 'Hi, This item is still available?'),
          ChatBubble(
              isSender: false,
              text:
                  'Good night, This item is only available in size 42 and 43'),
        ],
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
      body: content(),
      bottomNavigationBar: chatInput(),
    );
  }
}
