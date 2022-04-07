import 'package:flutter/material.dart';

class InfoText extends StatelessWidget {
  final String type;
  final String text;
  final String text1;
  final String text2;

  InfoText({@required this.type, @required this.text,
    @required this.text1, @required this.text2});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width<300? Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$type: ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.blueGrey[100],
                  fontSize: 16,
                ),
              ),
            ),
            Flexible(
              child: Text(
                text1,
                style: TextStyle(
                  color: Colors.white60,
                  fontSize: 16,
                ),
              ),
            ),
            Flexible(
              child: Text(
                text2,
                style: TextStyle(
                  color: Colors.white60,
                  fontSize: 16,
                ),
              ),
            ),
          ],)

      ],
    ) :Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$type: ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Flexible(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.blueGrey[100],
                fontSize: 16,
              ),
            ),
          ),
          Flexible(
            child: Text(
              text1,
              style: TextStyle(
                color: Colors.white60,
                fontSize: 16,
              ),
            ),
          ),
          Flexible(
            child: Text(
              text2,
              style: TextStyle(
                color: Colors.white60,
                fontSize: 16,
              ),
            ),
          ),
        ],)

      ],
    );
  }
}
