part of 'cpmk_active_bloc.dart';

@immutable
abstract class CpmkActiveEvent {}

class CpmkActive extends CpmkActiveEvent {
  final int cpkmActive;
  final String caracter;
  CpmkActive({
    required this.cpkmActive,
    required this.caracter,
  });
}
