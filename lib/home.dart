import 'package:flutter/material.dart';
import 'widget/textfield.dart';
import 'widget/datetimefield.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _regkey = new GlobalKey<FormState>();
  List<String> quantity = ['1', '2', '3'];
  List<String> unt = ['abc', 'pqr'];
  List<String> rfl = ['1', '2', '3', '4', '5'];

  TextEditingController medication;
  TextEditingController sig;
  TextEditingController notes;
  TextEditingController qty;
  TextEditingController unit;
  TextEditingController refills;

  initState() {
    medication = new TextEditingController();
    sig = new TextEditingController();
    notes = new TextEditingController();
    qty = new TextEditingController();
    unit = new TextEditingController();
    refills = new TextEditingController();
    super.initState();
  }

  void clearData() {
    medication.text = "";
    sig.text = "";
    notes.text = "";
    unit.text = "";
    qty.text = "";
    refills.text = "";
  }

  void quit() {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: new Text("Quit ?"),
          content: new Text('Are you sure you want to quit ?'),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Yes"),
              onPressed: () {
                SystemNavigator.pop();
              },
            ),
            new FlatButton(
              child: new Text("No"),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
                onTap: () {
                  quit();
                },
                child: Icon(Icons.arrow_back)),
            Expanded(
              child: Text(
                'eRx',
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            key: _regkey,
            child: Column(
              children: [
                textfield(
                    'Enter name and strength', 'Medication', medication, null),
                SizedBox(
                  height: 10,
                ),
                textfield('Enter SIg', 'SIG', sig, null),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: 150,
                        child: textfield(
                          'Enter Qty',
                          'Qty',
                          qty,
                          DropdownButton(
                            onChanged: (newValue) {
                              qty.text = newValue;
                            },
                            items: quantity.map((location) {
                              return DropdownMenuItem(
                                child: new Text(location),
                                value: location,
                              );
                            }).toList(),
                          ),
                        )),
                    Container(
                        width: 150,
                        child: textfield(
                          'Choose unit',
                          'Unit',
                          unit,
                          DropdownButton(
                            onChanged: (newValue) {
                              unit.text = newValue;
                            },
                            items: unt.map((location) {
                              return DropdownMenuItem(
                                child: new Text(location),
                                value: location,
                              );
                            }).toList(),
                          ),
                        ))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                textfield(
                  'No. of doses',
                  'Refills',
                  refills,
                  DropdownButton(
                    onChanged: (newValue) {
                      refills.text = newValue;
                    },
                    items: rfl.map((location) {
                      return DropdownMenuItem(
                        child: new Text(location),
                        value: location,
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter notes',
                    labelText: 'Notes',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                  ),
                  controller: notes,
                  
                  maxLines: 4,
                ),
                SizedBox(
                  height: 10,
                ),
                dateTimeField(),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: 300,
                  height: 50,
                  child: RaisedButton(
                    onPressed: () {
                      if (_regkey.currentState.validate()) {
                        _regkey.currentState.save();

                        clearData();
                      }
                    },
                    color: Colors.green,
                    child: Text(
                      'Save',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
