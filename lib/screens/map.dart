import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'dart:math' as math;
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:uber_ride/domain/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:uber_ride/screens/dashboard_screen.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Completer<GoogleMapController> _controller = Completer();
  final Location _locationController = Location();
  Set<Marker> _markers = {};
  LatLng _initialCameraPosition = LatLng(37.4221, -122.0841);
  LatLng? _pickUpLocation;
  LatLng? _dropOffLocation;

  @override
  void initState() {
    super.initState();
    _setInitialLocation();
  }

  Future<void> _setInitialLocation() async {
    var locationData = await _locationController.getLocation();
    _controller.future.then((controller) {
      controller.moveCamera(CameraUpdate.newLatLng(
          LatLng(locationData.latitude!, locationData.longitude!)));
    });
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('currentLocation'),
          position: LatLng(locationData.latitude!, locationData.longitude!),
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void _onTap(LatLng position) {
    setState(() {
      if (_pickUpLocation == null) {
        _pickUpLocation = position;
        addCarMarkers(position); // Add car markers around the pickup location
        _markers.add(
          Marker(
            markerId: MarkerId("pickup"),
            position: position,
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueGreen),
            infoWindow: InfoWindow(title: 'Pick Up Location'),
          ),
        );
      } else if (_dropOffLocation == null) {
        _dropOffLocation = position;
        _markers.add(
          Marker(
            markerId: MarkerId("dropoff"),
            position: position,
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
            infoWindow: InfoWindow(title: 'Drop Off Location'),
          ),
        );
      }
    });
  }

  Future<void> addCarMarkers(LatLng pickupLocation) async {
    final ByteData byteData = await rootBundle.load('assets/icons/ic_car.png');
    final Uint8List bytes = byteData.buffer.asUint8List();

    final random = math.Random();
    List<Marker> carMarkers = List.generate(5, (index) {
      double lat = pickupLocation.latitude +
          (random.nextDouble() * 0.01) * (random.nextBool() ? 1 : -1);
      double lng = pickupLocation.longitude +
          (random.nextDouble() * 0.01) * (random.nextBool() ? 1 : -1);
      return Marker(
        markerId: MarkerId('car$index'),
        position: LatLng(lat, lng),
        icon: BitmapDescriptor.fromBytes(bytes),
        infoWindow: InfoWindow(title: 'Car $index'),
      );
    });

    setState(() {
      _markers.addAll(carMarkers);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
        backgroundColor: Color.fromARGB(255, 229, 121, 85),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _initialCameraPosition,
          zoom: 11.0,
        ),
        markers: _markers,
        onTap: _onTap,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 213, 129, 3),
        onPressed: () => _showConfirmationDialog(),
        tooltip: 'Confirm Locations',
        child: Icon(Icons.check),
      ),
    );
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Locations'),
          content: Text(
              'Pick-Up: ${_pickUpLocation.toString()}\nDrop-Off: ${_dropOffLocation.toString()}'),
          actions: <Widget>[
            ElevatedButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text('Confirm'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PaymentMethodScreen()),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
