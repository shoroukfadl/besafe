// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// part 'register_state.dart';


// class RegisterCubit extends Cubit<RegisterState> {
//   RegisterCubit() : super(RegisterInitialState());
//   static RegisterCubit  get(context)=> BlocProvider.of(context);

//   void userRegiter(
//     {
//       required String fistName,
//       required String lastName,
//       required String email,
//       required String password,

//     }
//   )
// {
//     emit(RegisterLoadingState());
//     FirebaseAuth.instance.createUserWithEmailAndPassword(
//       email: email,
//        password: password,
//        ).then((value) {
//         print(value.user?.email);
//         print(value.user?.uid);
//         emit(RegisterSuccessState());
//        }).catchError((error) {
//         emit(RegisterErrorState(error.toString()));
//        });
//   }
// }