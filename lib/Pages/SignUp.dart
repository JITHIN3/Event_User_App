import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_user_app/Pages/Home.dart';
import 'package:event_user_app/Pages/PhoneAuthPage.dart';
import 'package:event_user_app/Pages/SignIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import '../Service/Auth_Service.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmpassController = TextEditingController();
  bool circular = false;
  bool showProgress = false;
  bool visible = false;
  final _auth = FirebaseAuth.instance;
  final _formkey = GlobalKey<FormState>();
  AuthClass authClass = AuthClass();
  bool _isObscure = true;
  bool _isObscure2 = true;
  var options = [
    'User',
    'Admin',
  ];
  var _currentItemSelected = "User";
  var rool = "User";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sign Up",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30,),

                roledrop(),



                SizedBox(
                  height: 20,
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
                      hintText: "email",
                      hintStyle: TextStyle(color: Colors.white, fontSize: 15),
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
                      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                          .hasMatch(value)) {
                        return ("Please enter a valid email");
                      } else {
                        return null;
                      }
                    },
                  ),
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
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          icon: Icon(_isObscure
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          }),
                      disabledBorder: InputBorder.none,
                      hintText: "password",
                      hintStyle: TextStyle(color: Colors.white, fontSize: 15),
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
                    onChanged: (value) {},
                  ),
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
                    obscureText: _isObscure2,
                    controller: _confirmpassController,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          icon: Icon(_isObscure2
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _isObscure2 = !_isObscure2;
                            });
                          }),
                      disabledBorder: InputBorder.none,
                      hintText: "Confirm password",
                      hintStyle: TextStyle(color: Colors.white, fontSize: 15),
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
                      if (_confirmpassController.text !=
                          _passwordController.text) {
                        return "Password did not match";
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {},
                  ),
                ),

                SizedBox(
                  height: 30,
                ),

                colorButton(context),
                SizedBox(
                  height: 30,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                  buttomItem(context, "lib/assets/google.png",
                      "Continue With Google", 25, () async {
                        await authClass.googleSignIn(context);
                      }),

                  buttomItem(
                      context, "lib/assets/phone.png", "Continue WIth Phone", 30,
                          () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (builder) => PhoneAuthPage(),
                          ),
                        );
                      }),
                ],),






                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already Have An Account? ",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => SignInPage()),
                            (route) => false);
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget roledrop(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        DropdownButton<String>(underline: SizedBox(),
          dropdownColor: Colors.black,
          isDense: true,
         style: TextStyle(fontWeight: FontWeight.w300),
          isExpanded: false,
          iconEnabledColor: Colors.white,
          focusColor: Colors.white,
          items: options.map((String dropDownStringItem) {


            return DropdownMenuItem<String>(
              value: dropDownStringItem,
              child: Text(
                dropDownStringItem,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            );
          }).toList(),
          onChanged: (newValueSelected) {
            setState(() {
              _currentItemSelected = newValueSelected!;
              rool = newValueSelected;
            });
          },
          value: _currentItemSelected,
        ),
      ],
    );
  }

  Widget colorButton(context) {
    return InkWell(
      onTap: () {
        setState(() {
          showProgress = true;
        });
        signUp(_emailController.text, _passwordController.text, rool);
      },
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
                : Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
      ),
    );
  }

  Widget buttomItem(context, String imagepath, String buttonName, double size,
      VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          width: 100,
          height: 60,
          child: CircleAvatar(
            backgroundColor: Colors.white.withOpacity(.1),
            child: Image.asset(
              imagepath,
              height: size,
              width: size,
            ),
          )),
    );
  }

  Widget textItem(context, String labelText, TextEditingController controller,
      bool obscureText) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      width: double.infinity,
      height: 55,
      child: TextFormField(
        style: TextStyle(color: Colors.white, fontSize: 17),
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          labelText: labelText,
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
      ),
    );
  }

  void signUp(String email, String password, String rool) async {
    CircularProgressIndicator();
    if (_formkey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore(email, rool)})
          .catchError((e) {});
    }
  }

  postDetailsToFirestore(String email, String rool) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var user = _auth.currentUser;
    CollectionReference ref = FirebaseFirestore.instance.collection('users');
    ref.doc(user!.uid).set({'email': _emailController.text, 'rool': rool});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SignInPage()));
  }
}
