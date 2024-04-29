import 'dart:io';
import 'package:doro/constant/colorbg.dart';
import 'package:doro/pages/takepic.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? facepic;
  File? qrpic;

  Future<void> getfaceimage() async {
    final ImagePicker picker = ImagePicker();

    final XFile? photoCamera =
        await picker.pickImage(source: ImageSource.camera);

    if (photoCamera != null) {
      setState(() {
        facepic = File(photoCamera.path);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No image selected')),
      );
    }
  }

  Future<void> getqrimage() async {
    final ImagePicker picker = ImagePicker();

    final XFile? photoCamera =
        await picker.pickImage(source: ImageSource.camera);

    if (photoCamera != null) {
      setState(() {
        qrpic = File(photoCamera.path);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No image selected')),
      );
    }
  }

  Future upload() async {
    if (qrpic == null || facepic == null) return;

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoadingPage()),
    );

    String base64face = base64Encode(facepic!.readAsBytesSync());
    String base64qr = base64Encode(qrpic!.readAsBytesSync());

    // Define the data you want to send
    Map<String, String> data = {
      'face_image': base64face,
      'qr_image': base64qr,
    };

    // Make the HTTP POST request
    final response = await http.post(
      Uri.parse('https://futad-be.onrender.com/futad/save'),
      body: data,
    );

    print("Response from server: ${response.body}");
  }

  @override
  Widget build(BuildContext context) {
    return ColorBG(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Image.asset(
              "assets/images/logo.png",
              width: 200,
            ),
            const SizedBox(height: 30),
            Image.asset(
              "assets/images/id_scan.png",
              color: Colors.transparent,
              colorBlendMode:
                  BlendMode.colorBurn, // Blend mode to apply the color
            ),
            const SizedBox(height: 30),
            const Text(
              "مرحبًا! اختر طريقة الدخول المفضلة لديك",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const Text(
              "Welcome to ATLANSTIS! Choose Your Preferred Entry Method",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (facepic == null)
                  InkWell(
                    onTap: () {
                      getfaceimage();
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xFF004F60),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Image.asset(
                        "assets/images/face.png",
                      ),
                    ),
                  ),
                const SizedBox(
                  width: 50,
                ),
                if (qrpic == null)
                  InkWell(
                    onTap: () {
                      getqrimage();
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xFF004F60),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Image.asset(
                        "assets/images/qrcode.png",
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (facepic != null)
                  Image.file(
                    facepic!,
                    width: 150,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                if (qrpic != null)
                  Image.file(
                    qrpic!,
                    width: 150,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            if (facepic != null && qrpic != null)
              ElevatedButton(
                onPressed: () async {
                  upload();
                },
                child: const Text("Look For Customer"),
              ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
