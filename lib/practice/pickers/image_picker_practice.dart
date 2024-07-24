import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerPractice extends StatefulWidget {
  const ImagePickerPractice({super.key});

  @override
  State<ImagePickerPractice> createState() => _ImagePickerPracticeState();
}

class _ImagePickerPracticeState extends State<ImagePickerPractice> {
  File? _image;
  void getImage(ImageSource source, BuildContext context) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("You have to select an image")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: _image == null
            ? Text(
                "No images selected.",
                style: theme.textTheme.titleLarge!.copyWith(
                  color: theme.colorScheme.onSurface,
                ),
              )
            : Image.file(_image!),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              getImage(ImageSource.camera, context);
            },
            tooltip: "Camera",
            child: const Icon(
              Icons.add_a_photo_outlined,
              color: Colors.white,
            ),
          ),
          const Gap(10),
          FloatingActionButton(
            onPressed: () {
              getImage(ImageSource.gallery, context);
            },
            tooltip: "Gallery",
            child: const Icon(
              Icons.image,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
