import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop/pages/CreateAccount.dart';
import 'package:shop/pages/HomePage.dart';
import 'package:shop/utils.dart';

import '../Animations.dart';

class LoginWeb extends StatefulWidget {
  const LoginWeb({super.key});

  @override
  State<LoginWeb> createState() => _LoginWebState();
}

class _LoginWebState extends State<LoginWeb> {
  final userController = TextEditingController();
  final passwordController = TextEditingController();

  bool _showErrorUsername = false;
  bool _showErrorPassword = false;
  final _auth = FirebaseAuth.instance;
  bool loading = false;

  @override
  void dispose() {
    super.dispose();
    userController.dispose();
    passwordController.dispose();
  }

  void login() {
    setState(() {
      loading = true;
    });
    _auth
        .signInWithEmailAndPassword(
            email: userController.text.trim(),
            password: passwordController.text.trim())
        .then((value) {
      Navigator.pushReplacement(context, FadeRoute(page: HomePage()));
      setState(() {
        loading = false;
      });
    }).onError((error, stackTrace) {
      setState(() {
        loading = false;
      });
      Utils().toastMessage();
    });
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
                  child: SvgPicture.asset(
                      "lib/assets/Ecommerce web page-pana.svg"),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Login",
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
                                  hintText: "Username",
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
                        height: 20,
                      ),
                      const Center(
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_validateUsername() && _validatePassword()) {
                            login();
                          } else {
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
                          width: screenSize.width * 0.7,
                          margin: const EdgeInsets.symmetric(horizontal: 60),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.black,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              if (loading) // Show CircularProgressIndicator only when loading is true
                                const Positioned.fill(
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              const Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // // For now this is not needed
                      // if (_showErrorMessage)
                      //   const Padding(
                      //     padding: EdgeInsets.symmetric(
                      //       vertical: 15,
                      //     ),
                      //     child: Text(
                      //       'Please enter both username and password.',
                      //       style: TextStyle(color: Colors.red),
                      //     ),
                      //   ),

                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context, FadeRoute(page: const CreateAccount()));
                        },
                        child: const Center(
                          child: Text(
                            "Create Account",
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
