part of 'cubit_cubit.dart';

abstract class SwitchState extends Equatable {
  const SwitchState();

  @override
  List<Object> get props => [];
}

class SwitchInitialState extends SwitchState {}
class SwitchOn1State extends SwitchState {}
class SwitchOn2State extends SwitchState {}
class SwitchOn3State extends SwitchState {}
class SwitchOn4State extends SwitchState {}
