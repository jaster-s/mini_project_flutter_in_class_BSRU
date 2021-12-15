import 'package:flutter/material.dart';
import 'package:news/model/home_model.dart';

class ItemDetailPage extends StatefulWidget {
  final homeim Homeim;
  static const String page = "item_detail";

  const ItemDetailPage(this.Homeim, {Key? key}) : super(key: key);

  @override
  _ItemDetailPageState createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.Homeim.name),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: double.infinity,
                height: 200,
                child: Image.network(widget.Homeim.image)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "ข้อมูล",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.Homeim.detail),
            )
          ],
        ),
      ),
    );
  }
}
