part of 'cpmk_active_bloc.dart';

@immutable
abstract class CpmkActiveEvent {}

class CpmkActive extends CpmkActiveEvent {
  final int cpmkActive;
  final String caracter;
  final int scoreGlobal;

  CpmkActive({
    required this.cpmkActive,
    required this.caracter,
    required this.scoreGlobal,
  });
}
