import 'package:flutter/material.dart';


class AddingImage extends StatelessWidget  {

  @override
  Widget build(BuildContext context) {

    AssetImage assetImage = AssetImage('images/robo.png');

    Image image = Image(
        image : assetImage,
        width: 50.00,
        height: 50.0
    );
    return Container(child: image);

  }
}