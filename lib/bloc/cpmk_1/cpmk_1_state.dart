part of 'cpmk_1_bloc.dart';

@immutable
abstract class Cpmk1State {
  final int scoreSoal; // untuk menghitung total setelah menjawab soal
  final int indexTes; // untuk perpindahan menu soal dan materi

  const Cpmk1State({
    required this.scoreSoal,
    required this.indexTes,
  });
}

class Cpmk1Initial extends Cpmk1State {
  const Cpmk1Initial()
      : super(
          scoreSoal: 0,
          indexTes: 0,
        );
}

class Cpmk1Loaded extends Cpmk1State {
  final int getScroeSoal;
  final int getIndexTes;

  const Cpmk1Loaded({
    required this.getScroeSoal,
    required this.getIndexTes,
  }) : super(
          scoreSoal: getScroeSoal,
          indexTes: getIndexTes,
        );
}
