import 'package:care_for_each/API/employee_leave_status_change_API.dart';
import 'package:care_for_each/company_side/leave_detail3.dart';
import 'package:flutter/material.dart';
import '../company_side/leave_detail4.dart';

class AlertWidget extends StatefulWidget {
  const AlertWidget({Key? key, required this.lrid, required this.c_emailid}) : super(key: key);

  final String c_emailid;
  final String lrid;
  @override
  State<AlertWidget> createState() => _AlertWidgetState();
}

class _AlertWidgetState extends State<AlertWidget> {

  late String status;
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
                  status="Approved";
                  print(status);
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
                  status="Rejected";
                  print(status);
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
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50,),
              child: ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.teal)),
                  child: Text("No",style: TextStyle(color: Colors.white))
              ),
            ),
            SizedBox(width: 20,),
            Padding(
              padding: const EdgeInsets.only(right: 50),
              child: ElevatedButton(
                  onPressed: (){
                    FutureBuilder(
                      future: EmployeeLeaveStatusChangeAPI().status("info@webearl.com",widget.lrid),
                      builder: (BuildContext context, snapshot) {
                        if(snapshot.connectionState==ConnectionState.waiting){
                          return Text("Loading");
                        }
                        else if(snapshot.hasData){
                          return Column(
                            children: [
                              Text(snapshot.data!.server![0].status.toString())
                            ],
                          );
                        }
                        else{
                          return Text("No data");
                        }
                      },

                    );
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LeaveDetail4(c_emailid: widget.c_emailid,)));
                  },
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.teal)),
                  child: Text("Yes",style: TextStyle(color: Colors.white))),
            ),
          ],
        ),
      ],
    );
  }
}
