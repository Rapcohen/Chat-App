import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;
  final String username;
  final String imageUrl;

  const MessageBubble({
    Key key,
    this.message,
    this.isCurrentUser,
    this.username,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment:
              isCurrentUser ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: isCurrentUser
                    ? Colors.blueGrey[100]
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
              margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
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
        ),
        Positioned(
          //Todo: set img position
          top: 0,
          left: isCurrentUser ? null : 115,
          right: isCurrentUser ? 115 : null,
          child: CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
          ),
        ),
      ],
      overflow: Overflow.visible,
    );
  }
}
