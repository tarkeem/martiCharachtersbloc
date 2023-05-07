import 'package:bloc_breaking_bad/business_logic/cubit/charachter_cubit.dart';
import 'package:bloc_breaking_bad/data/repositry/charachters_repositry.dart';
import 'package:bloc_breaking_bad/data/web_sevices/character_web_services.dart';
import 'package:bloc_breaking_bad/presentation/screens/charachterDetails_sc.dart';
import 'package:bloc_breaking_bad/presentation/screens/charachters_sc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './data/models/charachter.dart';
class AppRouter{
  late CharacterRepositry characterRepositry;
  late CharachterCubit charachterCubit;


AppRouter(){
  characterRepositry=CharacterRepositry(CharacterWebServices());
  charachterCubit=CharachterCubit(characterRepositry);
}


  Route? generateRoute(RouteSettings settings){
    switch(settings.name){
      case "/":
        return MaterialPageRoute(builder: (_) =>BlocProvider(
          create: (context) => charachterCubit,
          child: charachtersScreen(),
        ) ,);
      case 'charachterDetails':
      return MaterialPageRoute(builder: (context) {
        Character character=settings.arguments as Character;
        return charachterDetailsScreen(charachter:character);
      },);
    }
  }
}