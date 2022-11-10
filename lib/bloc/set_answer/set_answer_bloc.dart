import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'set_answer_event.dart';
part 'set_answer_state.dart';

class SetAnswerBloc extends Bloc<SetAnswerEvent, SetAnswerState> {
  SetAnswerBloc() : super(const SetAnswerInitial()) {
    on<SetAnswerEvent>((event, emit) {
      emit(SetAnswerLoaded(
        getIndexAnswer: event.indexAnswer,
        getScore: event.score,
      ));
    });
  }
}
