import 'package:flutter/material.dart';
import 'package:memeshare/ApiService.dart';
import 'package:share/share.dart';
import 'imageWidget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String url = "";
  late ApiService client = ApiService();
  void changeClient() {
    this.setState(() {
      client = ApiService();
    });
  }

  void urlSetter(String url) {
    this.url = url;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meme Share App"),
      ),
      body: Column(
        children: [
          Expanded(child: imageWidget(this.client, this.urlSetter)),
          Row(
            children: <Widget>[
              Expanded(
                  child: ElevatedButton(
                      onPressed: () => {
                            Share.share(
                                'Hey! I found some cool meme go and check it out : ${this.url}')
                          },
                      child: Text("Share"))),
              Expanded(
                  child: ElevatedButton(
                      onPressed: this.changeClient, child: Text("Next")))
            ],
          ),
        ],
      ),
    );
  }
}
