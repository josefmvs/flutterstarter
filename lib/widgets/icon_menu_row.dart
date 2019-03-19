import 'package:flutter/material.dart';
import 'package:flutter_starter/widgets/label_below_icon.dart';

class IconMenuRow extends StatelessWidget {
  final firstLabel;
  final IconData firstIcon;
  final firstIconCircleColor;
  final secondLabel;
  final IconData secondIcon;
  final secondIconCircleColor;
  final thirdLabel;
  final IconData thirdIcon;
  final thirdIconCircleColor;
  final fourthLabel;
  final IconData fourthIcon;
  final fourthIconCircleColor;

  const IconMenuRow(
      {Key key,
        this.firstLabel,
        this.firstIcon,
        this.firstIconCircleColor,
        this.secondLabel,
        this.secondIcon,
        this.secondIconCircleColor,
        this.thirdLabel,
        this.thirdIcon,
        this.thirdIconCircleColor,
        this.fourthLabel,
        this.fourthIcon,
        this.fourthIconCircleColor})
      : super(key: key);

  void doSomething() {
    print("pressed test");
//    Navigator.push(
//      context,
//      MaterialPageRoute(
//        builder: (context) => VanillaScreen(_repository),
//      ),
//    );
  }

  @override
  Widget build(BuildContext context) {

     return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        //mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          LabelBelowIcon(
            icon: firstIcon,
            label: firstLabel,
            circleColor: firstIconCircleColor,
            onPressed: doSomething,
            callback: () {
              Navigator.of(context).pushNamed('/about');
//              Navigator.push(
//                context,
//                MaterialPageRoute(
//                  builder: (context) => SecondRoute(),
//                ),
//              );
            },
          ),
          LabelBelowIcon(
            icon: secondIcon,
            label: secondLabel,
            circleColor: secondIconCircleColor,
            onPressed:  doSomething,
            callback: doSomething,
          ),
          LabelBelowIcon(
            icon: thirdIcon,
            label: thirdLabel,
            circleColor: thirdIconCircleColor,
            onPressed:  doSomething,
            callback: doSomething,
          ),
          LabelBelowIcon(
            icon: fourthIcon,
            label: fourthLabel,
            circleColor: fourthIconCircleColor,
            onPressed:  doSomething,
            callback: doSomething,
          ),
        ],
    );
  }

  void pressed(){
    print('icon preessed');
  }
}


class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}