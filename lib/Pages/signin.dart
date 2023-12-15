import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pragati_v1/Providers/userProvider.dart';
import 'package:pragati_v1/Widgets/customText.dart';
import 'package:pragati_v1/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool? isButton1Selected = true;
  late UserProvider userProvider;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> _signInWithEmailAndPassword() async {
    try {
      await userProvider.auth.signInWithEmailAndPassword(
        email: userProvider.emailController.text.trim(),
        password: userProvider.passwordController.text.trim(),
      );
      // Get the user ID after successful login
      String id = userProvider.auth.currentUser!.uid;

      setState(() {
        userProvider.userId = id;
      });
      _showErrorSnackbar("Login Success");
      // Navigate to the home screen upon successful login
      GoRouter.of(context).go('/home');
    } catch (e) {
      // Handle login errors, e.g., display an error message
      print("Error: $e");
      // Show a snackbar with the error message
      _showErrorSnackbar("Login failed: $e");
    }
  }

  Future<void> _registerWithEmailAndPassword() async {
    try {
      UserCredential userCredential =
          await userProvider.auth.createUserWithEmailAndPassword(
        email: userProvider.emailController.text.trim(),
        password: userProvider.passwordController.text.trim(),
      );
      // Get the user ID after successful registration
      String id = userCredential.user!.uid;
      
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('user_id', id);
      
      setState(() {
        userProvider.userId = id;
      });

      _showErrorSnackbar("SignIn Success");
      // Navigate to the home screen upon successful registration
      GoRouter.of(context).go('/user');
    } catch (e) {
      // Handle registration errors, e.g., email already in use
      print("Error: $e");
      // Show a snackbar with the error message
      _showErrorSnackbar("Registration failed: $e");
    }
  }

  void _showErrorSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 3),
      ),
    );
  }

  Future<void> _signInWithGoogle() async {
    try {
      // Trigger Google Sign In
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        // The user canceled the sign-in process
        return;
      }

      // Obtain GoogleSignInAuthentication
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create GoogleAuthProvider credentials
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in with Google credentials
      final UserCredential userCredential =
          await userProvider.auth.signInWithCredential(credential);

      // Get the user ID after successful sign-in
      String id = userCredential.user!.uid;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('user_id', id);
      setState(() {
        userProvider.userId = id;
      });

      _showSuccessSnackbar("Sign In with Google Success");
      // Navigate to the home screen upon successful sign-in
      // GoRouter.of(context).go('/user');
    } catch (e) {
      // Handle sign-in errors
      print("Error: $e");
      // Show a snackbar with the error message
      _showErrorSnackbar("Sign In with Google failed: $e");
    }
  }

  void _showSuccessSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context);
    return WillPopScope(
      onWillPop: () async {
        context.go('/welcome');
        return false;
      },
      child: Scaffold(
        backgroundColor: MyApp.primaryColor,
        appBar: AppBar(
          title: const Text(MyApp.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    child: ElevatedButton(
                      style: isButton1Selected == true
                          ? ElevatedButton.styleFrom(
                              side: BorderSide(
                              width: 3,
                              color: MyApp.secondary,
                            ))
                          : ElevatedButton.styleFrom(
                              side: BorderSide(
                              width: 1,
                              color: MyApp.secondary,
                            )),
                      onPressed: (() {
                        setState(() {
                          isButton1Selected = true;
                        });
                      }),
                      child: customText(
                          'Sign In',
                          Colors.white,
                          28.0,
                          EdgeInsets.fromLTRB(45, 20, 30, 20),
                          FontWeight.w500,
                          FontStyle.normal),
                    ),
                  ),
                  Container(
                    child: ElevatedButton(
                      style: isButton1Selected == false
                          ? ElevatedButton.styleFrom(
                              side: BorderSide(
                              width: 3,
                              color: MyApp.secondary,
                            ))
                          : ElevatedButton.styleFrom(
                              side: BorderSide(
                              width: 1,
                              color: MyApp.secondary,
                            )),
                      onPressed: (() {
                        setState(() {
                          isButton1Selected = false;
                        });
                      }),
                      child: customText(
                          'Log In',
                          Colors.white,
                          28.0,
                          EdgeInsets.fromLTRB(30, 20, 55, 20),
                          FontWeight.w500,
                          FontStyle.normal),
                    ),
                  ),
                ],
              ),
              isButton1Selected == true
                  ? Column(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(30, 30, 30, 02),
                          child: TextField(
                            cursorColor: Colors.white,
                            controller: userProvider.emailController,
                            // obscureText: true,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontFamily: "Aeonik",
                            ),
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color: MyApp.secondary, width: 1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      BorderSide(color: MyApp.secondary),
                                ),
                                filled: true,
                                fillColor: Color.fromARGB(99, 18, 37, 53),
                                labelText: 'Email',
                                labelStyle: TextStyle(
                                    color: Colors.white54, letterSpacing: 1.3)),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(30, 20, 30, 02),
                          child: TextField(
                            cursorColor: Colors.white,
                            controller: userProvider.passwordController,
                            obscureText: true,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontFamily: "Aeonik",
                            ),
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color: MyApp.secondary, width: 1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      BorderSide(color: MyApp.secondary),
                                ),
                                filled: true,
                                fillColor: Color.fromARGB(99, 18, 37, 53),
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                    color: Colors.white54, letterSpacing: 1.3)),
                          ),
                        ),
                        Center(
                          child: Container(
                            margin: EdgeInsets.all(12.0),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.05,
                              width: MediaQuery.of(context).size.width * 0.85,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          MyApp.secondary),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                                ),
                                onPressed: () {
                                  // String name = _textFieldController1.text;
                                  // String password = _textFieldController2.text;
                                  _registerWithEmailAndPassword();
                                  userProvider.emailController.clear();
                                  userProvider.passwordController.clear();
                                  print(userProvider.userId);
                                },
                                child: const Text(
                                  'Submit',
                                  style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontSize: 22,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 40),
                          width: 65,
                          height: 65,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 5.0,
                            ),
                          ),
                          child: Center(
                            child: customText(
                                'OR',
                                Colors.white,
                                20,
                                EdgeInsets.fromLTRB(0, 0, 0, 0),
                                FontWeight.w500,
                                FontStyle.normal),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.085,
                          width: MediaQuery.of(context).size.width * 0.65,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 10,
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: SignInButton(
                            Buttons.Google,
                            text: "Sign in with Google",
                            onPressed: () async {
                              await _signInWithGoogle().then(
                                  (value) => GoRouter.of(context).go('/user'));
                            },
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(30, 30, 30, 02),
                          child: TextField(
                            cursorColor: Colors.white,
                            controller: userProvider.emailController,
                            // obscureText: true,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontFamily: "Aeonik",
                            ),
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color: MyApp.secondary, width: 1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      BorderSide(color: MyApp.secondary),
                                ),
                                filled: true,
                                fillColor: Color.fromARGB(99, 18, 37, 53),
                                labelText: 'Email',
                                labelStyle: TextStyle(
                                    color: Colors.white54, letterSpacing: 1.3)),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(30, 20, 30, 02),
                          child: TextField(
                            cursorColor: Colors.white,
                            controller: userProvider.passwordController,
                            obscureText: true,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontFamily: "Aeonik",
                            ),
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color: MyApp.secondary, width: 1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      BorderSide(color: MyApp.secondary),
                                ),
                                filled: true,
                                fillColor: Color.fromARGB(99, 18, 37, 53),
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                    color: Colors.white54, letterSpacing: 1.3)),
                          ),
                        ),
                        Center(
                          child: Container(
                            margin: EdgeInsets.all(32.0),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.06,
                              width: MediaQuery.of(context).size.width * 0.85,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          MyApp.secondary),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                                ),
                                onPressed: () {
                                  _signInWithEmailAndPassword();
                                  userProvider.emailController.clear();
                                  userProvider.passwordController.clear();
                                },
                                child: const Text(
                                  'Log In',
                                  style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontSize: 22,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
