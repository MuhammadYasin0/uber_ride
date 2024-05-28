

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:location/location.dart';
import 'package:uber_ride/domain/app_constants.dart';
import 'navigation_screen.dart';
import 'package:http/http.dart' as http;

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
      backgroundColor: const Color.fromARGB(255, 229, 121, 85),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset('assets/icons/ic_location.png'),
          const Text(
            'Uber Ride',
            style: TextStyle(fontSize: 40, color: Colors.white),
          ),
          const SizedBox(height: 30),
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
          const SizedBox(height: 40),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
              onPressed: () {
                showModalBottomSheet(
                  backgroundColor: const Color.fromARGB(255, 40, 35, 35),
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(10))),
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
                                        color: const Color.fromARGB(
                                            255, 78, 77, 77),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    margin: const EdgeInsets.symmetric(
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
                                        const SizedBox(height: 7),
                                        Row(
                                          children: [
                                            Text(
                                              currItem["title"],
                                              style: const TextStyle(
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
                              child: // 'From' TextField
                                  Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) =>
                                      MapPage()
                                      //    LocationInputScreen(),
                                    ));
                                  },
                                  child: AbsorbPointer(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black26),
                                          color: const Color.fromARGB(
                                              255, 99, 95, 95),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: TextField(
                                          cursorColor: const Color.fromARGB(
                                              255, 213, 129, 3),
                                          controller: latController,
                                          decoration: const InputDecoration(
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
                                ),
                              ),
                            )),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 17),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black26),
                                color: const Color.fromARGB(255, 99, 95, 95),
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: TextField(
                                cursorColor:
                                    const Color.fromARGB(255, 213, 129, 3),
                                controller: fareController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  fillColor: Colors.white,
                                  labelText: 'Offer your fare',
                                  labelStyle: const TextStyle(
                                    color: Colors.white60,
                                    fontSize: 22,
                                  ),
                                  prefixIcon: Image.asset(
                                    'assets/icons/ic_pkr.png',
                                    width: 40,
                                    color: Colors.white,
                                  ),
                                  suffixIcon: const Icon(
                                    Icons.money,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(22, 0, 0, 0),
                          child: Row(
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          255, 213, 129, 3),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  onPressed: () {
                                    // Navigator.of(context).push(
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             // NavigationScreen(
                                    //             //     latController.text,
                                    //             //     lngController.text
                                                    
                                    //             //     )
                                                    
                                    //                 ));
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 80, vertical: 18),
                                    child: Text(
                                      'Find a driver',
                                      style: TextStyle(fontSize: 22),
                                    ),
                                  )),
                              const SizedBox(width: 20),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          255, 213, 129, 3),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  onPressed: () {},
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 18),
                                    child: Icon(
                                      Icons.route,
                                      size: 25,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        const SizedBox(height: 25)
                      ],
                    );
                  },
                );
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 120, vertical: 20),
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

          const SizedBox(
            height: 20,
          ),

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
                  backgroundColor: const Color.fromARGB(255, 40, 35, 35),
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(10))),
                  context: context,
                  builder: (_) {
                    return Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Payment Methods',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Expanded(
                          child: ListView(
                            children: [
                              ListTile(
                                leading: Container(
                                  width: 60,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: Colors.white),
                                  child: Image.asset(
                                    'assets/icons/ic_easypaisa.png',
                                    width: 50,
                                    height: 50,
                                  ),
                                ),
                                title: const Text(
                                  'EasyPaisa',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                subtitle: const Text(
                                  'Payment by Easypaisa after the ride',
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.white38),
                                ),
                                trailing: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isSelected = !isSelected;
                                      print('isSelected: $isSelected');
                                    });
                                  },
                                  child: Container(
                                    width: 45.0,
                                    height: 45.0,
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? const Color.fromARGB(
                                              255, 213, 129, 3)
                                          : Colors.white12,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  // Handle tap
                                },
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Divider(
                                color: Colors.white24,
                                thickness: 1.0,
                                indent: 16.0,
                                endIndent: 16.0,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              ListTile(
                                leading: Container(
                                  width: 60,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: Colors.white),
                                  child: Image.asset(
                                    'assets/icons/ic_jazzcash.png',
                                    width: 50,
                                    height: 50,
                                  ),
                                ),
                                title: const Text(
                                  'JazzCash',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                subtitle: const Text(
                                  'Payment by Jazzcash after the ride',
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.white38),
                                ),
                                trailing: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isSelected = !isSelected;
                                      print('isSelected: $isSelected');
                                    });
                                  },
                                  child: Container(
                                    width: 45.0,
                                    height: 45.0,
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? const Color.fromARGB(
                                              255, 213, 129, 3)
                                          : Colors.white12,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  // Handle tap
                                },
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Divider(
                                color: Colors.white24,
                                thickness: 1.0,
                                indent: 16.0,
                                endIndent: 16.0,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              ListTile(
                                leading: Container(
                                  width: 60,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: Colors.white),
                                  child: Image.asset(
                                    'assets/icons/ic_rupees.png',
                                    width: 50,
                                    height: 50,
                                  ),
                                ),
                                title: const Text(
                                  'Cash',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                trailing: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isSelected = !isSelected;
                                      print('isSelected: $isSelected');
                                    });
                                  },
                                  child: Container(
                                    width: 45.0,
                                    height: 45.0,
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? const Color.fromARGB(
                                              255, 213, 129, 3)
                                          : Colors.white12,
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
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(22, 0, 0, 0),
                          child: Row(
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          255, 213, 129, 3),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  onPressed: () {
                                    // Navigator.of(context).push(
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             NavigationScreen(
                                    //                 latController.text,
                                    //                 lngController.text
                                                    
                                    //                 )));
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 160, vertical: 18),
                                    child: Text(
                                      'Done',
                                      style: TextStyle(fontSize: 22),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        const SizedBox(height: 105)
                      ],
                    );
                  },
                );
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 70, vertical: 20),
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

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Location _locationController = Location();
  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();
  LatLng _initialCameraPosition = LatLng(37.4223, -122.0848);
  Marker? _pickUpLocation;
  Marker? _dropOffLocation;
  Map<PolylineId, Polyline> _polylines = {};
  bool _isPickupSet = false;

  @override
  void initState() {
    super.initState();
    getLocationUpdates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          _mapController.complete(controller);
        },
        initialCameraPosition: CameraPosition(
          target: _initialCameraPosition,
          zoom: 13,
        ),
        markers:
            {_pickUpLocation, _dropOffLocation}.whereType<Marker>().toSet(),
        polylines: Set<Polyline>.of(_polylines.values),
        onTap: _handleMapTap,
      ),
    );
  }

  void _handleMapTap(LatLng tappedPoint) {
    if (!_isPickupSet) {
      setState(() {
        _pickUpLocation = Marker(
          markerId: MarkerId('pickup'),
          position: tappedPoint,
          infoWindow: InfoWindow(title: 'Pick Up Location'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        );
        _isPickupSet = true;
      });
    } else if (_pickUpLocation != null && _dropOffLocation == null) {
      setState(() {
        _dropOffLocation = Marker(
          markerId: MarkerId('dropoff'),
          position: tappedPoint,
          infoWindow: InfoWindow(title: 'Drop Off Location'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        );
      });
      _getPolyline();
    }
  }

  Future<void> getLocationUpdates() async {
    var serviceEnabled = await _locationController.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _locationController.requestService();
      if (!serviceEnabled) return;
    }

    var permissionGranted = await _locationController.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _locationController.requestPermission();
      if (permissionGranted != PermissionStatus.granted) return;
    }

    _locationController.onLocationChanged
        .listen((LocationData currentLocation) {
      if (_mapController.isCompleted &&
          currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        _mapController.future.then((controller) {
          controller.animateCamera(CameraUpdate.newLatLng(
              LatLng(currentLocation.latitude!, currentLocation.longitude!)));
        });
      }
    });
  }

  Future<void> _getPolyline() async {
    if (_pickUpLocation != null && _dropOffLocation != null) {
      PolylinePoints polylinePoints = PolylinePoints();
      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        'AIzaSyDPoZ1NqYsd73JVu-jKFjQvVqc2ZSQsaPg', // Don't forget to replace with your API Key
        PointLatLng(_pickUpLocation!.position.latitude,
            _pickUpLocation!.position.longitude),
        PointLatLng(_dropOffLocation!.position.latitude,
            _dropOffLocation!.position.longitude),
        travelMode: TravelMode.driving,
      );

      if (result.points.isNotEmpty) {
        setState(() {
          _polylines[PolylineId('route')] = Polyline(
            polylineId: PolylineId('route'),
            points: result.points
                .map((point) => LatLng(point.latitude, point.longitude))
                .toList(),
            color: Colors.blue,
            width: 5,
          );
        });
      }
    }
  }
}