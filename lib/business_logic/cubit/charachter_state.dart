part of 'charachter_cubit.dart';

@immutable
abstract class CharachterState {}

class CharachterInitial extends CharachterState {
 

}
class CharachterLoaded extends CharachterState
{
   final List<Character>charachters;
   CharachterLoaded(this.charachters);
}
