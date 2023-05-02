import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cubit_state.dart';

class OnCubit extends Cubit<SwitchState> {
  OnCubit() : super(SwitchInitialState());
  static OnCubit get(context)=> BlocProvider.of(context);
  bool value1 = false;
  bool value2 = false;
  bool value3 = false;
  bool value4 = false;
  void on1(){
 bool value1 = true;

 emit(SwitchOn1State(

 ));
 
  }
    void on2(){
 bool value2 = true;
 emit(SwitchOn2State());
 
  }
    void on3(){
emit(SwitchOn3State());
 
  }
    void on4(){
 bool value4 = true;
 emit(SwitchOn4State());
 
  }
}
