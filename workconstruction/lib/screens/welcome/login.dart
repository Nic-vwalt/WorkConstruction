import 'package:flutter/material.dart';
import 'package:workconstruction/palette.dart';
import 'package:workconstruction/screens/widgets/widgets.dart';

class login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(

          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Login',
                    style: kHeading,
                  ),
                )
              )
            ],
          ),
        ),
      ],
    );
  }
}


