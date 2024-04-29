import 'package:doro/constant/colorbg.dart';
import 'package:flutter/material.dart';

class Successpage extends StatelessWidget {
  const Successpage({super.key});

  @override
  Widget build(BuildContext context) {
    return ColorBG(
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              Color.fromARGB(159, 145, 212, 116),
              BlendMode.colorBurn,
            ),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/success.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Content (Text)
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.4),
                Text(
                  "تم تأكيد الهوية! البوابة مفتوحة الآن.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Identification Confirmed!\n The Gate is Now Open.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
