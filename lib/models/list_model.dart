import 'image.dart';

class ImageList{
  final List<Image> images;

  ImageList({this.images});

  factory ImageList.fromJson(List<dynamic> parsedJson) {
    List<Image> images = new List<Image>();
    images = parsedJson.map((i) => Image.fromJson(i)).toList();

    return ImageList(
      images: images,
    );
  }
}