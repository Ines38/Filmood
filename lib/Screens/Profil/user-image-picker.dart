import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  final void Function(File pickedImage) imagePickFn;
  UserImagePicker(this.imagePickFn);
  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File _pickedimage;
  final ImagePicker _picker = ImagePicker();

  void _pickImage(ImageSource src) async {
    final pickedImageFile = await _picker.getImage(source: src);
    if (pickedImageFile != null) {
      setState(() {
        _pickedimage = File(pickedImageFile.path);
      });
      widget.imagePickFn(_pickedimage);
    } else {
      print('no picked image selected');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          backgroundImage:
              _pickedimage != null ? FileImage(_pickedimage) : null,
        ),
        SizedBox(
          height: 10,
        ),
        FlatButton.icon(
            textColor: Colors.red[700],
            onPressed: () => _pickImage(ImageSource.gallery),
            icon: Icon(Icons.image_outlined),
            label: Text(
              'add image from gallery',
              textAlign: TextAlign.center,
            ))
      ],
    );
  }
}
