import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class CameraWidget extends StatefulWidget {
  @override
  _CameraWidgetState createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  File _images;

 Future getImage() async{
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState((){
    _images = image;
     });
  }

  @override
  Widget build(BuildContext context) {  
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
      ),
      body: Container(
        child: Center(
          child: _images == null ? Text('No image selected!'): Image.file(_images),
        
        ),
         
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

          getImage();
          print('hello');

        },
        ),
    );
  }
}