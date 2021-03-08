import 'package:flutter/material.dart';
import 'package:workconstruction/classes/authentication_service.dart';
import 'package:workconstruction/palette.dart';
import 'package:workconstruction/screens/welcome/otp.dart';
import 'package:workconstruction/screens/widgets/widgets.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_code_picker/country_localizations.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart';

class Login extends StatelessWidget {
  final TextEditingController phonenumberController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  String areaCode = "+27";

  void _onCountryChange(CountryCode countryCode) {
    areaCode = countryCode.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(),
        Scaffold(
          bottomNavigationBar: const BottomAppBar(),
          backgroundColor: Colors.transparent,
          body: ListView(
            children: [
              const SizedBox(
                height: 200,
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Center(
                      child: Padding(
                    padding: EdgeInsets.all(25.0),
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
                child: const Padding(
                  padding: EdgeInsets.all(15.15),
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
                          alignLeft: true,
                          onChanged: _onCountryChange,
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
                        keyboardType: TextInputType.number,
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
                  onPressed: () {
                    print(areaCode);
                    if (phonenumberController.text.isEmpty == false &&
                        phonenumberController.text.length == 9) {
                      MaterialPageRoute(builder: (context) => OTP());
                      final String fullnumber =
                          areaCode +
                              phonenumberController.text;
                      context.read<AuthenticationService>().signIn(
                            phonenumber: fullnumber,
                          );
                      final snackBar = SnackBar(
                        content: const Text('Sending OTP'),
                        action: SnackBarAction(
                          label: 'Dismiss',
                          onPressed: () {},
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      final snackBar = SnackBar(
                        content: const Text('Please enter your number!'),
                        action: SnackBarAction(
                          label: 'Dismiss',
                          onPressed: () {},
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Login',
                      style: kButton,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
