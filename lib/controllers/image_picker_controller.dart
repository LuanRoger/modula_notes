import 'package:file_picker/file_picker.dart';

class ImagePickerController {
  static Future<String?> chooseImage() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);

    if (result == null) return null;

    return result.files.single.path;
  }
}
