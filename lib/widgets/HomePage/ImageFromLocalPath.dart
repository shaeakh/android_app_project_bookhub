import 'dart:io';

import 'package:flutter/material.dart';

class ImageFromLocalPath extends StatelessWidget {
  final String imagePath;

  ImageFromLocalPath({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Image.file(
      File(imagePath),
    );
  }
}
