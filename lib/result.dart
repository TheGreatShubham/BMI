import 'package:bmi_calculator/buttom_button.dart';
import 'package:bmi_calculator/resuable_card.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'buttom_button.dart';

class Result extends StatelessWidget {
  Result(
      {@required this.BMi,
      @required this.resultBMI,
      @required this.Interpretation});
  final String BMi;
  final String resultBMI;
  final String Interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: KResultStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Reusable(
                Colour: KActivecardcolor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultBMI.toUpperCase(),
                      style: Kstyle2,
                    ),
                    Text(
                      BMi,
                      style: KBMIstyle,
                    ),
                    Center(
                      child: Text(
                        Interpretation,
                        style: KStateStyle,
                      ),
                    ),
                  ],
                )),
          ),
          bottom_button(
            ButtonTitle: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
