import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/providers/auth_provider.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/loading_button.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController(text: '');

  TextEditingController usernameController = TextEditingController(text: '');

  TextEditingController emailController = TextEditingController(text: '');

  TextEditingController passwordController = TextEditingController(text: '');

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleSignUp() async {
      setState(() {
        isLoading = true;
      });

      if (await authProvider.register(
        name: nameController.text,
        username: usernameController.text,
        email: emailController.text,
        password: passwordController.text,
      )) {
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: Duration(milliseconds: 1000),
          backgroundColor: alertColor,
          content: Text(
            'Gagal register!',
            style: alertkTextStyle.copyWith(fontSize: 12, fontWeight: regular),
            textAlign: TextAlign.center,
          ),
        ));
      }
      setState(() {
        isLoading = false;
      });
    }

    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sign Up',
              style:
                  primaryTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'Register and Happy Shoping',
              style:
                  subtitleTextStyle.copyWith(fontSize: 14, fontWeight: regular),
            ),
          ],
        ),
      );
    }

    Widget fullNameInput() {
      return Container(
        margin: EdgeInsets.only(top: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Full Name',
                style: primaryTextStyle.copyWith(
                    fontSize: 16, fontWeight: medium)),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_fullname.png',
                      width: 17,
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        style: primaryTextStyle.copyWith(
                            fontSize: 14, fontWeight: regular),
                        controller: nameController,
                        decoration: InputDecoration.collapsed(
                            hintText: 'Your Full Name',
                            hintStyle: subtitleTextStyle.copyWith(
                                fontSize: 14, fontWeight: regular)),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget userNameInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('User Name',
                style: primaryTextStyle.copyWith(
                    fontSize: 16, fontWeight: medium)),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_username.png',
                      width: 17,
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        style: primaryTextStyle.copyWith(
                            fontSize: 14, fontWeight: regular),
                        decoration: InputDecoration.collapsed(
                            hintText: 'Your Username',
                            hintStyle: subtitleTextStyle.copyWith(
                                fontSize: 14, fontWeight: regular)),
                        controller: usernameController,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget emailInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Email Address',
                style: primaryTextStyle.copyWith(
                    fontSize: 16, fontWeight: medium)),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_email.png',
                      width: 17,
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        style: primaryTextStyle.copyWith(
                            fontSize: 14, fontWeight: regular),
                        decoration: InputDecoration.collapsed(
                            hintText: 'Your Email Address',
                            hintStyle: subtitleTextStyle.copyWith(
                                fontSize: 14, fontWeight: regular)),
                        controller: emailController,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget passwordInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Password',
                style: primaryTextStyle.copyWith(
                    fontSize: 16, fontWeight: medium)),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_password.png',
                      width: 17,
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        obscureText: true,
                        style: primaryTextStyle.copyWith(
                            fontSize: 14, fontWeight: regular),
                        decoration: InputDecoration.collapsed(
                            hintText: 'Your Password',
                            hintStyle: subtitleTextStyle.copyWith(
                                fontSize: 14, fontWeight: regular)),
                        controller: passwordController,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget signUpButton() {
      return isLoading
          ? LoadingButton()
          : Container(
              height: 50,
              width: double.infinity,
              margin: EdgeInsets.only(top: 30),
              child: TextButton(
                onPressed: () {
                  handleSignUp();
                },
                style: TextButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    )),
                child: Text('Sign Up',
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    )),
              ),
            );
    }

    Widget footer() {
      return Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Already have an account?',
              style: subtitleTextStyle.copyWith(fontSize: 12),
            ),
            SizedBox(width: 2),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/sign-in');
                },
                child: Text(
                  'Sign In',
                  style: purpleTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: medium,
                  ),
                ))
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              fullNameInput(),
              userNameInput(),
              emailInput(),
              passwordInput(),
              signUpButton(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: footer(),
    );
  }
}
