import 'package:doro/constant/colorbg.dart';
import 'package:flutter/material.dart';

class FailurePage extends StatelessWidget {
  const FailurePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColorBG(
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Color-Filtered Background Image
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              Color.fromARGB(160, 212, 116, 116),
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
                  " لم يتم تأكيد الهوية! حاول مرة اخرى .",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Identification Failed ! \n Please Try Again.",
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
