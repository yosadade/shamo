import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isSender;

  ChatBubble({this.text = '', this.isSender = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.6
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                  color: isSender ? backgroundColor5 : backgroundColor4,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular( isSender ? 12 : 0),
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular( isSender ? 0 : 12)
                      )),
              child: Text(
                text,
                style: primaryTextStyle.copyWith(
                    fontSize: 14, fontWeight: regular),
              ),
            ),
          )
        ],
      ),
    );
  }
}
