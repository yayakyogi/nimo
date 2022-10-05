part of 'cpmk_1_bloc.dart';

@immutable
abstract class Cpmk1Event {}

class Cpmk1Action extends Cpmk1Event {
  final int scoreSoal;
  final int indexTes;

  Cpmk1Action({
    required this.scoreSoal,
    required this.indexTes,
  });
}
