// ignore_for_file: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cpmk_event.dart';
part 'cpmk_state.dart';

class CpmkBloc extends Bloc<Cpmk1Event, CpmkState> {
  CpmkBloc() : super(const Cpmk1Initial()) {
    on<CpmkAction>((event, emit) {
      emit(Cpmk1Loaded(
        getScroeSoal: event.scoreSoal,
        getIndexTes: event.indexTes,
      ));
    });
  }
}
