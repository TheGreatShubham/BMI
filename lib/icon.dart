import 'package:flutter/material.dart';
import 'constants.dart';

class IconContents extends StatelessWidget {
  IconContents({this.IconContent, this.TextContent});
  final IconData IconContent;
  final String TextContent;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          IconContent,
          size: 80.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          TextContent,
          style: KTextContentStyle,
        ),
      ],
    );
  }
}
