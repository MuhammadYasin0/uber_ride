// import 'package:flutter/material.dart';
// import 'package:uber_ride/domain/app_constants.dart';

// import 'navigation_screen.dart';

// class DashBoardScreen extends StatefulWidget {
//   @override
//   State<DashBoardScreen> createState() => _MyAppState();
// }

// class _MyAppState extends State<DashBoardScreen> {
//   TextEditingController latController = TextEditingController();
//   TextEditingController lngController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 229, 121, 85),
      
//       body: Padding(
//         padding: const EdgeInsets.all(18.0),
//         child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [

//         Image.asset('assets/icons/ic_location.png'),


//           Text(
//             'Enter your location',
            
//             style: TextStyle(fontSize: 40,
//             color: Colors.white),
//           ),
//           SizedBox(
//             height: 30,
//           ),
          


//            Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 5),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.black26),
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(20)
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 24),
//                     child: TextField(
                      
//                       cursorColor: Color.fromARGB(255, 213, 129, 3),
//                       controller: latController,
                      
//                       decoration: InputDecoration(
                        
//                         border: InputBorder.none,
//                         fillColor: Colors.white,
//                         labelText: 'Latitude',
                        
                        
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//           SizedBox(
//             height: 20,
//           ),
//           Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 5),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.black26),
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(20)
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 24),
//                     child: TextField(
                      
//                       cursorColor: Color.fromARGB(255, 213, 129, 3),
//                       controller: lngController,
                      
//                       decoration: InputDecoration(
                        
//                         border: InputBorder.none,
//                         fillColor: Colors.white,
//                         labelText: 'Longitude',
                        
                        
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//           SizedBox(
//             height: 40,
//           ),
//           Container(
//             width: double.infinity,
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor:Colors.black,
                                    
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
//               ),
//                 onPressed: () {
//                  Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context) => NavigationScreen(
//                           double.parse(fromAddress.text),
//                           double.parse(lngController.text))));
//                 },
//                 child: Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 130, vertical: 20),
//                                   child: Text(
//                                     "Get Directions",
//                                     style: TextStyle(
//                                       fontSize: 18,
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.bold
//                                     ),
//                                   ),
//                                 ),
//                 ),
//           ),
//         ]),
//       ),

//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       floatingActionButton: FloatingActionButton(
//           child: Icon(Icons.add,
//           size: 30,
//           color: Color.fromARGB(255, 229, 121, 85),
//           ),
//           backgroundColor: Colors.white,
//           onPressed: (){

            
            
//             showModalBottomSheet(
//           backgroundColor: Color.fromARGB(255, 40, 35, 35),
//         shape:  RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(top: Radius.circular(10))
//         ),
//         context: context, builder: (_){
              
//         return  Column(
//           children: [
//             Expanded(
//               child: Container(
                
//                // height: 10,
//                  //padding: EdgeInsets.all(20.0),
//                 child: ListView.builder(
                  
//                   scrollDirection: Axis.horizontal,
//                   itemCount: AppConstants.rideCategory.length,
//                   itemBuilder: ((_,index){
//                     Map<String, dynamic> currItem = AppConstants.rideCategory[index];
//                     return Container(
//                       decoration: BoxDecoration(
//                          color: Color.fromARGB(255, 78, 77, 77),
//                         borderRadius: BorderRadius.circular(30)
//                       ),
//                       margin: EdgeInsets.symmetric(horizontal: 5, vertical: 50),
                      
//                       child: Column(
//                         children: [
//                           Row(
//                             children: [
//                               Padding(
//                                   padding: const EdgeInsets.only(left: 18.0, right: 18.0),
//                                   child: ClipRRect(
//                                     //borderRadius: BorderRadius.circular(14.0),
//                                     child: Image.asset(currItem['imgPath'],
                                    
//                                     width: 100,
//                                     height: 60,
//                                    // fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                 ),
                
//                             ],
//                           ),
                    
//                            SizedBox(height: 7,),
//                              Row(
//                               children: [
//                                 Text(currItem["title"],
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 16,
//                                  // fontWeight: FontWeight.bold
//                                 ),),
                
                                
//                               ],
//                              ),    
                            
//                         ],
//                       ),
                      
//                     );
//                 })),
//               ),
//             ),

//               Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 15),
//                       child: Container(
//                         decoration: BoxDecoration(
//                           border: Border.all(color: Colors.black26),
//                           color: const Color.fromARGB(255, 99, 95, 95),
//                           borderRadius: BorderRadius.circular(20)
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 5),
//                           child: TextField(
                            
//                             cursorColor: Color.fromARGB(255, 213, 129, 3),
//                             controller: lngController,
                            
//                             decoration: InputDecoration(
                              
//                               border: InputBorder.none,
//                               fillColor: Colors.white,
//                               labelText: 'From',
//                               labelStyle: TextStyle(
//                                 color: Colors.white60,
//                                 fontSize: 22,
//                               ),
//                               prefixIcon: Icon(Icons.location_on,
//                               color: Colors.white,
//                               )
                              
                              
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//             SizedBox(height: 20,),

//             Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 15),
//                       child: Container(
//                         decoration: BoxDecoration(
//                           border: Border.all(color: Colors.black26),
//                           color: const Color.fromARGB(255, 99, 95, 95),
//                           borderRadius: BorderRadius.circular(20)
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 5),
//                           child: TextField(
                            
//                             cursorColor: Color.fromARGB(255, 213, 129, 3),
//                             controller: lngController,
                            
//                             decoration: InputDecoration(
                              
//                               border: InputBorder.none,
//                               fillColor: Colors.white,
//                               labelText: 'To',
//                               labelStyle: TextStyle(
//                                 fontSize: 22,
//                                 color: Colors.white60
//                               ),
//                               prefixIcon: Icon(Icons.search,
//                               color: Colors.white,
//                               )
                              
                              
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),

//                     SizedBox(height: 20,),

//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 17),
//                       child: Container(
//                         decoration: BoxDecoration(
//                           border: Border.all(color: Colors.black26),
//                           color: const Color.fromARGB(255, 99, 95, 95),
//                           borderRadius: BorderRadius.circular(20)
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 5),
//                           child: TextField(
                            
//                             cursorColor: Color.fromARGB(255, 213, 129, 3),
//                             controller: lngController,
                            
//                             decoration: InputDecoration(
                              
//                               border: InputBorder.none,
//                               fillColor: Colors.white,
//                               labelText: 'Offer your fare',
//                               labelStyle: TextStyle(
//                                 color: Colors.white60,
//                                 fontSize: 22,
//                               ),
//                               prefixIcon: Image.asset('assets/icons/ic_pkr.png',
//                               width: 40,
//                               color: Colors.white,
//                               ),

//                               suffixIcon: Icon(Icons.money,
//                               color: Colors.green,
//                               )
                              
                              
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),

//                     SizedBox(height: 15,),

//                     // Column(
//                     //   children: [
//                     //     Row(
//                     //       children: [
//                     //         Padding(
//                     //       padding: const EdgeInsets.symmetric(horizontal: 5),
//                     //       child: Container(
//                     //                 width: double.infinity,
//                     //                 child: ElevatedButton(
//                     //                   style: ElevatedButton.styleFrom(
//                     //                     backgroundColor:Color.fromARGB(255, 213, 129, 3),
                                          
//                     //                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
//                     //                   ),
//                     //                     onPressed: () {
                                         
//                     //                     },
//                     //                     child: Padding(
//                     //                     padding: const EdgeInsets.symmetric(
//                     //                         horizontal: 0, vertical: 0),
//                     //                     child: Text(
//                     //                       "Find a driver",
//                     //                       style: TextStyle(
//                     //                         fontSize: 4,
//                     //                         color: Colors.white,
//                     //                         fontWeight: FontWeight.bold
//                     //                       ),
//                     //                     ),
//                     //                   ),
//                     //                     ),
//                     //               ),
//                     //     ),

//                     //     Padding(
//                     //       padding: const EdgeInsets.symmetric(horizontal: 5),
//                     //       child: Container(
//                     //                 width: double.infinity,
//                     //                 child: ElevatedButton(
//                     //                   style: ElevatedButton.styleFrom(
//                     //                     backgroundColor:Color.fromARGB(255, 213, 129, 3),
                                          
//                     //                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
//                     //                   ),
//                     //                     onPressed: () {
                                         
//                     //                     },
//                     //                     child: Padding(
//                     //                     padding: const EdgeInsets.symmetric(
//                     //                         horizontal: 0, vertical: 0),
//                     //                     child: Text(
//                     //                       "Find a driver",
//                     //                       style: TextStyle(
//                     //                         fontSize: 4,
//                     //                         color: Colors.white,
//                     //                         fontWeight: FontWeight.bold
//                     //                       ),
//                     //                     ),
//                     //                   ),
//                     //                     ),
//                     //               ),
//                     //     ),
//                     //       ],
//                     //     )
//                     //   ],
//                     // ),
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(22, 0, 0, 0),
//                       child: Row(
//                         children: [
//                           ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor:Color.fromARGB(255, 213, 129, 3),
//                               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
//                             ),
//                             onPressed: (){},

//                              child: Padding(
//                                padding: const EdgeInsets.symmetric(horizontal: 80,vertical: 18),
//                                child: Text('Find a driver',
//                                style: TextStyle(
//                                 fontSize: 22
//                                ),
//                                ),
//                              )
//                              ),

//                           SizedBox(width: 20,),


//                           ElevatedButton(
//                            style: ElevatedButton.styleFrom(
//                               backgroundColor:Color.fromARGB(255, 213, 129, 3),
//                               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
//                             ),

//                             onPressed: (){}, 
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
//                               child: Icon(Icons.route,
//                               size: 25,
//                               ),
//                             )
//                             ),
//                         ],
//                       ),
//                     ),

//                     SizedBox(height: 25,)
                    
//           ],
//         );
//       }
      
//       );
//           }),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:uber_ride/domain/app_constants.dart';
import 'navigation_screen.dart';

class DashBoardScreen extends StatefulWidget {
  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  bool isSelected = false;
  
  
  TextEditingController latController = TextEditingController();
  TextEditingController lngController = TextEditingController();
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
  TextEditingController fareController = TextEditingController();


  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 229, 121, 85),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset('assets/icons/ic_location.png'),
          Text(
            'Uber Ride',
            style: TextStyle(fontSize: 40, color: Colors.white),
          ),
          SizedBox(height: 30),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 5),
          //   child: Container(
          //     decoration: BoxDecoration(
          //         border: Border.all(color: Colors.black26),
          //         color: Colors.white,
          //         borderRadius: BorderRadius.circular(20)),
          //     child: Padding(
          //       padding: const EdgeInsets.symmetric(horizontal: 24),
          //       child: TextField(
          //         cursorColor: Color.fromARGB(255, 213, 129, 3),
          //         //*************** */
          //         decoration: InputDecoration(
          //           border: InputBorder.none,
          //           fillColor: Colors.white,
          //           labelText: 'Latitude',
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          //SizedBox(height: 20),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 5),
          //   child: Container(
          //     decoration: BoxDecoration(
          //         border: Border.all(color: Colors.black26),
          //         color: Colors.white,
          //         borderRadius: BorderRadius.circular(20)),
          //     child: Padding(
          //       padding: const EdgeInsets.symmetric(horizontal: 24),
          //       child: TextField(
          //         cursorColor: Color.fromARGB(255, 213, 129, 3),
          //         //************ */
          //         decoration: InputDecoration(
          //           border: InputBorder.none,
          //           fillColor: Colors.white,
          //           labelText: 'Longitude',
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          SizedBox(height: 40),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
              onPressed: () {
                showModalBottomSheet(
            backgroundColor: Color.fromARGB(255, 40, 35, 35),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
            context: context,
            builder: (_) {
              return Column(
                children: [
                  Expanded(
                    child: Container(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: AppConstants.rideCategory.length,
                          itemBuilder: ((_, index) {
                            Map<String, dynamic> currItem =
                                AppConstants.rideCategory[index];
                            return Container(
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 78, 77, 77),
                                  borderRadius: BorderRadius.circular(30)),
                              margin: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 50),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 18.0, right: 18.0),
                                        child: ClipRRect(
                                          child: Image.asset(
                                            currItem['imgPath'],
                                            width: 100,
                                            height: 60,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 7),
                                  Row(
                                    children: [
                                      Text(
                                        currItem["title"],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          })),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26),
                          color: const Color.fromARGB(255, 99, 95, 95),
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: TextField(
                          cursorColor: Color.fromARGB(255, 213, 129, 3),
                          controller: latController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Colors.white,
                            labelText: 'From',
                            labelStyle: TextStyle(
                              color: Colors.white60,
                              fontSize: 22,
                            ),
                            prefixIcon: Icon(
                              Icons.location_on,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26),
                          color: const Color.fromARGB(255, 99, 95, 95),
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: TextField(
                          cursorColor: Color.fromARGB(255, 213, 129, 3),
                          controller: lngController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Colors.white,
                            labelText: 'To',
                            labelStyle: TextStyle(
                                fontSize: 22, color: Colors.white60),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26),
                          color: const Color.fromARGB(255, 99, 95, 95),
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: TextField(
                          cursorColor: Color.fromARGB(255, 213, 129, 3),
                          controller: fareController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Colors.white,
                            labelText: 'Offer your fare',
                            labelStyle: TextStyle(
                              color: Colors.white60,
                              fontSize: 22,
                            ),
                            prefixIcon: Image.asset(
                              'assets/icons/ic_pkr.png',
                              width: 40,
                              color: Colors.white,
                            ),
                            suffixIcon: Icon(
                              Icons.money,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(22, 0, 0, 0),
                    child: Row(
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 213, 129, 3),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => NavigationScreen(
                        latController.text, lngController.text))
                        );
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 80, vertical: 18),
                              child: Text(
                                'Find a driver',
                                style: TextStyle(fontSize: 22),
                              ),
                            )),
                        SizedBox(width: 20),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 213, 129, 3),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 18),
                              child: Icon(
                                Icons.route,
                                size: 25,
                              ),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(height: 25)
                ],
              );
            },
          );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 120, vertical: 20),
                child: Text(
                  "Book your Ride",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),

          SizedBox(height: 20,),

        // Payment Method

        Container(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
              onPressed: () {
                showModalBottomSheet(
            backgroundColor: Color.fromARGB(255, 40, 35, 35),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
            context: context,
            builder: (_) {
              return Column(
                children: [
                  SizedBox(height: 20,),
                  Text('Payment Methods',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                  ),

                  SizedBox(height: 30,),

                  Expanded(
                    child: ListView(
                      children: [
                        
                        ListTile(
                          leading: Container(
                            width: 60,
                            height: 40,
                          decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(5.0),
                            color: Colors.white
                          ),
                            child: Image.asset(
                                  'assets/icons/ic_easypaisa.png',
                                  width: 50,
                                  height: 50,
                                ),
                          ),
                              title: Text('EasyPaisa',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white
                              ),
                              ),
                              subtitle: Text('Payment by Easypaisa after the ride',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white38
                            ),
                            ),
                              trailing: GestureDetector(
                        onTap: (){
                          setState(() {
                           isSelected = !isSelected;
                           print('isSelected: $isSelected');
                          });
                        },
                        child: Container(
            width: 45.0,
            height: 45.0,
            decoration: BoxDecoration(
              color: isSelected ? Color.fromARGB(255, 213, 129, 3) : Colors.white12,
              shape: BoxShape.circle,
            ),
          ),
                       ),
                              onTap: () {
                                // Handle tap
                              },
                        ),


                         SizedBox(height: 5,),
                   Divider(
            color: Colors.white24,
            thickness: 1.0,
            indent: 16.0,
            endIndent: 16.0,
          ),
                  SizedBox(height: 5,),



                  ListTile(
                          leading: Container(
                            width: 60,
                            height: 40,
                          decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(5.0),
                            color: Colors.white
                          ),
                            child: Image.asset(
                                  'assets/icons/ic_jazzcash.png',
                                  width: 50,
                                  height: 50,
                                ),
                          ),
                              title: Text('JazzCash',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white
                              ),
                              ),
                              subtitle: Text('Payment by Jazzcash after the ride',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white38
                            ),
                            ),
                              trailing: GestureDetector(
                        onTap: (){
                          setState(() {
                           isSelected = !isSelected;
                           print('isSelected: $isSelected');
                          });
                        },
                        child: Container(
            width: 45.0,
            height: 45.0,
            decoration: BoxDecoration(
              color: isSelected ? Color.fromARGB(255, 213, 129, 3) : Colors.white12,
              shape: BoxShape.circle,
            ),
          ),
                       ),
                              onTap: () {
                                // Handle tap
                              },
                        ),



                         SizedBox(height: 5,),
                   Divider(
            color: Colors.white24,
            thickness: 1.0,
            indent: 16.0,
            endIndent: 16.0,
          ),
                  SizedBox(height: 5,),



                  ListTile(
                          leading: Container(
                            width: 60,
                            height: 40,
                          decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(5.0),
                            color: Colors.white
                          ),
                            child: Image.asset(
                                  'assets/icons/ic_rupees.png',
                                  width: 50,
                                  height: 50,
                                ),
                          ),
                              title: Text('Cash',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white
                              ),
                              ),
                              
                              trailing: GestureDetector(
                        onTap: (){
                          setState(() {
                           isSelected = !isSelected;
                           print('isSelected: $isSelected');
                          });
                        },
                        child: Container(
            width: 45.0,
            height: 45.0,
            decoration: BoxDecoration(
              color: isSelected ? Color.fromARGB(255, 213, 129, 3) : Colors.white12,
              shape: BoxShape.circle,
            ),
          ),
                       ),
                              onTap: () {
                                // Handle tap
                              },
                        ),
                      ],
                    ),
                  ),

                  
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(22, 0, 0, 0),
                    child: Row(
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 213, 129, 3),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => NavigationScreen(
                        latController.text, lngController.text))
                        );
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 160, vertical: 18),
                              child: Text(
                                'Done',
                                style: TextStyle(fontSize: 22),
                              ),
                            )),
                        
                        
                      ],
                    ),
                  ),
                  SizedBox(height: 105)
                ],
              );
            },
          );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 70, vertical: 20),
                child: Text(
                  "Select your Payment Method",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ]),
      ),
      

      

      

    
    );
  }
}
