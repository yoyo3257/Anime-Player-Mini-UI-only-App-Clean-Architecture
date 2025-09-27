import 'package:anime_palyer/core/colors.dart';
import 'package:anime_palyer/data/network/api_handler.dart';
import 'package:anime_palyer/data/models/anime_model.dart';
import 'package:anime_palyer/presntation/screens/anime_info.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Posters extends StatefulWidget {
  const Posters({super.key});

  @override
  State<Posters> createState() => _PostersState();
}

class _PostersState extends State<Posters> {
  late Future<List<Anime>> _futureAnimes;

  @override
  void initState() {
    super.initState();
    _futureAnimes = fetchTopAnime();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Anime>>(
      future: _futureAnimes,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final animes = snapshot.data!;
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children:
                  animes.map((anime) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 7.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AnimeInfo2(anime: anime),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    anime.imageUrl,
                                    width: 184,
                                    height: 245,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  left: 120,
                                  top: 12,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 5,
                                      horizontal: 2,
                                    ),
                                    child: Container(
                                      width: 41,
                                      height: 18,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: MyColor.white,
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 5,
                                              bottom: 2,
                                              top: 2,
                                            ),
                                            child: Icon(
                                              Icons.star,
                                              size: 10,
                                              color: MyColor.purpleMain,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              bottom: 2.0,
                                              right: 5,
                                            ),
                                            child: Text(
                                              ' ${anime.score != null ? anime.score!.toStringAsFixed(1) : "N/A"}',
                                              style: GoogleFonts.raleway(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            SizedBox(
                              width: 184,
                              child: Text(
                                anime.title,
                                style: GoogleFonts.raleway(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: MyColor.darkBlue,
                                ),
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                maxLines: 1,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              width: 184,
                              child: Text(
                                anime.genres[0],
                                style: GoogleFonts.raleway(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: MyColor.whiteGray,
                                ),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
            ),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
