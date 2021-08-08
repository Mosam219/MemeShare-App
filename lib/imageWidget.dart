import 'package:flutter/material.dart';
import 'package:memeshare/ApiService.dart';

class imageWidget extends StatefulWidget {
  final Function(String) callback;
  ApiService client;
  imageWidget(this.client, this.callback);
  @override
  State<imageWidget> createState() => _imageWidgetState();
}

class _imageWidgetState extends State<imageWidget> {
  void callback(String s) {
    widget.callback(s);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder<String>(
      future: this.widget.client.getUrl(),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasData) {
          String ImageUrl = snapshot.data.toString();
          print("image : ${ImageUrl}");
          this.callback(ImageUrl);
          return Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(ImageUrl),
              fit: BoxFit.fill,
            )),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    ));
  }
}
