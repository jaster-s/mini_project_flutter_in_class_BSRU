import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  //const ContactPage({ Key? key }) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
          child: Column(
            children: [Text("Siwadon Saelim"), Text("0851469515")],
          ),
        )
      ],
    );
  }
}
