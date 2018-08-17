import 'package:flutter/material.dart';

class home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<home> {
  final TextEditingController _weightController = new TextEditingController();
  double finalresult = 0.0;

  int radiovalue = 0;

  void handelRadioValueChanged(int value) {
     setState(() {
      radiovalue = value;
      switch (radiovalue) {
        case 0:
          finalresult = calculateWeight(_weightController.text, 0.06);
          break;
        case 1:
          finalresult = calculateWeight(_weightController.text, 0.38);
          break;
        case 2:
          finalresult = calculateWeight(_weightController.text, 0.91);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Weight on planet X"),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.5),
          children: <Widget>[
            new Image.asset(
              'images/planet.png',
              height: 133.0,
              width: 200.0,
            ),
            new Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: "your weight on Earth",
                        hintText: "In pounds",
                        icon: new Icon(Icons.person_outline)),
                  ),
                  new Padding(padding: new EdgeInsets.all(5.0)),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Radio<int>(
                          activeColor: Colors.brown,
                          value: 0,
                          groupValue: radiovalue,
                          onChanged: handelRadioValueChanged),
                      new Text(
                        "pluto",
                        style: new TextStyle(color: Colors.white30),
                      ),
                      new Radio<int>(
                          activeColor: Colors.red,
                          value: 1,
                          groupValue: radiovalue,
                          onChanged: handelRadioValueChanged),
                      new Text(
                        "Mars",
                        style: new TextStyle(color: Colors.white30),
                      ),
                      new Radio<int>(
                          activeColor: Colors.orangeAccent,
                          value: 2,
                          groupValue: radiovalue,
                          onChanged: handelRadioValueChanged),
                      new Text(
                        "Venus",
                        style: new TextStyle(color: Colors.white30),
                      ),
                    ],
                  ),
                  new Padding(padding: new EdgeInsets.all(5.6)),
                  new Text(
                    "Your weight is ${finalresult.toStringAsFixed(2)} lbs",
                    style: new TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 19.4),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  double calculateWeight(String text, double d) {
    if (text.isNotEmpty && double.parse(text) > 0) {
      return double.parse(text) * d;
    } else {
      return 0.0;
    }
  }
}
