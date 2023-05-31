import 'package:bloc_breaking_bad/data/models/charachter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class CharachtersContainer extends StatelessWidget {
  Character character;

  CharachtersContainer({required this.character, super.key});

  @override
  Widget build(BuildContext context) {
    var devicesize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(10),
      width: double.infinity,
      height: double.infinity,
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .pushNamed('charachterDetails', arguments: character);
        },
        child: GridTile(
            footer: Container(
                height: devicesize.height * 0.10,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 143, 9, 227).withOpacity(0.4),
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(20))),
                child: Center(child: Text(character.name,style: GoogleFonts.acme(fontSize: 20,color: Colors.black),))),
            child: Image.network(
              character.image,
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}
