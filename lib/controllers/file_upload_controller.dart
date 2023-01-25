import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart';

class FileUploadController {
  // ------------ Upload picked Image to Firebase storage bucket
  static UploadTask? uploadFile(File file, String folderName) {
    try {
      //Getting the file name from the file path
      final String fileName = basename(file.path);

      //Define the file Storage destination in the firebase storage
      final String destination = '$folderName/$fileName';

      //Creating the firebase storage instance with the destination file location
      final ref = FirebaseStorage.instance.ref(destination);

      final task = ref.putFile(file);

      return task;
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }
}
