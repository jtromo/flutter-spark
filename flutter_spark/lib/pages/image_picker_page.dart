import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spark/common/spark_drawer.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerPage extends StatefulWidget {
  const ImagePickerPage({super.key});

  @override
  State<ImagePickerPage> createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  late List<Image> _imageList;

  @override
  void initState() {
    super.initState();
    _imageList = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Image Picker"),
      ),
      drawer: const SparkDrawer(),
      floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () async {
            final ImagePicker picker = ImagePicker();
            final List<XFile> photosList = await picker.pickMultiImage();

            if (photosList.isEmpty) {
              return;
            }

            final List<Image> newImages = [];
            for (XFile photo in photosList) {
              newImages.add(Image.file(File(photo.path)));
            }

            setState(() {
              _imageList.addAll(newImages);
            });
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      extendBody: true,
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).colorScheme.primaryContainer,
        shape: const CircularNotchedRectangle(),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return _imageList[index];
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: _imageList.length),
    );
  }
}
