import 'package:flutter/material.dart';

class AlertWidget extends StatefulWidget {
  const AlertWidget({Key? key}) : super(key: key);

  @override
  State<AlertWidget> createState() => _AlertWidgetState();
}

class _AlertWidgetState extends State<AlertWidget> {

  // Group Value for Radio Button.
  int id = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('Leave Status :',
          style: TextStyle(color:Colors.white,fontSize: 21,decoration: TextDecoration.underline),),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Radio(
              activeColor: Colors.white,
              value: 1,
              groupValue: id,
              onChanged: (val) {
                setState(() {
                  // radioButtonItem = 'ONE';
                  id = 1;
                });
              },
            ),
            Text(
              'Approved',
              style: new TextStyle(fontSize: 17.0,color: Colors.white),
            ),

            Radio(
              activeColor: Colors.white,
              value: 2,
              groupValue: id,
              onChanged: (val) {
                setState(() {
                  // radioButtonItem = 'TWO';
                  id = 2;
                });
              },
            ),
            Text(
              'Rejected',
              style: new TextStyle(
                  fontSize: 17.0,
                  color: Colors.white
              ),
            ),

          ],
        ),
      ],
    );
  }
}
