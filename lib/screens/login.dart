import 'package:flutter/material.dart';

import '../controllers/dbhelper.dart';
import 'home.dart';

class login extends StatefulWidget {
  @override
  State<login> createState() => _login();
}

class _login extends State<login> {
  dbhelper db = new dbhelper();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SizedBox(
                width: double.infinity,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: SingleChildScrollView(
                        child: Column(children: [
                      SizedBox(height: 80),
                      const Text(
                        "ADMIN LOGIN",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 80),
                      Form(
                        key: _key,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: emailcontroller,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter admin email';
                                }

                                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                    .hasMatch(value)) {
                                  return 'Please enter a valid email address';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 42, vertical: 20),
                                  labelText: "Email",
                                  hintText: "Enter your email",
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(28),
                                      gapPadding: 10)),
                            ),
                            SizedBox(height: 30),
                            TextFormField(
                              controller: passcontroller,
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }

                                if (value.trim().length < 8) {
                                  return 'Password must be at least 8 characters in length';
                                }

                                return null;
                              },
                              decoration: InputDecoration(
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 42, vertical: 20),
                                  labelText: "Password",
                                  hintText: "Enter your password",
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(28),
                                      gapPadding: 10)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextButton(
                        onPressed: () {
                          Future s = db.AccountVerification(
                              emailcontroller.text.trim(),
                              passcontroller.text.trim());
                          s.then((value) => {
                                if (value.statusCode == 200)
                                  {
                                    // if (_key.currentState!.validate()) {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Home()))
                                  }
                                //}
                                // }
                              });
                        },
                        style: TextButton.styleFrom(
                            minimumSize: const Size(200, 50),
                            primary: Colors.white,
                            backgroundColor: Color(0xFFD44C66),
                            shape: const BeveledRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)))),
                        child: Text("ＬＯＧＩＮ"),
                      ),
                    ]))))));
  }
}
