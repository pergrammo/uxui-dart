import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';

class classStorage {
  String myfile = 'app.txt';

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/$myfile');
  }

  Future<File> writeFile(String contents) async {
    final file = await _localFile;
    return file.writeAsString('$contents');
  }

  Future<String> readFile() async {
    try {
      final file = await _localFile;
      String contents = await file.readAsString();
      return contents;
    } catch (e) {
      return '';
    }
  }
}
