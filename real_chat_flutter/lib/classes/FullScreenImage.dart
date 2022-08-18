// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class FullScreenImage extends StatelessWidget {
  final String imageUrl;
  final String tag;

  const FullScreenImage({required this.imageUrl, required this.tag, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: tag,
            child: CachedNetworkImage(
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.contain,
              imageUrl: imageUrl,
            ),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
