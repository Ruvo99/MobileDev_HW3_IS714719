import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'front_event.dart';
part 'front_state.dart';

class FrontBloc extends Bloc<FrontEvent, FrontState> {
  FrontBloc() : super(FrontInitial());
  List<String> list1 = ["Perro", "Gato"];
  List<String> list2 = ["Tree", "Gato"];
  int listSize = 0;
  int index = 0;
  int count = 0;
  @override
  Stream<FrontState> mapEventToState(
    FrontEvent event,
  ) async* {
    if (event is StartEvent) {
      listSize = list1.length;
      count = 0;
      index = 0;
      yield JuegoIniciadoState(
          contador: count, palabra: list1[index], titulo: "The word is...");
    } else if (event is SkipEvent) {
      if (list1[index] != list2[index]) count++;
      index++;
      if (index < listSize)
        yield JuegoIniciadoState(
            contador: count, palabra: list1[index], titulo: "The word is....");
      else
        yield JuegoEndState(contador: count, titulo: "You Scored");
    } else if (event is GotEvent) {
      if (list1[index] == list2[index]) count++;
      index++;
      if (index < listSize)
        yield JuegoIniciadoState(
            contador: count, palabra: list1[index], titulo: "The word is....");
      else
        yield JuegoEndState(contador: count, titulo: "You Scored");
    } else if (event is EndEvent) {
      yield JuegoEndState(contador: count, titulo: "You Scored");
    }
  }
}
