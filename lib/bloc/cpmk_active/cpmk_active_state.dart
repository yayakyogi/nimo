part of 'cpmk_active_bloc.dart';

@immutable
abstract class CpmkActiveState {
  final int activeCPMK;
  final String caracter;
  final int scoreGlobal;

  const CpmkActiveState({
    this.activeCPMK = 1,
    this.caracter = '',
    this.scoreGlobal = 0,
  });
}

class CpmkActiveInitial extends CpmkActiveState {
  const CpmkActiveInitial()
      : super(
          activeCPMK: 1,
          caracter: '',
          scoreGlobal: 0,
        );
}

class CpmkActiveLoaded extends CpmkActiveState {
  final int getActiveCpmk;
  final String getCaracter;
  final int getScoreGlobal;

  const CpmkActiveLoaded({
    required this.getActiveCpmk,
    required this.getCaracter,
    required this.getScoreGlobal,
  }) : super(
          activeCPMK: getActiveCpmk,
          caracter: getCaracter,
          scoreGlobal: getScoreGlobal,
        );
}
