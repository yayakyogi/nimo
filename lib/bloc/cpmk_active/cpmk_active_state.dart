part of 'cpmk_active_bloc.dart';

@immutable
abstract class CpmkActiveState {
  final int activeCPMK;
  final String caracter;

  const CpmkActiveState({
    this.activeCPMK = 1,
    this.caracter = '',
  });
}

class CpmkActiveInitial extends CpmkActiveState {
  const CpmkActiveInitial()
      : super(
          activeCPMK: 1,
          caracter: '',
        );
}

class CpmkActiveLoaded extends CpmkActiveState {
  final int getActiveCpmk;
  final String getCaracter;
  const CpmkActiveLoaded({
    required this.getActiveCpmk,
    required this.getCaracter,
  }) : super(
          activeCPMK: getActiveCpmk,
          caracter: getCaracter,
        );
}
