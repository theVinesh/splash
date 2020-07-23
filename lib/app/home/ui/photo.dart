import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:splash/app/detail/detail_page.dart';
import 'package:splash/app/model/photo_model.dart';
import 'package:splash/app/util/color_extensions.dart';

class Photo extends StatefulWidget {
  final PhotoModel photo;

  const Photo({Key key, @required this.photo})
      : assert(photo != null),
        super(key: key);

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
        onTapCancel: () => setState(() {
          padding = 0;
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
            margin: EdgeInsets.symmetric(vertical: 16),
            child: AspectRatio(
              aspectRatio: photo.width / photo.height,
              child: ClipRRect(
                child: Image.network(
                  photo.url,
                  semanticLabel: photo.description,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes
                            : null,
                      ),
                    );
                  },
                ),
                borderRadius: borderRadius,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
