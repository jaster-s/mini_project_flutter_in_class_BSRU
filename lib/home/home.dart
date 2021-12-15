import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:news/auth/auth_controller.dart';
import 'package:news/home/detail.dart';
import 'package:news/home/detailH.dart';
import 'package:news/home/more.dart';
import 'package:news/model/home_model.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  static const String page = "Home";
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final tabs = [
    HomePage(),
  ];
  final AuthController authController = AuthController();

  void _toMorePage(homei homeie) {
    Navigator.pushNamed(context, MorePage.page, arguments: homeie);
  }

  void _toItemDetailPage(homeim Homeim) {
    Navigator.pushNamed(context, ItemDetailPage.page, arguments: Homeim);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        leadingWidth: 0,
        title: Text("ข่าวสาร"),
        actions: [
          IconButton(
              onPressed: () {
                authController.sinOut();
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FutureBuilder(
            builder: (context, AsyncSnapshot snapshot) {
              //var data = json.decode(snapshot.data.toString());
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return MyBox(
                      snapshot.data[index]['title'],
                      snapshot.data[index]['subtitle'],
                      snapshot.data[index]['img_URL'],
                      snapshot.data[index]['detail']);
                },
                itemCount: snapshot.data.length,
              );
            },
            future: getData(),
            //DefaultAssetBundle.of(context).loadString('assets/data.json'),
          )),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calculate), label: "Hospital"),
          BottomNavigationBarItem(
              icon: Icon(Icons.contact_mail), label: "Contact"),
        ],
        onTap: (index) {
          setState(() {
            print(index);
            _currentIndex = index;
          });
        },
      ),
    );
  }

  Widget MyBox(String title, String subtitle, String img_URL, String detail) {
    var v1 = title, v2 = subtitle, v3 = img_URL, v4 = detail;

    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
      padding: EdgeInsets.all(20),
      //color: Colors.blue[100],
      height: 180,
      decoration: BoxDecoration(
          //color: Colors.blue[100],
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: NetworkImage(img_URL),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.6), BlendMode.darken))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            subtitle,
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Column(
              children: [
                TextButton(
                  onPressed: () {
                    print("Next Pade >>");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailPage(v1, v2, v3, v4)));
                  },
                  child: Text(
                    "อ่านต่อ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future getData() async {
    //https://raw.githubusercontent.com/JasterSS/Flutter-API/main/assets/data.json
    var url = Uri.https('raw.githubusercontent.com',
        '/JasterSS/Flutter-API/main/assets/data.json');
    var response = await http.get(url);
    var result = json.decode(response.body);
    return result;
  }
}
