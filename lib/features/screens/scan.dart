import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:async/async.dart';

class PlantScanner extends StatefulWidget {
  static String routeName = '/plantscanner';
  final PageController pageController;

  const PlantScanner({super.key, required this.pageController});

  @override
  _PlantScannerState createState() => _PlantScannerState();
}

class _PlantScannerState extends State<PlantScanner> {
  File? _image;
  final picker = ImagePicker();
  String _prediction = '';
  String _solution = '';

  Future<void> _pickImage() async {
    final pickedSource = await showDialog<ImageSource>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Image Source'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, ImageSource.camera),
            child: const Text('Camera'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, ImageSource.gallery),
            child: const Text('Gallery'),
          ),
        ],
      ),
    );

    if (pickedSource != null) {
      final pickedFile = await picker.pickImage(source: pickedSource);
      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
        } else {
          print('No image selected.');
        }
      });
    }
  }

  Future<void> _uploadImage() async {
    if (_image == null) return;

    var uri = Uri.parse('http://192.168.1.96:8000/predict/');
    var stream = http.ByteStream(DelegatingStream.typed(_image!.openRead()));
    var length = await _image!.length();
    var request = http.MultipartRequest('POST', uri);
    var multipartFile = http.MultipartFile(
      'image',
      stream,
      length,
      filename: path.basename(_image!.path),
    );
    request.files.add(multipartFile);

    var response = await request.send();
    if (response.statusCode == 200) {
      var responseData = await http.Response.fromStream(response);
      var responseJson = json.decode(responseData.body);
      setState(() {
        _prediction = responseJson['prediction'];
        _solution = responseJson['solution'];
      });
    } else {
      print('Failed to upload image');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plant Disease Scanner'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image == null
                ? const Text('No image selected.')
                : Image.file(_image!),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text('Select Image'),
            ),
            ElevatedButton(
              onPressed: _uploadImage,
              child: const Text('Upload and Predict'),
            ),
            const SizedBox(height: 20),
            if (_prediction.isNotEmpty)
              Column(
                children: [
                  Text('Prediction: $_prediction'),
                  Text('Solution: $_solution'),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
