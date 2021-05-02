import 'package:flutter/material.dart';




class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  /*mercury = 0.38
  Venus= 0.91
  pluto= 0.06
   */

  final TextEditingController weightcontroller =new TextEditingController();

  int radioValue = 0;
  double finalresult= 0.0;

  void handleRadioValueChanged( int value){
    setState(() {
      radioValue= value;
      switch(radioValue){
        case 0: finalresult = calculateweight(weightcontroller.text,0.06);
        break;
        case 1: finalresult = calculateweight(weightcontroller.text,0.38);
        break;
        case 2: finalresult = calculateweight(weightcontroller.text,0.91);
        break;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Weight Calculation",
      ),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),

      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.5),
          children: [
            new Image.asset("Images/planet.png",
            height: 133.0,
            width: 200.0,),

            new Container(
              padding: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: new Column(
                children: [
                  new TextField(

                    controller: weightcontroller,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: 'Your Weight On Earth',
                      icon: new Icon(Icons.person_outline),
                      hintText: 'In Pounds'
                    ),
                  ),
                  
                  new Padding(padding: new EdgeInsets.all(5.0)),

                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      new Radio(
                          activeColor: Colors.brown,
                          value: 0, groupValue: radioValue, onChanged: handleRadioValueChanged),
                      new Text(
                        "Pluto",
                        style: new TextStyle(
                          color: Colors.white30
                        ),
                      ),
                      new Radio(
                          activeColor: Colors.red,
                          value: 1, groupValue: radioValue, onChanged: handleRadioValueChanged),
                      new Text(
                        "Mars",
                        style: new TextStyle(
                            color: Colors.white30
                        ),
                      ),
                      new Radio(
                          activeColor: Colors.orangeAccent,
                          value: 2, groupValue: radioValue, onChanged: handleRadioValueChanged),
                      new Text(
                        "Venus",
                        style: new TextStyle(
                            color: Colors.white30
                        ),
                      ),
                    ],
                  ),

                  //Display Results
                  new Padding(padding: EdgeInsets.all(15.6)),

                  new Text(
                    "$finalresult",
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 16.9,
                      fontWeight: FontWeight.w700
                    ),
                  )
                  
                ],
              ),

              ),

          ],
        ),
      ),
    );
  }

  double calculateweight(String weight, double multiplier) {
    if(int.parse(weight).toString().isNotEmpty && int.parse(weight)>0){
      return int.parse(weight)* multiplier;
    }else
      {
        print("Wrong");
        return int.parse("180")*0.38;
      }
  }
}

