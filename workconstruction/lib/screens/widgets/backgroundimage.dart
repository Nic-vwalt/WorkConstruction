import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: [Colors.black,Colors.yellow],
        begin: Alignment.bottomCenter,
        end: Alignment.bottomCenter,
      ).createShader(bounds), 
      blendMode:  BlendMode.darken,
      child: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/Layer1.png'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.yellow, BlendMode.darken))),
      )
    );
  }
}