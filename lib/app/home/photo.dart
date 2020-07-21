import 'package:flutter/material.dart';
import 'package:splash/app/color_extensions.dart';
import 'package:splash/app/detail/detail_page.dart';
import 'package:splash/app/model/photo_model.dart';


class Photo extends StatefulWidget {
  final PhotoModel photo;

  const Photo({this.photo});

  @override
  _PhotoState createState() => _PhotoState();
}

class _PhotoState extends State<Photo> {
  double padding = 0;

  @override
  Widget build(BuildContext context) {
    final photo = widget.photo;

    final borderRadius = BorderRadius.circular(32);
    return Hero(
      tag: photo.id,
      child: GestureDetector(
        onTapDown: (_) => setState(() {
          padding = 16;
        }),
        onTapUp: (_) => setState(() {
          padding = 0;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(
                photo: photo,
              ),
            ),
          );
        }),
        child: AnimatedPadding(
          curve: Curves.easeOutBack,
          duration: Duration(milliseconds: 300),
          padding: EdgeInsets.all(padding),
          child: Container(
            decoration: BoxDecoration(
                color: HexColor.fromHex(photo.colorCode),
                borderRadius: borderRadius),
            margin: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: AspectRatio(
              aspectRatio: photo.width / photo.height,
              child: ClipRRect(
                child: Image.network(photo.url),
                borderRadius: borderRadius,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
