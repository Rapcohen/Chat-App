import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;

  const MessageBubble({
    Key key,
    this.message,
    this.isCurrentUser,
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
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomLeft:
                  !isCurrentUser ? Radius.circular(0) : Radius.circular(12),
              bottomRight:
                  isCurrentUser ? Radius.circular(0) : Radius.circular(12),
            ),
          ),
          width: 140,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Text(
            message,
            style: TextStyle(
              color: isCurrentUser
                  ? Colors.black
                  : Theme.of(context).accentTextTheme.title.color,
            ),
          ),
        ),
      ],
    );
  }
}
