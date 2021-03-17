import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class viewprofile extends StatefulWidget {
  @override
  final DocumentSnapshot document;
  const viewprofile(this.document);
  _viewprofileState createState() => _viewprofileState(document);
}

class _viewprofileState extends State<StatefulWidget> {
  final DocumentSnapshot document;
  _viewprofileState(this.document);
  String _img;
  final FirebaseAuth fAuth = FirebaseAuth.instance;
  firebase_storage.Reference fStorageRef;
  final FirebaseFirestore fStore = FirebaseFirestore.instance;

  Future<String> _loadImage(DocumentSnapshot document) async {
    String ref = document["IDRef"].toString();
    fStorageRef = firebase_storage.FirebaseStorage.instance.ref().child(ref);
    String img = await fStorageRef.getDownloadURL();
    if (img != null) {
      return img;
    }
  }

  String img(DocumentSnapshot document) {
    _loadImage(document).then((value) {
      _img = value;
      setState(() {
        _img = value;
      });
    });
    if (_img != null) {
      return _img;
    } else {
      return 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQg2LdiecyCVRWjMbDinmlaVe57SJUK2m4QXOCdp1BgB6VUmGaV&usqp=CAU';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(document["FirstName"].toString() + "'s Info"),
        backgroundColor: Color.fromARGB(255, 255, 227, 48),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(20.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  //margin: const EdgeInsets.only(left: 12.0, bottom: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.mail,
                  color: Colors.black,
                ),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 227, 48),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Color(0xFFE5E5E5),
              ),
            ),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: RichText(
                    text: TextSpan(
                      text: "Name: " +
                          document["FirstName"].toString() +
                          " " +
                          document["LastName"].toString() +
                          "\n",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: RichText(
                        text: TextSpan(
                          text: "ID: \t" +
                              document["FirstName"].toString() +
                              " " +
                              document["LastName"].toString() +
                              "\n",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            text: document["FirstName"].toString() +
                                document["LastName"].toString() +
                                "\n",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        Container(
                          child: Image.network(
                            img(document),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
