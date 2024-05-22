import 'package:flutter/material.dart';
import 'package:uber_ride/screens/dashboard_screen.dart';
import 'package:uber_ride/screens/login_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 229, 121, 85),
      body: Stack(
        children: [

          Padding(
            padding: const EdgeInsets.fromLTRB(20, 140, 0, 0),
            child: Image.asset('assets/icons/ic_car.png',
            width: 150,
            ),
          ),
 
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 280, 0, 0),
            child: Text('Start your Jounrney with us',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.fromLTRB(35, 350, 0, 0),
            child: Text('Users have the liberty to choose the',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(35, 370, 0, 0),
            child: Text('type of vehicle as per their need.',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(0, 400, 0, 0),
            child: Image.asset('assets/icons/ic_carlocation.png'),
          ),


          Padding(
            padding: const EdgeInsets.fromLTRB(50, 700, 50, 0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:Colors.black,
                                    
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
              ),
              
              onPressed: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=> DashBoardScreen()));
                                    }, child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 20),
                                      child: Row(
                                        children: [
                                          Text("Let's get rides",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold
                                            
                                          ),
                                          ),

                                          
                                          SizedBox(width: 20,),
                                          Icon(Icons.forward,
                                          color: Colors.white,
                                          )
                                        ],
                                      ),
                                    ),),
          )
        ],

        
      ),
    );
  }
}

