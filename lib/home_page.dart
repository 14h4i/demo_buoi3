import 'dart:io';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  XFile? photo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
              onPressed: () {
                photo = null;
                setState(() {});
              },
              icon: const Icon(Icons.remove))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final ImagePicker picker = ImagePicker();

          photo = await picker.pickImage(source: ImageSource.camera);
          setState(() {});
        },
      ),
      body: Center(
        child: _buildImage(),
      ),
    );
  }

  Widget _buildImage() {
    if (photo != null) {
      return SizedBox(
          width: 100, height: 100, child: Image.file(File(photo!.path)));
    } else {
      return const Text('Khong co hinh');
    }
  }
}
