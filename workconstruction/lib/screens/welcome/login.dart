import 'package:flutter/material.dart';
import 'package:workconstruction/palette.dart';
import 'package:workconstruction/screens/widgets/widgets.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_code_picker/country_localizations.dart';
import 'package:flutter/material.dart';

class login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          bottomNavigationBar: BottomAppBar(),
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Text(
                      'Welcome',
                      style: kHeading,
                    ),
                  )),
                ),
              ),
              Expanded(
                  child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'Phonenumber:',
                    style: kLabel,
                  ),
                ),
              )),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.topCenter,
                  child: Container(
                    color: Colors.black45,
                    height: 50,
                    width: 200,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(15.15),
                    child: Row(
                      children: [
                        SizedBox(),
                        TextField(),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: RaisedButton(
                      color: Colors.black54,
                      child: Text(
                        'Login',
                        style: kButton,
                      ),
                      onPressed: () => key,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
