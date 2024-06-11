import 'package:flutter/material.dart';
import 'package:uber_ride/screens/login_screen.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var nameController = TextEditingController();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var phoneController = TextEditingController();
    

  @override
  Widget build(BuildContext context) {
    return Scaffold(
 backgroundColor: const Color.fromARGB(255, 229, 121, 85),

      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 140, 0, 0),
                    child: Row(
                      children: [
                        Text('SignUp ',
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
      
             
              
      
              const SizedBox(height: 40,),


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
                      
                      cursorColor: const Color.fromARGB(255, 213, 129, 3),
                      controller: nameController,
                      
                      decoration: const InputDecoration(
                        
                        border: InputBorder.none,
                        fillColor: Colors.white,
                        labelText: 'Name',
                        
                        
                      ),
                    ),
                  ),
                )),

                const SizedBox(height: 30,),
      
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
                      
                      cursorColor: const Color.fromARGB(255, 213, 129, 3),
                      controller: emailController,
                      
                      decoration: const InputDecoration(
                        
                        border: InputBorder.none,
                        fillColor: Colors.white,
                        labelText: 'Email',
                        
                        
                      ),
                    ),
                  ),
                ),
              ),
      
              const SizedBox(height: 30,),
      
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
                      
                      cursorColor: const Color.fromARGB(255, 213, 129, 3),
                      controller: passwordController,
                      
                      decoration: const InputDecoration(
                        
                        border: InputBorder.none,
                        fillColor: Colors.white,
                        labelText: 'Password',
                        
                        
                      ),
                    ),
                  ),
                  
                ),
              ),

                const SizedBox(height: 30,),

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
                      
                      cursorColor: const Color.fromARGB(255, 213, 129, 3),
                      controller: phoneController,
                      
                      decoration: const InputDecoration(
                        
                        border: InputBorder.none,
                        fillColor: Colors.white,
                        labelText: 'PhoneNo',
                        
                        
                      ),
                    ),
                  ),
                )),
              
      
             
      
            
      
               Padding(
                              padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  // side: BorderSide(
                                  //   color: Colors.white),
                                    backgroundColor:Colors.black,
                                    
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
                                    ),
                                    
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginScreen()));
                                },
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 130, vertical: 20),
                                  child: Text(
                                    "SignUp",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ),
                            ),
      
      
                           
        
            ],
          ),
        ),
      ),
    );
  }
}