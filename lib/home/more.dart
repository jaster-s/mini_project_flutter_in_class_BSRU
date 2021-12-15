import 'package:flutter/material.dart';
import 'package:news/home/detail.dart';
import 'package:news/model/home_model.dart';

class MorePage extends StatelessWidget {
  static const String page = "more";
  final homei homeie;

  const MorePage(this.homeie, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(homeie.name),
        ),
        body: SafeArea(
            child: GridView.count(
          crossAxisCount: 2,
          children: homeie.list
              .map((item) => Card(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, ItemDetailPage.page,
                            arguments: item);
                      },
                      child: Column(
                        children: [
                          Center(
                              child: Expanded(
                                  flex: 2, child: Image.network(item.image))),
                          Expanded(flex: 1, child: Text(item.name))
                        ],
                      ),
                    ),
                  ))
              .toList(),
        )));
  }
}