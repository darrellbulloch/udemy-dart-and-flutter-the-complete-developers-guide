import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'models/image_model.dart';
import 'dart:convert';
import 'widgets/image_list.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async {
    final url = 'https://jsonplaceholder.typicode.com/photos/${counter + 1}';

    final response = await get(url);

    final ImageModel imageModel =
        ImageModel.fromJson(json.decode(response.body));

    // print(response);
    // print(imageModel);

    // re-render widget
    setState(() {
      images.add(imageModel);
      ++counter;
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ImageList(images),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add), // https://material.io/tools/icons
          onPressed: fetchImage,
        ),
        appBar: AppBar(
          title: Text("Let's see some images"),
        ),
      ),
    );
  }
}
