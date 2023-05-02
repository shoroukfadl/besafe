// // import 'package:bloc/bloc.dart';
// // import 'package:bloc_provider/bloc_provider.dart';
// import 'package:equatable/equatable.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// part 'login_state.dart';

// class LoginCubit extends Cubit<LoginState> {
//   LoginCubit() : super(LoginInitialState());
//   static LoginCubit  get(context)=> BlocProvider.of(context);

//   void userLogin(
//     {
//       required String email,
//       required String password,
//     }
//   ){
//     emit(LoginLoadingState());
//     FirebaseAuth.instance.createUserWithEmailAndPassword(
//       email: email,
//        password: password,
//        ).then((value) {
//         print(value.user?.email);
//         print(value.user?.uid);
//         emit(LoginSuccessState());
//        }).catchError((error) {
//         emit(LoginErrorState(error.toString()));
//        });
//   }
// }
 
// //   ){
// data:[ 'email': email,
//   'password': Password,];
 

// print(value.data);
// emit(LoginSuccessState());


//   }

