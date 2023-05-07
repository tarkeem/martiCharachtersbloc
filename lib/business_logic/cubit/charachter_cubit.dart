import 'package:bloc/bloc.dart';
import 'package:bloc_breaking_bad/data/models/charachter.dart';
import 'package:bloc_breaking_bad/data/repositry/charachters_repositry.dart';
import 'package:meta/meta.dart';

part 'charachter_state.dart';

class CharachterCubit extends Cubit<CharachterState> {
  final CharacterRepositry characterRepositry;
  List<Character> charachters=[];
  CharachterCubit(this.characterRepositry) : super(CharachterInitial());

  List<Character> getAllCharachters() {
    characterRepositry.getAllCharachters().then((value) {
      charachters = value;
      emit(CharachterLoaded(value));
    });
    return charachters;
  }
}
