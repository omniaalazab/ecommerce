import 'package:ecommerce/controller/login/login_state.dart';
import 'package:ecommerce/views/widget/shared_widget/dialog_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginCubit extends Cubit<LoginStatus> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  LoginCubit() : super(LoginInitial());
  Future<void> resetPassword(
    String mail,
  ) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: mail);
      CreateDialogToaster.showSucessToast('Password reset email sent');
    } on FirebaseAuthException catch (e) {
      CreateDialogToaster.showErrorToast('Error: ${e.message}');
    }
  }

  loginWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    try {
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      emit(LoginSuccess(userCredential.user!));
      return userCredential;
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }

  Future<void> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      emit(LoginLoading());

      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      emit(LoginSuccess(userCredential.user!));
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
