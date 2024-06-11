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
import 'package:uber_ride/screens/map.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uber_ride/domain/app_constants.dart';
import 'package:uber_ride/screens/map.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter/material.dart';

class DashboardController extends GetxController {
  var isSelected = false.obs;

  TextEditingController latController = TextEditingController();
  TextEditingController lngController = TextEditingController();
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
  TextEditingController fareController = TextEditingController();

  void toggleSelection() {
    isSelected.value = !isSelected.value;
  }
}

class DashBoardScreen extends StatelessWidget {
  final DashboardController controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final buttonHeight = mediaQuery.size.height * 0.06;
    final buttonPaddingHorizontal = mediaQuery.size.width * 0.1;
    final buttonFontSize = mediaQuery.size.height * 0.022;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 229, 121, 85),
      body: Padding(
        padding: EdgeInsets.all(mediaQuery.size.width * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/ic_location.png',
              width: mediaQuery.size.width * 0.3,
              height: mediaQuery.size.height * 0.1,
            ),
            const Text(
              'Uber Ride',
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
            SizedBox(height: mediaQuery.size.height * 0.05),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  showModalBottomSheet(
                    backgroundColor: const Color.fromARGB(255, 40, 35, 35),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10),
                      ),
                    ),
                    context: context,
                    builder: (_) {
                      return SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.all(mediaQuery.size.width * 0.05),
                          child: Column(
                            children: [
                              SizedBox(height: mediaQuery.size.height * 0.05),
                              SizedBox(
                                height: mediaQuery.size.height * 0.25,
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
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      margin: EdgeInsets.symmetric(
                                        horizontal:
                                            mediaQuery.size.width * 0.02,
                                      ),
                                      padding: EdgeInsets.all(
                                        mediaQuery.size.width * 0.02,
                                      ),
                                      child: Column(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.asset(
                                              currItem['imgPath'],
                                              width:
                                                  mediaQuery.size.width * 0.25,
                                              height:
                                                  mediaQuery.size.height * 0.15,
                                            ),
                                          ),
                                          Text(
                                            currItem["title"],
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize:
                                                  mediaQuery.size.height * 0.02,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                                ),
                              ),
                              SizedBox(height: mediaQuery.size.height * 0.02),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => MapPage(),
                                    ),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black26),
                                    color:
                                        const Color.fromARGB(255, 99, 95, 95),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: mediaQuery.size.width * 0.05,
                                  ),
                                  child: AbsorbPointer(
                                    child: TextField(
                                      cursorColor: const Color.fromARGB(
                                          255, 213, 129, 3),
                                      controller: controller.latController,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        fillColor: Colors.white,
                                        labelText: 'From',
                                        labelStyle: TextStyle(
                                          color: Colors.white60,
                                          fontSize:
                                              mediaQuery.size.height * 0.02,
                                        ),
                                        prefixIcon: Icon(
                                          Icons.location_on,
                                          color: Colors.white,
                                          size: mediaQuery.size.height * 0.03,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: mediaQuery.size.height * 0.02),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black26),
                                  color: const Color.fromARGB(255, 99, 95, 95),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: mediaQuery.size.width * 0.05,
                                ),
                                child: TextField(
                                  cursorColor:
                                      const Color.fromARGB(255, 213, 129, 3),
                                  controller: controller.fareController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    fillColor: Colors.white,
                                    labelText: 'Offer your fare',
                                    labelStyle: TextStyle(
                                      color: Colors.white60,
                                      fontSize: mediaQuery.size.height * 0.02,
                                    ),
                                    prefixIcon: Image.asset(
                                      'assets/icons/ic_pkr.png',
                                      width: mediaQuery.size.width * 0.1,
                                      color: Colors.white,
                                    ),
                                    suffixIcon: Icon(
                                      Icons.money,
                                      color: Colors.green,
                                      size: mediaQuery.size.height * 0.03,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: mediaQuery.size.height * 0.02),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          255, 213, 129, 3),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    onPressed: () {
                                      // Your navigation logic here
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: mediaQuery.size.width * 0.1,
                                        vertical: buttonHeight / 3,
                                      ),
                                      child: Text(
                                        'Find a driver',
                                        style:
                                            TextStyle(fontSize: buttonFontSize),
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          255, 213, 129, 3),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal:
                                            mediaQuery.size.width * 0.05,
                                        vertical: buttonHeight / 3,
                                      ),
                                      child: Icon(
                                        Icons.route,
                                        size: buttonHeight / 2,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: mediaQuery.size.height * 0.03),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: buttonPaddingHorizontal,
                    vertical: buttonHeight / 3,
                  ),
                  child: Text(
                    "Book your Ride",
                    style: TextStyle(
                      fontSize: buttonFontSize,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: mediaQuery.size.height * 0.02),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  showModalBottomSheet(
                    backgroundColor: const Color.fromARGB(255, 40, 35, 35),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10),
                      ),
                    ),
                    context: context,
                    builder: (_) {
                      return SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.all(mediaQuery.size.width * 0.05),
                          child: Column(
                            children: [
                              SizedBox(height: mediaQuery.size.height * 0.02),
                              const Text(
                                'Payment Methods',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: mediaQuery.size.height * 0.03),
                              Expanded(
                                child: ListView(
                                  shrinkWrap: true,
                                  children: [
                                    ListTile(
                                      leading: Container(
                                        width: mediaQuery.size.width * 0.15,
                                        height: mediaQuery.size.height * 0.05,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          color: Colors.white,
                                        ),
                                        child: Image.asset(
                                          'assets/icons/ic_easypaisa.png',
                                          width: mediaQuery.size.width * 0.12,
                                          height: mediaQuery.size.height * 0.05,
                                        ),
                                      ),
                                      title: Text(
                                        'EasyPaisa',
                                        style: TextStyle(
                                          fontSize:
                                              mediaQuery.size.height * 0.02,
                                          color: Colors.white,
                                        ),
                                      ),
                                      subtitle: Text(
                                        'Payment by Easypaisa after the ride',
                                        style: TextStyle(
                                          fontSize:
                                              mediaQuery.size.height * 0.018,
                                          color: Colors.white38,
                                        ),
                                      ),
                                      trailing: GestureDetector(
                                        onTap: controller.toggleSelection,
                                        child: Obx(
                                          () => Container(
                                            width: mediaQuery.size.width * 0.1,
                                            height: mediaQuery.size.width * 0.1,
                                            decoration: BoxDecoration(
                                              color: controller.isSelected.value
                                                  ? const Color.fromARGB(
                                                      255, 213, 129, 3)
                                                  : Colors.white12,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        // Handle tap
                                      },
                                    ),
                                    SizedBox(
                                        height: mediaQuery.size.height * 0.005),
                                    const Divider(
                                      color: Colors.white24,
                                      thickness: 1.0,
                                      indent: 16.0,
                                      endIndent: 16.0,
                                    ),
                                    SizedBox(
                                        height: mediaQuery.size.height * 0.005),
                                    ListTile(
                                      leading: Container(
                                        width: mediaQuery.size.width * 0.15,
                                        height: mediaQuery.size.height * 0.05,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          color: Colors.white,
                                        ),
                                        child: Image.asset(
                                          'assets/icons/ic_jazzcash.png',
                                          width: mediaQuery.size.width * 0.12,
                                          height: mediaQuery.size.height * 0.05,
                                        ),
                                      ),
                                      title: Text(
                                        'JazzCash',
                                        style: TextStyle(
                                          fontSize:
                                              mediaQuery.size.height * 0.02,
                                          color: Colors.white,
                                        ),
                                      ),
                                      subtitle: Text(
                                        'Payment by Jazzcash after the ride',
                                        style: TextStyle(
                                          fontSize:
                                              mediaQuery.size.height * 0.018,
                                          color: Colors.white38,
                                        ),
                                      ),
                                      trailing: GestureDetector(
                                        onTap: controller.toggleSelection,
                                        child: Obx(
                                          () => Container(
                                            width: mediaQuery.size.width * 0.1,
                                            height: mediaQuery.size.width * 0.1,
                                            decoration: BoxDecoration(
                                              color: controller.isSelected.value
                                                  ? const Color.fromARGB(
                                                      255, 213, 129, 3)
                                                  : Colors.white12,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        // Handle tap
                                      },
                                    ),
                                    SizedBox(
                                        height: mediaQuery.size.height * 0.005),
                                    const Divider(
                                      color: Colors.white24,
                                      thickness: 1.0,
                                      indent: 16.0,
                                      endIndent: 16.0,
                                    ),
                                    SizedBox(
                                        height: mediaQuery.size.height * 0.005),
                                    ListTile(
                                      leading: Container(
                                        width: mediaQuery.size.width * 0.15,
                                        height: mediaQuery.size.height * 0.05,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          color: Colors.white,
                                        ),
                                        child: Image.asset(
                                          'assets/icons/ic_rupees.png',
                                          width: mediaQuery.size.width * 0.12,
                                          height: mediaQuery.size.height * 0.05,
                                        ),
                                      ),
                                      title: Text(
                                        'Cash',
                                        style: TextStyle(
                                          fontSize:
                                              mediaQuery.size.height * 0.02,
                                          color: Colors.white,
                                        ),
                                      ),
                                      trailing: GestureDetector(
                                        onTap: controller.toggleSelection,
                                        child: Obx(
                                          () => Container(
                                            width: mediaQuery.size.width * 0.1,
                                            height: mediaQuery.size.width * 0.1,
                                            decoration: BoxDecoration(
                                              color: controller.isSelected.value
                                                  ? const Color.fromARGB(
                                                      255, 213, 129, 3)
                                                  : Colors.white12,
                                              shape: BoxShape.circle,
                                            ),
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
                                padding: EdgeInsets.fromLTRB(
                                    mediaQuery.size.width * 0.05, 0, 0, 0),
                                child: Row(
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromARGB(
                                            255, 213, 129, 3),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      onPressed: () {
                                        // Your navigation logic here
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: buttonPaddingHorizontal,
                                          vertical: buttonHeight / 3,
                                        ),
                                        child: Text(
                                          'Done',
                                          style: TextStyle(
                                              fontSize: buttonFontSize),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: mediaQuery.size.height * 0.15),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: buttonPaddingHorizontal,
                    vertical: buttonHeight / 3,
                  ),
                  child: Text(
                    "Select your Payment Method",
                    style: TextStyle(
                      fontSize: buttonFontSize,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, dynamic>? paymentIntent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 229, 121, 85),
        title: const Text('Stripe Payment'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 40, 35, 35),
                onPrimary: Colors.white,
                textStyle: const TextStyle(fontSize: 20),
              ),
              child: const Text('Confirm Now'),
              onPressed: () async {
                await makePayment();
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> makePayment() async {
    try {
      paymentIntent = await createPaymentIntent('10000', 'USD');

      var gpay = const PaymentSheetGooglePay(
          merchantCountryCode: "US", currencyCode: "USD", testEnv: true);

      //STEP 2: Initialize Payment Sheet
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret: paymentIntent![
                      'client_secret'], //Gotten from payment intent
                  style: ThemeMode.light,
                  merchantDisplayName: 'Ammad',
                  googlePay: gpay))
          .then((value) {});

      //STEP 3: Display Payment sheet
      displayPaymentSheet();
    } catch (err) {
      print(err);
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        print("Payment Successfully");
      });
    } catch (e) {
      print('$e');
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': amount,
        'currency': currency,
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization':
              'Bearer sk_test_51PMAmX06N6gtIqVLfpzHWB8uHUdTuN8gxxVrfBwOhKimZmVcd39Yh4T26HQFsNOImQp9kyV8ghpQOXROHSufdsK900tikEjkr1',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      return json.decode(response.body);
    } catch (err) {
      throw Exception(err.toString());
    }
  }
}

class PaymentMethodScreen extends StatefulWidget {
  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose Payment Method"),
        backgroundColor: const Color.fromARGB(255, 229, 121, 85),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 40, 35, 35),
                onPrimary: Colors.white,
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Cash Payment Selected"),
                    content: const Text("You have chosen to pay with cash."),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text("OK"),
                      ),
                    ],
                  ),
                );
              },
              child: const Text("Pay with Cash"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 213, 129, 3),
                onPrimary: Colors.white,
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              child: const Text("Pay with Card"),
            ),
          ],
        ),
      ),
    );
  }
}
