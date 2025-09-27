import 'package:anime_palyer/core/colors.dart';
import 'package:anime_palyer/data/models/anime_model.dart';
import 'package:anime_palyer/presentation/widgets/plan_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class AnimeInfo2 extends StatelessWidget {
  final Anime anime;

  const AnimeInfo2({super.key, required this.anime});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.darkPurple,
      body: CustomScrollView(
        slivers: [
          // Content below the app bar
          SliverList(
            delegate: SliverChildListDelegate([
              Stack(
                children: [
                  Image.network(
                    anime.imageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    left: 115,
                    top: 430,
                    child: Container(
                      width: 160,
                      height: 141,
                      decoration: BoxDecoration(
                        color: MyColor.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: AutoSizeText(
                          anime.title,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.newRocker(
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                          ),
                          maxLines: 3,
                          minFontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Title bubble
              const SizedBox(height: 20),
              // Genres
              Center(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (final genre in anime.genres)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white30,
                          borderRadius: BorderRadius.circular(17),
                        ),
                        child: Text(
                          genre,
                          style: GoogleFonts.raleway(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              Divider(
                thickness: 1,
                color: MyColor.divideColor,
                indent: 20,
                endIndent: 20,
              ),

              // Stats row
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.remove_red_eye,
                          color: Colors.white38,
                          size: 17,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '2.3M views',
                          style: GoogleFonts.inter(
                            color: MyColor.white,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.person, color: Colors.white38, size: 17),
                        const SizedBox(width: 5),
                        Text(
                          '2K clap',
                          style: GoogleFonts.inter(
                            color: MyColor.white,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.token_rounded,
                          color: Colors.white38,
                          size: 17,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '${anime.episodes} Episodes',
                          style: GoogleFonts.inter(
                            color: MyColor.white,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Divider(
                thickness: 1,
                color: MyColor.divideColor,
                indent: 20,
                endIndent: 20,
              ),

              // Synopsis
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  anime.synopsis,
                  style: GoogleFonts.raleway(
                    color: Colors.white,
                    fontSize: 14,
                    height: 1.4,
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
      bottomNavigationBar: PlanBottomNav(),
    );
  }
}
