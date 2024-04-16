import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gallery_app/pixabay_api_key.dart';
import 'package:gallery_app/model/pixabay_image.dart';

class RequestMaker {
  final dio = Dio();

  Future<List<PixabayImage>?> getImagesFromApi() async {
    try {
      final searchQuery = Uri.encodeQueryComponent('Painting');
      const perPage = 50;
      final res = await dio.get(
          "https://pixabay.com/api/?key=$apiKey&q=$searchQuery&image_type=photo&pretty=true&per_page=$perPage");
      if (res.statusCode == 200 && res.data != null) {
        final list = (res.data["hits"] as List<dynamic>).cast<Map<String, dynamic>>();
        return list.map((e) => PixabayImage.fromJson(e)).toList();
      }
    } catch (e,s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      return null;
    }
    return null;
  }
}
