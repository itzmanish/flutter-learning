import 'package:first/utils/hexcolor.dart';
import 'package:flutter/material.dart';

class TipCalculator extends StatefulWidget {
  @override
  _TipCalculatorState createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {
  double _billAmount = 0.0;
  int _personCounter = 1;
  int _tipPercent = 0;
  Color _purple = HexColor("#6908d6");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        alignment: Alignment.center,
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20.5),
          children: <Widget>[
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: _purple.withOpacity(0.1)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Tip Per Person",
                    style: TextStyle(
                        fontSize: 18.0,
                        color: _purple,
                        fontWeight: FontWeight.w300),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "\$${calculateTotalPerPerson(_billAmount, _tipPercent, _personCounter)}",
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: _purple),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(12.0),
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.1),
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.grey, style: BorderStyle.solid, width: 1.0),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: <Widget>[
                  TextField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                        prefixText: "Bill Amount ",
                        labelText: "Bill Amount",
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: _purple))),
                    cursorColor: _purple,
                    style: TextStyle(color: _purple),
                    onChanged: (String value) {
                      try {
                        _billAmount = double.parse(value);
                      } catch (e) {
                        _billAmount = 0.0;
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Split",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Row(
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (_personCounter > 1) _personCounter--;
                              });
                            },
                            child: Container(
                              height: 40.0,
                              width: 40.0,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: _purple.withOpacity(0.1),
                              ),
                              child: Center(
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                      color: _purple,
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "$_personCounter",
                            style:
                                TextStyle(color: Colors.grey, fontSize: 17.0),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _personCounter++;
                              });
                            },
                            child: Container(
                              height: 40.0,
                              width: 40.0,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: _purple.withOpacity(0.1),
                              ),
                              child: Center(
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                      color: _purple,
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  // Tip
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Tip",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(
                          "\$${calculateTotalTip(_billAmount, _tipPercent).toStringAsFixed(2)}",
                          style: TextStyle(
                              color: _purple,
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        "$_tipPercent %",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: _purple,
                            fontSize: 17.0),
                      ),
                      Slider(
                        min: 0,
                        max: 100,
                        divisions: 10,
                        value: _tipPercent.toDouble(),
                        onChanged: (double newValue) {
                          setState(() {
                            _tipPercent = newValue.round();
                          });
                        },
                        activeColor: _purple,
                        inactiveColor: Colors.grey,
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  calculateTotalPerPerson(double billAmount, int tipPercent, int splitBy) {
    var totalPerPerson =
        (calculateTotalTip(billAmount, tipPercent) + billAmount) / splitBy;
    return totalPerPerson.toStringAsFixed(2);
  }

  calculateTotalTip(double billAmount, int tipPercent) {
    return (billAmount * tipPercent) / 100;
  }
}
