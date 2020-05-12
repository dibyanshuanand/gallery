import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final String url;
  final String desc;
  final String altDesc;

  ImageContainer(this.url, this.desc, this.altDesc);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: <Widget>[
              Container(
                height: 230,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  child: Image.network(url, fit: BoxFit.fitHeight),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 3),
        Text(desc ?? altDesc ?? '', textAlign: TextAlign.center, overflow: TextOverflow.fade, maxLines: 2,),
      ],
    );
  }
}
