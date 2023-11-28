

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_user_app/AdminPanel/AdminHomeScreen.dart';
import 'package:event_user_app/Pages/Home.dart';
import 'package:event_user_app/Pages/SignUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;


import '../Service/Auth_Service.dart';


class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool circular = false;
  bool _isObscure = true;
  bool visible = false;

  final _auth = FirebaseAuth.instance;
  AuthClass authClass = AuthClass();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: Form(key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sign In",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              buttomItem(
                  context, "lib/assets/google.png", "Continue With Google", 25,(){
                authClass.googleSignIn(context);
              }),
              SizedBox(
                height: 15,
              ),
              buttomItem(
                  context, "lib/assets/phone.png", "Continue WIth Phone", 30,(){}),
              SizedBox(
                height: 15,
              ),
              Text(
                "Or",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                width: double.infinity,
                height: 55,
                child: TextFormField(
                  style: TextStyle(color: Colors.white, fontSize: 17),

                  controller: _emailController,
                  decoration: InputDecoration(
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    labelText: "email",
                    labelStyle: TextStyle(color: Colors.white, fontSize: 17),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1.5, color: Colors.amber),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: (value) {
                    if (value!.length == 0) {
                      return "Email cannot be empty";
                    }
                    if (!RegExp(
                        "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                        .hasMatch(value)) {
                      return ("Please enter a valid email");
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    _emailController.text = value!;
                  },
                  keyboardType: TextInputType.emailAddress,),
              ),

              SizedBox(
                height: 15,
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                width: double.infinity,
                height: 55,
                child: TextFormField(
                  style: TextStyle(color: Colors.white, fontSize: 17),
                  obscureText: _isObscure,

                  controller: _passwordController,
                  decoration: InputDecoration(suffixIcon: IconButton(
                      icon: Icon(_isObscure
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      }),
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    labelText: "password",
                    labelStyle: TextStyle(
                        color: Colors.white, fontSize: 17),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1.5, color: Colors
                          .amber),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: (value) {
                    RegExp regex = new RegExp(r'^.{6,}$');
                    if (value!.isEmpty) {
                      return "Password cannot be empty";
                    }
                    if (!regex.hasMatch(value)) {
                      return ("please enter valid password min. 6 character");
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    _passwordController.text = value!;
                  },

                  onChanged: (value) {},),
              ),
              SizedBox(
                height: 30,
              ),
              colorButton(context),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't Have An Account? ",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  InkWell( onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (builder) => SignUpPage()),
                            (route) => false);
                  },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Forgot Password?",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget colorButton(context) {
    return InkWell(
      onTap: (){
        setState(() {
          visible = true;
        });
        signIn(
            _emailController.text, _passwordController.text);

      },
      // onTap: () async {
      //   try {
      //     firebase_auth.UserCredential userCredential =
      //     await firebaseAuth.signInWithEmailAndPassword(
      //         email: _emailController.text,
      //         password: _passwordController.text);
      //     print(userCredential.user!.email);
      //     setState(() {
      //       circular = false;
      //     });
      //     Navigator.pushAndRemoveUntil(
      //         context,
      //         MaterialPageRoute(builder: (builder) => HomeScreen()),
      //             (route) => false);
      //   } catch (e) {
      //     final snackbar = SnackBar(
      //       content: Text(
      //         e.toString(),
      //       ),
      //     );
      //     ScaffoldMessenger.of(context).showSnackBar(snackbar);
      //     setState(() {
      //       circular = false;
      //     });
      //   }
      // },
      child: Container(
        margin: EdgeInsets.only(left: 15, right: 15),
        height: 60,
        width: MediaQuery.of(context).size.width * 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              Color(0xfffd746c),
              Color(0xffff9868),
              Color(0xfffd746c),
            ],
          ),
        ),
        child: Center(
            child: circular
                ? CircularProgressIndicator()
                :  Text(
              "Sign In",
              style: TextStyle(
                  color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            )),
      ),
    );
  }

  Widget buttomItem(context, String imagepath, String buttonName, double size,VoidCallback onTap) {
    return InkWell(onTap:onTap,
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        width: MediaQuery.of(context).size.width * 60,
        height: 60,
        child: Card(
          color: Colors.black,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(width: 1, color: Colors.grey)),
          elevation: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagepath,
                height: size,
                width: size,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                buttonName,
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
            ],
          ),
        ),
      ),
    );
  }
  //
  // Widget textItem(context, String labelText, TextEditingController controller,
  //     bool obscureText) {
  //   return Container(
  //     margin: EdgeInsets.only(left: 15, right: 15),
  //     width: double.infinity,
  //     height: 55,
  //     child: TextFormField(
  //       style: TextStyle(color: Colors.white, fontSize: 17),
  //       obscureText: obscureText,
  //       controller: controller,
  //       decoration: InputDecoration(
  //         errorBorder: InputBorder.none,
  //         disabledBorder: InputBorder.none,
  //         labelText: labelText,
  //         labelStyle: TextStyle(color: Colors.white, fontSize: 17),
  //         enabledBorder: OutlineInputBorder(
  //           borderSide: BorderSide(width: 1, color: Colors.grey),
  //           borderRadius: BorderRadius.circular(15),
  //         ),
  //         focusedBorder: OutlineInputBorder(
  //           borderSide: BorderSide(width: 1.5, color: Colors.amber),
  //           borderRadius: BorderRadius.circular(15),
  //         ),
  //       ),
  //     ),
  //   );
  // }
  void route() {
    User? user = FirebaseAuth.instance.currentUser;
    var kk = FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        if (documentSnapshot.get('rool') == "Admin") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>  AdminHomeScreen(),
            ),
          );
        }else{
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>  HomeScreen(),
            ),
          );
        }
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  void signIn(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      try {
        UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        route();
      } on FirebaseAuthException catch (e) {
        final snackbar = SnackBar(
          content: Text(
            e.toString(),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
        setState(() {
          circular = false;
        });
      }
    }
  }
}
