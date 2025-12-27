import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// Function to pick an image from the gallery or camera, pickImage is a function that returns a Future<Uint8List?> , ImageSource is an enum that specifies the source of the image (camera or gallery), source is the parameter that specifies the source of the image
pickImage(ImageSource source) async {
  //ImagePicker is a class that provides methods for picking images from the gallery or camera , _imagepicker is an instance of ImagePicker , pickImage is a method that allows you to pick an image from the specified source , XFile is a class that represents a file picked by the user
  final ImagePicker _imagepicker = ImagePicker();
  final XFile? image = await _imagepicker.pickImage(source: source);
  if (image != null) {
    return await image.readAsBytes();
  }
  return null;
}

showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}
