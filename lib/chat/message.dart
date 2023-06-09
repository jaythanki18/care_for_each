import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class messages extends StatefulWidget {
  String email;
  messages({required this.email});
  @override
  _messagesState createState() => _messagesState(email: email);
}

class _messagesState extends State<messages> {
  String email;
  _messagesState({required this.email});

  Stream<QuerySnapshot> _messageStream = FirebaseFirestore.instance
      .collection('Messages')
      .orderBy('time')
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _messageStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("something is wrong");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          physics: ScrollPhysics(),
          shrinkWrap: true,
          primary: true,
          itemBuilder: (_, index) {
            QueryDocumentSnapshot qs = snapshot.data!.docs[index];
            Timestamp t = qs['time'];
            DateTime d = t.toDate();
            print(d.toString());
            return Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Padding(
                padding: EdgeInsets.only(left: 5,right: 5),
                child: Column(
                  crossAxisAlignment: email == qs['email']
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:  Color.fromRGBO(12,25,71,1),
                      ),
                      child: SizedBox(
                        width: 300,
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Color.fromRGBO(12,25,71,1),
                              width: 2
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          title: Text(
                            qs['email'],
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.teal
                            ),
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 200,
                                color: Color.fromRGBO(12,25,71,1),
                                child: Text(
                                  qs['message'],
                                  softWrap: true,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white
                                  ),
                                ),
                              ),
                              Text(
                                d.hour.toString() + ":" + d.minute.toString(),
                                style: TextStyle(color: Colors.teal),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}