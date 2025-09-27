import 'package:anime_palyer/core/colors.dart';
import 'package:anime_palyer/presentation/widgets/navigation_bar.dart';
import 'package:anime_palyer/presentation/widgets/posters.dart';
import 'package:anime_palyer/presentation/widgets/taps.dart';
import 'package:anime_palyer/presentation/widgets/top_characters.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(
          'Where Anime Comes Alive',
          style: GoogleFonts.raleway(
            color: MyColor.darkBlue,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: MyColor.background,
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 23.5, right: 23.5),
        width: double.infinity,
        height: double.infinity,
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TapsBar(),
              SizedBox(height: 20),
              Posters(),
              SizedBox(height: 24),
              Text(
                'Top Characters',
                style: GoogleFonts.raleway(
                  color: MyColor.darkBlue,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 24),
              TopCharacters(),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
      bottomNavigationBar: FancyBottomNav(),
    );
  }
}
