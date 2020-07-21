import 'package:flutter/material.dart';
import 'package:splash/app/model/photo_model.dart';

class DetailPage extends StatefulWidget {
  final PhotoModel photo;

  DetailPage({this.photo});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  double scale = 1.0;
  Color bgColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    final photo = widget.photo;

    return GestureDetector(
      onTap: _toggleBg,
      onVerticalDragEnd: (_) => Navigator.pop(context),
      onVerticalDragUpdate: (dragDetails) {
        setState(() {
          scale -= 0.01;
        });
      },
      child: Scaffold(
        backgroundColor: bgColor,
        body: Transform.scale(
          scale: scale,
          child: Center(
            child: Hero(
              tag: photo.id,
              child: _photoWidget(photo),
            ),
          ),
        ),
      ),
    );
  }

  Widget _photoWidget(PhotoModel photo) {
    return AspectRatio(
      aspectRatio: photo.width / photo.height,
      child: Image.network(photo.url),
    );
  }

  void _toggleBg() {
    final newBg = bgColor == Colors.black ? Colors.white : Colors.black;
    setState(() {
      bgColor = newBg;
    });
  }
}
