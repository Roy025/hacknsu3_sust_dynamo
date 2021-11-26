import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hacknsu3_sust_dynamo/const.dart';
import 'package:hacknsu3_sust_dynamo/screens/Home/doc_apoint_req/doc_apoint_req_page.dart';
import 'package:hacknsu3_sust_dynamo/screens/Home/doctor_profiledit_page.dart';
import 'package:hacknsu3_sust_dynamo/screens/patient_home/dashboard.dart';
import 'package:hacknsu3_sust_dynamo/screens/patient_home/tabs/patient_profiledit_page.dart';
import 'package:lottie/lottie.dart';

class SignUp2 extends StatefulWidget {
  SignUp2({Key? key, required this.s}) : super(key: key);
  final String s;

  @override
  _SignUp2State createState() => _SignUp2State();
}

class _SignUp2State extends State<SignUp2> {
  var selected = 0;
  var _formKey = GlobalKey<FormState>();
  var texteditingControllerEmail = TextEditingController();
  var texteditingControllerPassword1 = TextEditingController();
  var texteditingControllerPassword2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        reverse: true,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              widget.s == "P"
                  ? Container(
                      height: screenH * .40,
                      width: screenH * .40,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        boxShadow: [
                          BoxShadow(
                              // color: Color.fromRGBO(0, 119, 182, 0.6),
                              color: const Color(0xff0077B6).withOpacity(.3),
                              offset: const Offset(3, 3),
                              blurRadius: 6),
                        ],
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 4,
                            child: LottieBuilder.network(
                              "https://assets6.lottiefiles.com/packages/lf20_ErlWV1.json",
                              reverse: true,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const Expanded(
                              flex: 1, child: Text("Sign Up as Patient"))
                        ],
                      ))
                  : Container(
                      height: screenH * .40,
                      width: screenH * .40,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        boxShadow: [
                          BoxShadow(
                              // color: Color.fromRGBO(0, 119, 182, 0.6),
                              color: const Color(0xff0077B6).withOpacity(.3),
                              offset: const Offset(3, 3),
                              blurRadius: 6),
                        ],
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          LottieBuilder.network(
                            "https://assets5.lottiefiles.com/packages/lf20_be0l7A.json",
                            fit: BoxFit.cover,
                          ),
                          const Text("Sign Up as Doctor")
                        ],
                      )),
              SizedBox(
                height: screenH * .05,
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
                width: screenW * 0.8,
                // height: 40,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                  boxShadow: [
                    BoxShadow(
                        // color: Color.fromRGBO(0, 119, 182, 0.6),
                        color: const Color(0xff0077B6).withOpacity(.3),
                        offset: selected == 1 ? Offset(3, 3) : Offset(0, 0),
                        blurRadius: selected == 1 ? 6 : 2),
                  ],
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextFormField(
                    onTap: () {
                      setState(() {
                        selected = 1;
                      });
                    },
                    controller: texteditingControllerEmail,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: const Icon(
                        Icons.person,
                        color: textColor,
                      ),
                      hintText: 'Email',
                      hintStyle: GoogleFonts.roboto(
                        fontSize: 12.0,
                        letterSpacing: 1.5,
                        color: textColor,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter email';
                      }
                      // regex for email
                      if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                        return 'Please enter valid email';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(
                height: screenH * .05,
              ),
              AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  width: screenW * 0.8,
                  // height: 40,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                      boxShadow: [
                        BoxShadow(
                            // color: Color.fromRGBO(0, 119, 182, 0.4),
                            // color: const Color(0xff003757),
                            color: const Color(0xff0077B6).withOpacity(.3),
                            offset: selected == 2 ? Offset(3, 3) : Offset(0, 0),
                            blurRadius: selected == 2 ? 9 : 2)
                      ],
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 0, 10, 0),
                    child: Center(
                      child: TextFormField(
                        onTap: () {
                          setState(() {
                            selected = 2;
                          });
                        },
                        controller: texteditingControllerPassword1,
                        obscureText: true,
                        decoration: InputDecoration(
                          icon: const Icon(
                            Icons.lock,
                            color: textColor,
                          ),
                          border: InputBorder.none,
                          hintText: 'Password',
                          hintStyle: GoogleFonts.roboto(
                              fontSize: 12.0,
                              letterSpacing: 1.5,
                              // height: 1.5,
                              color: textColor.withOpacity(1.0)),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 6) {
                            return 'Password must be 6 character';
                          }
                          return null;
                        },
                      ),
                    ),
                  )),
              SizedBox(
                height: screenH * .05,
              ),
              AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  width: screenW * 0.8,
                  // height: 40,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                      boxShadow: [
                        BoxShadow(
                            // color: Color.fromRGBO(0, 119, 182, 0.4),
                            // color: const Color(0xff003757),
                            color: const Color(0xff0077B6).withOpacity(.3),
                            offset: selected == 3 ? Offset(3, 3) : Offset(0, 0),
                            blurRadius: selected == 3 ? 9 : 2)
                      ],
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 0, 10, 0),
                    child: Center(
                      child: TextFormField(
                        onTap: () {
                          setState(() {
                            selected = 3;
                          });
                        },
                        controller: texteditingControllerPassword2,
                        obscureText: true,
                        decoration: InputDecoration(
                          icon: const Icon(
                            Icons.lock,
                            color: textColor,
                          ),
                          border: InputBorder.none,
                          hintText: 'Confirm Password',
                          hintStyle: GoogleFonts.roboto(
                              fontSize: 12.0,
                              letterSpacing: 1.5,
                              // height: 1.5,
                              color: textColor.withOpacity(1.0)),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 6) {
                            return 'Password must be 6 character';
                          }
                          if (value != texteditingControllerPassword1.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                    ),
                  )),
              SizedBox(
                height: screenH * .05,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    selected = 0;
                  });
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: texteditingControllerEmail.text,
                          password: texteditingControllerPassword1.text)
                      .then((value) {
                    value.user!.updateDisplayName(widget.s);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => widget.s == "P"
                                ? patient_profEdit()
                                : doctor_profEdit()));
                  }).catchError((e) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Error occured"),
                      backgroundColor: Colors.red,
                    ));
                  });
                },
                child: SizedBox(
                  height: 40,
                  width: screenW * 0.8,
                  child: Center(
                      child: Text(
                    'Sign in',
                    style: textStyleWhite,
                  )),
                ),
              ),
              SizedBox(
                height: screenH * .1,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
