import 'dart:io';
import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:mobile/data/repositories/auth_repo.dart';
import 'package:mobile/data/repositories/post_repo.dart';

import '../data/services/secure_storage_service.dart';
import '../utils/alert_info_modal.dart';

class PostViewModel extends ChangeNotifier {
  final PostsRepo _postsRepo = PostsRepo();
  final AuthRepo _authRepo = AuthRepo();
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
  bool _isPosting = false;
  bool _hasUploaded = false;

  get name => _titleController.text;
  get description => _description.text;
  get tags => _tagsController;
  get geoPrivacy => _geoPrivacy;
  get clusterId => _clusterId;
  get image => _image;
  get selectedDate => _selectedDate;
  get dateController => _dateController;
  get isUploading => _isUploading;
  get isPosting => _isPosting;
  get hasUploaded => _hasUploaded;

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

  set setIsPosting(bool isPosting) {
    _isPosting = isPosting;
    notifyListeners();
  }

  set setHasUploaded(bool hasUploaded) {
    _hasUploaded = hasUploaded;
    notifyListeners();
  }

  Future createPost(context) async {
    try {
      print("About to create post");
      setIsUploading = true;
      final path = 'files/${DateTime.now()}';
      final file = File(_image!.path);
      final ref = FirebaseStorage.instance.ref().child(path);
      uploadTask = ref.putFile(file);

      final snapshot = await uploadTask!
          .whenComplete(() => {setIsPosting = true, setIsUploading = false});
      final imageUrl = await snapshot.ref.getDownloadURL();
      print("Download Link: $imageUrl");

      Response response = await _authRepo.apiTest();
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("TestAPi: $response");
        setIsPosting = false;
        setHasUploaded = true;
        //todo: create a method to clear all input fields instead of just image
        clearImage();
        Navigator.pop(context);
      }
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
      setIsPosting = false;
      setIsUploading = false;
      Navigator.pop(context);
      displayAlertModal(context, error.response?.data['message']);
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
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (isUploading)
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LinearProgressIndicator(
                            value: progress,
                            backgroundColor: Colors.grey,
                            color: Colors.blue,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                '${(100 * progress).roundToDouble()}%',
                                style: const TextStyle(color: Colors.green),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  if (isPosting)
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text("Posting"),
                          )
                        ],
                      ),
                    ),
                  if (hasUploaded)
                    Expanded(
                      child: Column(
                        children: [
                          Icon(
                            Icons.check,
                            color: Colors.green,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              "Success!",
                              style: TextStyle(color: Colors.green),
                            ),
                          )
                        ],
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
