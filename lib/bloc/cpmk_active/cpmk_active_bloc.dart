// ignore_for_file: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cpmk_active_event.dart';
part 'cpmk_active_state.dart';

class CpmkActiveBloc extends Bloc<CpmkActiveEvent, CpmkActiveState> {
  CpmkActiveBloc() : super(const CpmkActiveInitial()) {
    on<CpmkActive>((event, emit) {
      emit(CpmkActiveLoaded(
        getActiveCpmk: event.cpkmActive,
        getCaracter: event.caracter,
      ));
    });
  }
}
