import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'charachter_event.dart';
part 'charachter_state.dart';

class CharachterBloc extends Bloc<CharachterEvent, CharachterState> {
  CharachterBloc() : super(CharachterInitial()) {
    on<CharachterEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
