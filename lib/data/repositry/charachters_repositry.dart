import 'package:bloc_breaking_bad/data/models/charachter.dart';
import 'package:bloc_breaking_bad/data/web_sevices/character_web_services.dart';

class CharacterRepositry
{
  final CharacterWebServices characterWebServices;
  CharacterRepositry(this.characterWebServices);
  Future getAllCharachters()async{
    final List charachters=await characterWebServices.getAllCharachters();
    return charachters.map((e) =>Character.fromJson(e) ,).toList();
  }
}