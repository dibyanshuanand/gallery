import 'urls.dart';

class Image {
  String id;
  String createdAt;
  int width;
  int height;
  String description;
  String altDescription;
  Urls urls;
  
  Image(this.id, this.createdAt, this.width, this.height, 
    this.description, this.altDescription, this.urls);

  Image.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    width = json['width'];
    height = json['height'];
    description = json['description'];
    altDescription = json['altDescription'];
    urls = json['urls'] != null ? Urls.fromJson(json['urls']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['width'] = this.width;
    data['height'] = this.height;
    data['description'] = this.description;
    data['altDescription'] = this.altDescription;
    if (this.urls != null)
      data['urls'] = this.urls.toJson();

    return data;
  }
}