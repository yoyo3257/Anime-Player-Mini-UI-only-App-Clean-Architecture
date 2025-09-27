import 'package:anime_palyer/core/colors.dart';
import 'package:anime_palyer/data/network/api_handler.dart';
import 'package:anime_palyer/data/models/character_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopCharacters extends StatefulWidget {
  const TopCharacters({super.key});

  @override
  State<TopCharacters> createState() => _TopCharactersState();
}

class _TopCharactersState extends State<TopCharacters> {
  late Future<List<Character>> _futureCharacters;

  @override
  void initState() {
    super.initState();
    _futureCharacters = fetchCharacters(30);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Character>>(
      future: _futureCharacters,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final characters = snapshot.data!;
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children:
                  characters.map((character) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.network(
                              character.imageUrl,
                              width: 92,
                              height: 92,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                            width: 92,
                            child: Text(
                              character.name,
                              style: GoogleFonts.raleway(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: MyColor.darkBlue,
                              ),
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              maxLines: 1,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            width: 92,
                            child: Text(
                              character.animeTitles[0],
                              style: GoogleFonts.raleway(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: MyColor.whiteGray,
                              ),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
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
