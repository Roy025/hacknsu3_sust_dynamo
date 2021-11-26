// ignore_for_file: unnecessary_string_escapes

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hacknsu3_sust_dynamo/const.dart';
import 'package:hacknsu3_sust_dynamo/screens/patient_home/tabs/notification.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class CardItem {
  final Image image;
  final String title;

  const CardItem({required this.image, required this.title});
}

class _HomeState extends State<Home> {
  List<CardItem> items = [
    CardItem(
      image: Image.asset("assets/images/lung.png"),
      title: 'Lung',
    ),
    CardItem(
      image: Image.asset("assets/images/tooth.jpg"),
      title: 'Tooth',
    ),
    CardItem(
      image: Image.asset("assets/images/brain.jpg"),
      title: 'Brain',
    ),
    CardItem(
      image: Image.asset("assets/images/stomach.jpg"),
      title: 'Stomach',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.fromLTRB(8, screenH * .05, 8, 0),
        child: Column(
          children: <Widget>[
            CupertinoSearchTextField(
              backgroundColor: Colors.blueGrey.shade100,
            ),
            SizedBox(
              height: 18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  height: screenH / 4.3,
                  width: screenW / 2.5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          "assets/images/primary_healthcare.png",
                          fit: BoxFit.contain,
                        ),
                        Text(
                          'Primary Healthcare',
                          style: GoogleFonts.roboto(
                            fontSize: 12.0,
                            color: textColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: screenW / 15),
                Container(
                  height: screenH / 4.3,
                  width: screenW / 2.5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          "assets/images/doctors.png",
                          fit: BoxFit.contain,
                        ),
                        Text(
                          'Doctors',
                          style: GoogleFonts.roboto(
                            fontSize: 12.0,
                            color: textColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: screenH / 20,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Catagories',
                style: GoogleFonts.roboto(
                  fontSize: 30,
                  letterSpacing: 1.5,
                  color: Colors.blue,
                ),
              ),
            ),
            SizedBox(
              height: screenH / 30,
            ),
            Container(
              height: screenH / 5,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                // separatorBuilder: (context, _) => SizedBox(width: screenW / 15),
                itemBuilder: (context, index) => buildCard(item: items[index]),
              ),
            ),
            SizedBox(
              height: screenH * .10,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Color(0xffff0000)),
                onPressed: () {
                  //snackbar implementation
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Work In Progress")));
                },
                child: Text(
                  'SOS',
                  style: GoogleFonts.roboto(
                      fontSize: 20,
                      letterSpacing: 1.5,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),
    );
  }

  Widget buildCard({
    required CardItem item,
  }) =>
      InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Material(child: Completed())));
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: screenH / 5,
            width: screenW / 3,
            child: Column(
              children: [
                Expanded(
                  child: item.image,
                ),
                Align(
                    alignment: Alignment.center,
                    child: Text(
                      item.title,
                      style: GoogleFonts.roboto(
                        fontSize: 12,
                        letterSpacing: 1.5,
                        color: textColor,
                      ),
                    )),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: Offset(2, 3), // changes position of shadow
                ),
              ],
            ),
          ),
        ),
      );
}
