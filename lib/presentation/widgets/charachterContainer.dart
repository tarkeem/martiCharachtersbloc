import 'package:bloc_breaking_bad/data/models/charachter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CharachtersContainer extends StatelessWidget {
 
  Character character;

  CharachtersContainer({required this.character,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: double.infinity,
      height: double.infinity,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed('charachterDetails',arguments: character);
        },
        child: GridTile(footer: Container(
          color: Color.fromARGB(255, 143, 9, 227).withOpacity(0.4),
          child: Text(character.name)),child: Image.network(character.image,fit: BoxFit.cover,)),
      ),
    );
  }
}