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
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 229, 121, 85),
        
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 140, 0, 0),
                    child: Row(
                      children: [
                        Text('Welcome ',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    
                      ],
                    ),
                    
                  ),
                ],
              ),
      
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 80, 300, 0),
                child: Text('LOGIN',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                ),
              ),
              
      
              SizedBox(height: 40,),
      
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
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
              ),
      
              SizedBox(height: 30,),
      
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
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
              ),
      
             SizedBox(
              height: 15,
             ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: Row(children: [
                  Checkbox(value: _isChecked, onChanged: (value){
                        setState(() => _isChecked = value!);
                       },
                       activeColor: Colors.white,
                       checkColor: Colors.black,
                       
                       ),
        
                       Text("Remember me",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    
                  ),
                  ),
                  SizedBox(width: 80,),
                  TextButton(onPressed: (){}, 
                  child: Text("Forgot Password?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    
                  ),
                  ),)
                        
                ],),
              ),
      
               Padding(
                              padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  // side: BorderSide(
                                  //   color: Colors.white),
                                    backgroundColor:Colors.black,
                                    
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
                                    ),
                                    
                                onPressed: () async{
                                  var db = AppDatabase.db;
                                  var check = await db.authenticateUser(
                                    emailController.text.toString(), 
                                    passwordController.text.toString(),
                                    );

                                    if(check){
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> OnBoardingScreen()));

                                    }else{
                                      
                                    }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 130, vertical: 20),
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ),
                            ),
      
      
                            Padding(
                               padding: const EdgeInsets.fromLTRB(110, 20, 0, 0),
                               child: Row(children: [
                                Text("Don't have an account?",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    
                                  ),
                                  ),
        
                                  TextButton(onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpPage()));
                                  }, child: Text("Sign Up",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                    
                                  ),
                                  ),)
                               ],),
                             )
        
            ],
          ),
        ),
      ),
    );
      
      
    
  }
}