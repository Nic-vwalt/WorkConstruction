import 'package:flutter/material.dart';
import 'package:workconstruction/classes/authentication_service.dart';
import 'package:workconstruction/palette.dart';
import 'package:workconstruction/screens/widgets/widgets.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_code_picker/country_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart';

class login extends StatelessWidget {
  final TextEditingController phonenumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          bottomNavigationBar: BottomAppBar(),
          backgroundColor: Colors.transparent,
          body: ListView(
            children: [
              Container(
                height: 200,
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
                  child: Container(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(15.15),
                  child: Text(
                    'Phonenumber',
                    style: kLabel,
                  ),
                ),
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 50,
                    width: 100,
                    color: Colors.black26,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CountryCodePicker(
                          initialSelection: 'ZA',
                          showFlag: true,
                          alignLeft: true,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 50,
                    width: 175,
                    color: Colors.black26,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: phonenumberController,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 250,
                alignment: Alignment.center,
                child: RaisedButton(
                  color: Colors.black54,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Login',
                      style: kButton,
                    ),
                  ),
                  onPressed: () {
                    context.read<AuthenticationService>().signIn(
                      phonenumber: phonenumberController.text,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
