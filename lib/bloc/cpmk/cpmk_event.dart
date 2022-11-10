part of 'cpmk_bloc.dart';

@immutable
abstract class Cpmk1Event {}

class CpmkAction extends Cpmk1Event {
  final int scoreSoal;
  final int indexTes;

  CpmkAction({
    required this.scoreSoal,
    required this.indexTes,
  });
}
