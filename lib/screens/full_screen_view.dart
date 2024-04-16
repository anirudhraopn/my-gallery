import 'package:flutter/material.dart';
import 'package:gallery_app/model/pixabay_image.dart';

class FullScreenView extends StatelessWidget {
  const FullScreenView({super.key, required this.image});
  final PixabayImage image;
  static const routeName = '/full_screen_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Hero(
          tag: image.id,
          child: Image.network(
            image.largeImageURL,
          ),
        ),
      ),
    );
  }
}
