import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('About Us',
          style: GoogleFonts.crimsonText(
              color: Color(0xFF162a40),
              fontWeight: FontWeight.bold,
              fontSize: 20
          ),
        ),
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF162a40)),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(height: 50,),
            Text("With the advancement of technology and its applications technology has become a necessity of  life, the concept of electronic payment and its urgency began to emerge after the advent of ecommerce.Many types of people encounter problems during their financial transactions. Some of these problems compete with people during payment, after the distance from the university to be paid, so we found a way to facilitate the payment process and reduce the obstacles that may occur during payment . As a result, the online payment application ensures confidentiality and privacy in the transfer process and facilitates online financial procedures.",
              style: GoogleFonts.crimsonText(
                  color: Color(0xFF162a40),
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              ),
            )
          ],
        ),
      ),
    );
  }
}
