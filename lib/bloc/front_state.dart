part of 'front_bloc.dart';

@immutable
abstract class FrontState extends Equatable {}

class FrontInitial extends FrontState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class JuegoIniciadoState extends FrontState {
  final String palabra;
  final String titulo;
  final int contador;

  JuegoIniciadoState(
      {@required this.palabra, @required this.titulo, @required this.contador});

  @override
  // TODO: implement props
  List<Object> get props => [palabra, titulo, contador];
}

class JuegoNextState extends FrontState {
  final String palabra;
  final String titulo;
  final int contador;

  JuegoNextState(
      {@required this.palabra, @required this.titulo, @required this.contador});

  @override
  // TODO: implement props
  List<Object> get props => [palabra, titulo, contador];
}

class JuegoEndState extends FrontState {
  final String titulo;
  final int contador;

  JuegoEndState({@required this.titulo, @required this.contador});

  @override
  // TODO: implement props
  List<Object> get props => [titulo, contador];
}
