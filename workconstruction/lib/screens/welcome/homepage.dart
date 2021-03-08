import 'package:flutter/material.dart';
import 'package:workconstruction/classes/authentication_service.dart';
import 'package:provider/provider.dart';
import 'package:workconstruction/palette.dart';
import 'package:workconstruction/screens/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 300,
          color: Colors.yellow,
        ),
        Expanded(
          child: Column(
            children: [
              Container(
                child: RaisedButton(
                  onPressed: () {
                    context.read<AuthenticationService>().signOut();
                  },
                  child: const Text("Logout"),
                )
              ),
              Container(
                child: RaisedButton(onPressed: () {}),
              ),
              Container(
                child: RaisedButton(onPressed: () {})
              ),
            ],
          )
        )
      ],
    );
  }
}

