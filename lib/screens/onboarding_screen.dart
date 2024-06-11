import 'package:flutter/material.dart';
import 'package:uber_ride/screens/dashboard_screen.dart';
import 'package:uber_ride/screens/login_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 229, 121, 85),
      body: Stack(
        children: [
          Positioned(
            left: mediaQuery.size.width * 0.05,
            top: mediaQuery.size.height * 0.2,
            child: Image.asset(
              'assets/icons/ic_car.png',
              width: mediaQuery.size.width * 0.4,
            ),
          ),
          Positioned(
            left: mediaQuery.size.width * 0.08,
            top: mediaQuery.size.height * 0.4,
            child: Text(
              'Start your Journey with us',
              style: TextStyle(
                fontSize: mediaQuery.size.height * 0.04,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            left: mediaQuery.size.width * 0.1,
            top: mediaQuery.size.height * 0.5,
            child: Text(
              'Users have the liberty to choose the',
              style: TextStyle(
                fontSize: mediaQuery.size.height * 0.02,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            left: mediaQuery.size.width * 0.1,
            top: mediaQuery.size.height * 0.52,
            child: Text(
              'type of vehicle as per their need.',
              style: TextStyle(
                fontSize: mediaQuery.size.height * 0.02,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: mediaQuery.size.height * 0.55,
            child: Image.asset(
              'assets/icons/ic_carlocation.png',
              width: mediaQuery.size.width,
            ),
          ),
          Positioned(
            left: mediaQuery.size.width * 0.1,
            right: mediaQuery.size.width * 0.1,
            bottom: mediaQuery.size.height * 0.1,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashBoardScreen()),
                );
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: mediaQuery.size.height * 0.02,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Let's get rides",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: mediaQuery.size.height * 0.025,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: mediaQuery.size.width * 0.05),
                    Icon(
                      Icons.forward,
                      color: Colors.white,
                      size: mediaQuery.size.height * 0.03,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
