import 'package:anime_palyer/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentPlan extends StatefulWidget {
  const PaymentPlan({super.key});

  @override
  State<PaymentPlan> createState() => _PaymentPlanState();
}

class _PaymentPlanState extends State<PaymentPlan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: MyColor.background),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              MyColor.background,
              MyColor.background,
              MyColor.white,
              MyColor.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 70.0),
                  child: Text(
                    'Upgrade Plan',
                    style: GoogleFonts.raleway(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 40),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: MyColor.white100,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: IconButton(
                    color: MyColor.white100,
                    onPressed: () {},
                    icon: Icon(Icons.close, color: MyColor.darkBlue, size: 25),
                  ),
                ),
              ],
            ),
            Image.asset('assets/RoketBoy.png', width: 210, height: 210),
            Text(
              'Seamless Anime \nExperience, Ad-Free.',
              style: GoogleFonts.raleway(
                color: MyColor.darkBlue,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              'Enjoy unlimited anime streaming without \ninterruptions.',
              style: GoogleFonts.raleway(
                color: MyColor.whiteGray100,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 100),
            Container(
              width: 342,
              height: 102,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: MyColor.darkBlue,
              ),
              child: ListTile(
                leading: SizedBox(
                  width: 108,
                  height: 108,
                  child: Image.asset(
                    'assets/subscribtion.png',
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  'Monthly',
                  style: GoogleFonts.raleway(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                subtitle: RichText(
                  text: TextSpan(
                    style: GoogleFonts.raleway(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: MyColor.darkBlue,
                    ),
                    children: [
                      TextSpan(
                        text: '5 USD ',
                        style: GoogleFonts.raleway(color: MyColor.white),
                      ),
                      TextSpan(
                        text: '/Month\nInclude Family Sharing',
                        style: GoogleFonts.raleway(color: MyColor.whiteGray),
                      ),
                    ],
                  ),
                ),
                trailing: Icon(Icons.check_circle, color: MyColor.purpleMain),
              ),
            ),
            SizedBox(height: 15),
            Container(
              width: 342,
              height: 102,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: MyColor.white,
              ),
              child: ListTile(
                leading: SizedBox(
                  width: 108,
                  height: 108,
                  child: Image.asset(
                    'assets/subscribtion.png',
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  'Monthly',
                  style: GoogleFonts.raleway(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: MyColor.darkBlue,
                  ),
                ),
                subtitle: RichText(
                  text: TextSpan(
                    style: GoogleFonts.raleway(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: MyColor.darkBlue,
                    ),
                    children: [
                      TextSpan(
                        text: '50 USD ',
                        style: GoogleFonts.raleway(color: MyColor.darkBlue),
                      ),
                      TextSpan(
                        text: '/Month\nInclude Family Sharing',
                        style: GoogleFonts.raleway(color: MyColor.whiteGray),
                      ),
                    ],
                  ),
                ),
                trailing: Icon(Icons.circle_outlined, color: MyColor.purpleMain),
              ),
            ),
            Container(
              width: 342,
              height: 45,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: MyColor.purpleMain,
              ),
              child: Text(
                'Continue',
                style: GoogleFonts.raleway(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
