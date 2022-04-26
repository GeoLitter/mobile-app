import 'dart:io';
import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:mobile/data/repositories/post_repo.dart';

import '../data/services/secure_storage_service.dart';
import '../utils/alert_info_modal.dart';

class PostViewModel extends ChangeNotifier {
  final PostsRepo _postsRepo = PostsRepo();
  final SecureLocalStorage _secureLocalStorage = SecureLocalStorage();
  UploadTask? uploadTask;
  File? _image;
  TextEditingController _titleController = TextEditingController();
  TextEditingController _description = TextEditingController();
  TextEditingController _tagsController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  String _geoPrivacy = "private";
  String _clusterId = "testid";
  String lat = "25.0330";
  String long = "121.5654";
  DateTime _selectedDate = DateTime.now();
  bool _isUploading = false;

  get name => _titleController.text;
  get description => _description.text;
  get tags => _tagsController;
  get geoPrivacy => _geoPrivacy;
  get clusterId => _clusterId;
  get image => _image;
  get selectedDate => _selectedDate;
  get dateController => _dateController;
  get isUploading => _isUploading;

  setImage(File image) {
    print("Image: $image");
    _image = image;
    notifyListeners();
  }

  clearImage() {
    _image = null;
    notifyListeners();
    print("Hello World");
  }

  setDate(DateTime? picked) {
    _selectedDate = picked!;
    _dateController.text = "${picked}";
  }

  set setIsUploading(bool uploading) {
    _isUploading = uploading;
    notifyListeners();
  }

  Future createPost(context) async {
    setIsUploading = true;
    try {
      print("About to create post");
      final path = 'files/${DateTime.now()}';
      final file = File(_image!.path);
      final ref = FirebaseStorage.instance.ref().child(path);
      uploadTask = ref.putFile(file);

      final snapshot = await uploadTask!.whenComplete(() => {});

      final imageUrl = await snapshot.ref.getDownloadURL();
      print("Download Link: $imageUrl");
      // Response response = await _postsRepo.createPost(
      //     "name", "description", lat, long, "date", geoPrivacy, clusterId);
      // print("Reponse: $response");
      // if (response.statusCode == 503) {
      //   displayAlertModal(context, "Not formatted correctly");
      // }
      // if (response.statusCode == 200 || response.statusCode == 201) {
      //   print(response.data);
      //   setIsUploading = false;
      // }
    } on DioError catch (error) {
      print("Error: $error");
      displayAlertModal(context, error.response?.data['message']);
      setIsUploading = false;
      throw error;
    }
  }

  Widget buildProgress() => StreamBuilder<TaskSnapshot>(
        stream: uploadTask?.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;
            double progress = data.bytesTransferred / data.totalBytes;
            return SizedBox(
              height: 50,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.grey,
                    color: Colors.green,
                  ),
                  Center(
                    child: Text(
                      '${(100 * progress).roundToDouble()}%',
                      style: const TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            );
          } else {
            return const SizedBox(
              height: 50,
            );
          }
        },
      );
}
