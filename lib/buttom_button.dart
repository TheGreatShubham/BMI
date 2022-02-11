import 'package:flutter/material.dart';
import 'constants.dart';

class bottom_button extends StatelessWidget {
  bottom_button({@required this.ButtonTitle, @required this.onTap});
  final String ButtonTitle;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(child: Text(ButtonTitle, style: KBottomstyle)),
        color: KBottomColor,
        width: double.infinity,
        height: KBottomheight,
      ),
    );
  }
}
