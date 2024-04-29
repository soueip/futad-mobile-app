import 'package:doro/pages/failecard.dart';
import 'package:doro/pages/successpage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

Future<void> fetchResponse() async {
  final response = await http.get(
    Uri.parse('https://futad-be.onrender.com/futad/getresp'),
  );

  print("Response from server: ${response.body}");

  // Handle the response
  if (response.body == "true") {
    // If response is true, navigate to SuccessPage
    Get.to(const Successpage());
  } else if (response.body == "false") {
    // If response is false, navigate to FailurePage
    Get.to(const FailurePage());
  } else {
    await Future.delayed(const Duration(seconds: 1));
    fetchResponse(); // Retry fetching the response
  }
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    fetchResponse(); // Call the fetchResponse function here
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
