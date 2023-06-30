import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';

class ImgProvider extends ChangeNotifier {
  String? _imagePath;

  String? get imagePath => _imagePath;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      _imagePath = pickedImage.path;
      notifyListeners();
    }
  }

  clearImage() {
    _imagePath = null;
    notifyListeners();
  }
}
