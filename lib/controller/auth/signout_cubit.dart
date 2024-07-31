import 'package:ecommerce/controller/auth/signout_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<SignoutStatus> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  AuthCubit() : super(InitialStatus());
  Future<void> signOut() async {
    try {
      await firebaseAuth.signOut();
      emit(Unauthenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
