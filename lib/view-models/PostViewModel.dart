import 'dart:io';

import 'package:flutter/material.dart';

class PostViewModel extends ChangeNotifier {
  File? _image;
  TextEditingController _dateController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  get image => _image;
  get selectedDate => _selectedDate;
  get dateController => _dateController;

  setImage(File image) {
    print("Image: $image");
    _image = image;
    notifyListeners();
  }

  setDate(DateTime? picked) {
    _selectedDate = picked!;
    _dateController.text = "${picked}";
  }
}
