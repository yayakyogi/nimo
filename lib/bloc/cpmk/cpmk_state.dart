part of 'cpmk_bloc.dart';

@immutable
abstract class CpmkState {
  final int scoreSoal; // untuk menghitung total setelah menjawab soal
  final int indexTes; // untuk perpindahan menu soal dan materi

  const CpmkState({
    required this.scoreSoal,
    required this.indexTes,
  });
}

class Cpmk1Initial extends CpmkState {
  const Cpmk1Initial()
      : super(
          scoreSoal: 0,
          indexTes: 0,
        );
}

class Cpmk1Loaded extends CpmkState {
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
