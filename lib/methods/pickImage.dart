import 'dart:io';

import 'package:image_picker/image_picker.dart';

Future<File>? pickImge() async {
  final pickedImage =
      await ImagePicker().pickImage(source: ImageSource.gallery);
  if (pickedImage != null) {
    return File(pickedImage.path);
  } else {
    throw UnimplementedError("Could not find picked image");
  }
}
