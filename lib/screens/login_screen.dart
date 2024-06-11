import 'package:flutter/material.dart';
import 'package:uber_ride/repository/local/local_database.dart';
import 'package:uber_ride/screens/onboarding_screen.dart';
import 'package:uber_ride/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 229, 121, 85),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(mediaQuery.size.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: mediaQuery.size.height * 0.15),
              Row(
                children: [
                  Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: mediaQuery.size.height * 0.04,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: mediaQuery.size.height * 0.1),
              Text(
                'LOGIN',
                style: TextStyle(
                  fontSize: mediaQuery.size.height * 0.03,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: mediaQuery.size.height * 0.05),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: mediaQuery.size.width * 0.05),
                  child: TextField(
                    cursorColor: Color.fromARGB(255, 213, 129, 3),
                    controller: emailController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.white,
                      labelText: 'Email',
                    ),
                  ),
                ),
              ),
              SizedBox(height: mediaQuery.size.height * 0.03),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: mediaQuery.size.width * 0.05),
                  child: TextField(
                    cursorColor: Color.fromARGB(255, 213, 129, 3),
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.white,
                      labelText: 'Password',
                    ),
                  ),
                ),
              ),
              SizedBox(height: mediaQuery.size.height * 0.02),
              Row(
                children: [
                  Checkbox(
                    value: _isChecked,
                    onChanged: (value) {
                      setState(() => _isChecked = value!);
                    },
                    activeColor: Colors.white,
                    checkColor: Colors.black,
                  ),
                  Text(
                    "Remember me",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: mediaQuery.size.height * 0.02,
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: mediaQuery.size.height * 0.02,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: mediaQuery.size.height * 0.05),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () async {
                    var db = AppDatabase.db;
                    var check = await db.authenticateUser(
                      emailController.text.toString(),
                      passwordController.text.toString(),
                    );

                    if (check) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OnBoardingScreen(),
                        ),
                      );
                    } else {
                      // Show an error message
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: mediaQuery.size.width * 0.2,
                      vertical: mediaQuery.size.height * 0.02,
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: mediaQuery.size.height * 0.025,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: mediaQuery.size.height * 0.03),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: mediaQuery.size.height * 0.02,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpPage()),
                        );
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: mediaQuery.size.height * 0.02,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
