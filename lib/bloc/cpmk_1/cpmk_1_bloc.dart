// ignore_for_file: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cpmk_1_event.dart';
part 'cpmk_1_state.dart';

class Cpmk1Bloc extends Bloc<Cpmk1Event, Cpmk1State> {
  Cpmk1Bloc() : super(const Cpmk1Initial()) {
    on<Cpmk1Action>((event, emit) {
      emit(Cpmk1Loaded(
        getScroeSoal: event.scoreSoal,
        getIndexTes: event.indexTes,
      ));
    });
  }
}
