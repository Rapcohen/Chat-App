import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;
  final String username;

  const MessageBubble({
    Key key,
    this.message,
    this.isCurrentUser,
    this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isCurrentUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: isCurrentUser
                ? Colors.grey[300]
                : Theme.of(context).accentColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
              bottomLeft:
                  !isCurrentUser ? Radius.circular(0) : Radius.circular(16),
              bottomRight:
                  isCurrentUser ? Radius.circular(0) : Radius.circular(16),
            ),
          ),
          width: 140,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Column(
            crossAxisAlignment: isCurrentUser
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              Text(
                username,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isCurrentUser
                      ? Colors.black
                      : Theme.of(context).accentTextTheme.title.color,
                ),
              ),
              Text(
                message,
                style: TextStyle(
                  color: isCurrentUser
                      ? Colors.black
                      : Theme.of(context).accentTextTheme.title.color,
                ),
                textAlign: isCurrentUser ? TextAlign.end : TextAlign.start,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
