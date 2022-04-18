import 'dart:io';

import 'package:flutter/material.dart';

class PostViewModel extends ChangeNotifier {
  File? _image;

  get image => _image;

  setImage(File image) {
    _image = image;
  }
}
