import 'package:flutter/material.dart';
import 'package:uber_ride/screens/dashboard_screen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
      'pk_test_51PMAmX06N6gtIqVLfNZo3215HEqBv3OGnw9kfXTNLIvROjVdUCHmuoqUDgTJ0rupsZ2UZUpzLpxhs7GwAxD4DJWl00PnbES5Vc'; // Use your test publishable key

  // Hypothetical function if initialization is required

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: DashBoardScreen());
  }
}
