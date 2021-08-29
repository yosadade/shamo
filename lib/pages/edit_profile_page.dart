import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/user_model.dart';
import 'package:shamo/providers/auth_provider.dart';
import 'package:shamo/theme.dart';

class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    Widget nameInput() {
      return Container(
        margin: EdgeInsets.only(top: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name',
              style: secondaryTextStyle.copyWith(
                  fontSize: 13, fontWeight: regular),
            ),
            SizedBox(height: 4),
            TextFormField(
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: regular),
              decoration: InputDecoration(
                  hintText: user.name,
                  hintStyle: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: regular),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: subtitleColor))),
            )
          ],
        ),
      );
    }

    Widget userName() {
      return Container(
        margin: EdgeInsets.only(top: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username',
              style: secondaryTextStyle.copyWith(
                  fontSize: 13, fontWeight: regular),
            ),
            SizedBox(height: 4),
            TextFormField(
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: regular),
              decoration: InputDecoration(
                  hintText: user.username,
                  hintStyle: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: regular),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: subtitleColor))),
            )
          ],
        ),
      );
    }

    Widget emailAddress() {
      return Container(
        margin: EdgeInsets.only(top: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email Address',
              style: secondaryTextStyle.copyWith(
                  fontSize: 13, fontWeight: regular),
            ),
            SizedBox(height: 4),
            TextFormField(
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: regular),
              decoration: InputDecoration(
                  hintText: user.email,
                  hintStyle: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: regular),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: subtitleColor))),
            )
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          children: [
            Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.only(top: defaultMargin),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                    user.profilePhotoUrl,
                  ))),
            ),
            nameInput(),
            userName(),
            emailAddress()
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.close),
            color: primaryTextColor,
            onPressed: () {},
          ),
          backgroundColor: backgroundColor1,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Edit Profile',
            style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: medium),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.check),
              color: primaryColor,
              onPressed: () {},
            ),
          ]),
      body: content(),
      resizeToAvoidBottomInset: false,
    );
  }
}
