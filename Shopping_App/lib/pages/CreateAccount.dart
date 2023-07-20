import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop/pages/Loginweb.dart';
import 'package:shop/pages/Successful.dart';
import 'package:shop/utils.dart';

import '../Animations.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final userController = TextEditingController();
  final passwordController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  bool _showErrorUsername = false;
  bool _showErrorPassword = false;
  bool loading = false;

  @override
  void dispose() {
    super.dispose();
    userController.dispose();
    passwordController.dispose();
  }

  bool _validateUsername() {
    return userController.text.trim().isNotEmpty;
  }

  bool _validatePassword() {
    return passwordController.text.trim().isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: screenSize.height,
            width: screenSize.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenSize.height / 10,
                ),
                SizedBox(
                  height: screenSize.height / 3,
                  width: screenSize.width,
                  child:
                      SvgPicture.asset("lib/assets/Authentication-rafiki.svg"),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Create Account",
                        style: TextStyle(
                          color: Colors.grey.shade800,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 20,
                              offset: Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.grey),
                                ),
                              ),
                              child: TextField(
                                controller: userController,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                      Icons.alternate_email_outlined),
                                  prefixIconColor: (_showErrorUsername)
                                      ? Colors.red
                                      : Colors.blue,
                                  border: InputBorder.none,
                                  hintText: "Email address",
                                  hintStyle:
                                      const TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: TextField(
                                controller: passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  prefixIcon:
                                      const Icon(Icons.lock_open_outlined),
                                  prefixIconColor: (_showErrorPassword)
                                      ? Colors.red
                                      : Colors.blue,
                                  border: InputBorder.none,
                                  hintText: "Password",
                                  hintStyle:
                                      const TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_validateUsername() && _validatePassword()) {
                            setState(() {
                              loading = true;
                            });

                            _auth
                                .createUserWithEmailAndPassword(
                                    email:
                                        userController.text.toString().trim(),
                                    password: passwordController.text
                                        .toString()
                                        .trim())
                                .then((value) {
                              // User created successfully, navigate to the Successful page
                              setState(() {
                                loading = false;
                              });
                              Navigator.pushReplacement(
                                  context, FadeRoute(page: const Successful()));
                            }).catchError((error) {
                              // Handle the error here (login failed)
                              setState(() {
                                loading = false;
                              });
                              Utils()
                                  .toastMessage(); // Show the error message using a toast or any other method
                            });
                          } else {
                            // Handle validation errors here
                            if (!_validateUsername()) {
                              setState(() {
                                _showErrorUsername = true;
                              });
                            }

                            if (!_validatePassword()) {
                              setState(() {
                                _showErrorPassword = true;
                              });
                            }
                          }
                        },
                        child: Container(
                          height: 50,
                          margin: const EdgeInsets.symmetric(horizontal: 60),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.black,
                          ),
                          child: const Center(
                            child: Text(
                              "Create Account",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context, FadeRoute(page: const LoginWeb()));
                        },
                        child: const Center(
                          child: Text(
                            "Have an account? Login ",
                            style: TextStyle(
                                color: Color.fromRGBO(49, 39, 79, .6),
                                fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
