import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/product_model.dart';
import 'package:shamo/providers/wishlist_provider.dart';
import 'package:shamo/providers/cart_provider.dart';
import 'package:shamo/theme.dart';

class ProductPage extends StatefulWidget {

  final ProductModel product;

  ProductPage(this.product);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List images = [
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png'
  ];

  List familiarShoes = [
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png'
  ];

  int currentIndex = 0;
  // bool isWishList = false;

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    Future<void> showSuccessDialog() async {
      return showDialog(
          context: context,
          builder: (BuildContext context) => Container(
                width: MediaQuery.of(context).size.width - (2 * defaultMargin),
                child: AlertDialog(
                  backgroundColor: backgroundColor3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  content: SingleChildScrollView(
                      child: Column(children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          Icons.close,
                          color: primaryTextColor,
                        ),
                      ),
                    ),
                    Image.asset('assets/icon_success.png', width: 100),
                    SizedBox(
                      height: 12,
                    ),
                    Text('Hurray :)',
                        style: primaryTextStyle.copyWith(
                            fontSize: 18, fontWeight: semiBold)),
                    SizedBox(
                      height: 12,
                    ),
                    Text('Item added successfully',
                        style: secondaryTextStyle.copyWith(
                            fontSize: 14, fontWeight: regular)),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 154,
                      height: 44,
                      child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/cart');
                          },
                          style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 24,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              backgroundColor: primaryColor),
                          child: Text(
                            'View My Cart',
                            style: primaryTextStyle.copyWith(
                                fontSize: 16, fontWeight: medium),
                          )),
                    )
                  ])),
                ),
              ));
    }

    Widget indicator(int index) {
      return Container(
        width: currentIndex == index ? 16 : 4,
        height: 4,
        margin: EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: currentIndex == index ? primaryColor : Color(0xffC4C4C4),
        ),
      );
    }

    Widget familiarShoesCard(String imageUrl) {
      return Container(
        width: 54,
        height: 54,
        margin: EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            image: DecorationImage(image: AssetImage(imageUrl))),
      );
    }

    Widget header() {
      int index = -1;

      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(
                top: 25, left: defaultMargin, right: defaultMargin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.chevron_left,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.shopping_bag,
                  ),
                ),
              ],
            ),
          ),
          CarouselSlider(
            items: widget.product.galleries!
                .map((image) => Image.network(
                      image.url,
                      width: MediaQuery.of(context).size.width,
                      height: 310,
                      fit: BoxFit.cover,
                    ))
                .toList(),
            options: CarouselOptions(
                initialPage: 0,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                }),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.product.galleries!.map((e) {
              index++;
              return indicator(index);
            }).toList(),
          )
        ],
      );
    }

    Widget content() {
      int index = -1;

      return Container(
        margin: EdgeInsets.only(top: 17),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24),
          ),
          color: backgroundColor1,
        ),
        child: Column(
          children: [
            // title
            Container(
                margin: EdgeInsets.only(
                  top: defaultMargin,
                  left: defaultMargin,
                  right: defaultMargin,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.product.name!,
                            style: primaryTextStyle.copyWith(
                                fontSize: 18, fontWeight: semiBold),
                          ),
                          Text(
                            widget.product.category!.name,
                            style: secondaryTextStyle.copyWith(
                                fontSize: 12, fontWeight: regular),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                          wishlistProvider.setProduct(widget.product);
                          if (wishlistProvider.isWishlist(widget.product)) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              duration: Duration(milliseconds: 1000),
                              backgroundColor: secondaryColor,
                              content: Text(
                                'Has been added to the Whitelist',
                                style: alertkTextStyle.copyWith(
                                    fontSize: 12, fontWeight: regular),
                                textAlign: TextAlign.center,
                              ),
                            ));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              duration: Duration(milliseconds: 1000),
                              backgroundColor: alertColor,
                              content: Text(
                                'Has been removed from the Whitelist',
                                style: alertkTextStyle.copyWith(
                                    fontSize: 12, fontWeight: regular),
                                textAlign: TextAlign.center,
                              ),
                            ));
                          }
                      },
                      child: Image.asset(
                        wishlistProvider.isWishlist(widget.product)
                            ? 'assets/button_whislist_blue.png'
                            : 'assets/button_whislist.png',
                        width: 46,
                      ),
                    )
                  ],
                )),
            Container(
              margin: EdgeInsets.only(
                  top: 20, left: defaultMargin, right: defaultMargin),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: backgroundColor2,
                  borderRadius: BorderRadius.circular(4)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Price starts from',
                      style: primaryTextStyle.copyWith(
                          fontSize: 14, fontWeight: regular)),
                  Text('\$${widget.product.price}',
                      style: priceTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold))
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(
                  top: defaultMargin,
                  left: defaultMargin,
                  right: defaultMargin,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Description',
                      style: primaryTextStyle.copyWith(
                          fontSize: 14, fontWeight: medium),
                    ),
                    SizedBox(height: 12),
                    Text(
                        widget.product.description!,
                        style: subtitleTextStyle.copyWith(
                            fontSize: 14, fontWeight: light),
                        textAlign: TextAlign.justify),
                  ],
                )),
            Container(
              margin: EdgeInsets.only(
                top: defaultMargin,
              ),
              // width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: defaultMargin,
                    ),
                    child: Text(
                      'Familiar Shoes',
                      style: primaryTextStyle.copyWith(
                          fontSize: 14, fontWeight: medium),
                    ),
                  ),
                  SizedBox(height: 12),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: familiarShoes.map((image) {
                        index++;
                        return Container(
                            margin: EdgeInsets.only(
                                left: index == 0 ? defaultMargin : 0),
                            child: familiarShoesCard(image));
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(30),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/detail-chat');
                    },
                                      child: Container(
                      width: 54,
                      height: 54,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/button_chat.png'))),
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Container(
                      height: 54,
                      child: TextButton(
                        onPressed: () {
                          cartProvider.addCart(widget.product);
                          showSuccessDialog();
                        },
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            backgroundColor: primaryColor),
                        child: Text(
                          'Add to Cart',
                          style: primaryTextStyle.copyWith(
                              fontSize: 16, fontWeight: semiBold),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Color(0xffECECEF),
      body: Center(
          child: ListView(
        children: [
          header(),
          content(),
        ],
      )),
    );
  }
}
