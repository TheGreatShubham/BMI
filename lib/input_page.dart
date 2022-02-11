import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon.dart';
import 'resuable_card.dart';
import 'constants.dart';
import 'result.dart';
import 'RoundIconButton.dart';
import 'buttom_button.dart';
import 'calculate_bmi.dart';

enum Gender { MALE, FEMALE }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 160;
  int weight = 70;
  int age = 21;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Reusable(
                    OnPress: () {
                      setState(() {
                        selectedGender = Gender.MALE;
                      });
                    },
                    Colour: selectedGender == Gender.MALE
                        ? KActivecardcolor
                        : KInactivecardColor,
                    cardChild: IconContents(
                        IconContent: FontAwesomeIcons.mars,
                        TextContent: 'MALE'),
                  ),
                ),
                Expanded(
                  child: Reusable(
                    OnPress: () {
                      setState(() {
                        selectedGender = Gender.FEMALE;
                      });
                    },
                    Colour: selectedGender == Gender.FEMALE
                        ? KActivecardcolor
                        : KInactivecardColor,
                    cardChild: IconContents(
                      IconContent: FontAwesomeIcons.venus,
                      TextContent: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Reusable(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: KTextContentStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: Kstyle,
                      ),
                      Text(
                        'cm',
                        style: KTextContentStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0)),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newvalue) {
                        setState(() {
                          height = newvalue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
              Colour: KActivecardcolor,
              // cardChild: IconContents(),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Reusable(
                    Colour: KActivecardcolor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: KTextContentStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: Kstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                OnPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                OnPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                }),
                          ],
                        )
                      ],
                    ),
                    // cardChild: IconContents(),
                  ),
                ),
                Expanded(
                  child: Reusable(
                    Colour: KActivecardcolor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: KTextContentStyle,
                        ),
                        Text(
                          age.toString(),
                          style: Kstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              OnPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              OnPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    // cardChild: IconContents(),
                  ),
                ),
              ],
            ),
          ),
          bottom_button(
            ButtonTitle: 'CALCULATE',
            onTap: () {
              CalculateBMI calc = CalculateBMI(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Result(
                          BMi: calc.getBmi(),
                          resultBMI: calc.getResult(),
                          Interpretation: calc.getInterpretation(),
                        )),
              );
            },
          ),
        ],
      ),
    );
  }
}
