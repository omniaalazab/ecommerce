import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/controller/users/user_state.dart';
import 'package:ecommerce/model/users_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserState> {
  //final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  UserCubit() : super(UserState(user: []));
  Future<void> addUser(String userMail, String userName, String userPassword,
      String userLastName) async {
    final user = Users(
      userMail: userMail,
      userName: userName,
      userPassword: userPassword,
      userLastName: userLastName,
    );
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userMail)
        .set(user.toMap());
    final newUser = List<Users>.from(state.user);
    newUser.add(user);
    emit(UserState(user: newUser));
  }

  Future<void> fetchUserData() async {
    User? user1 = FirebaseAuth.instance.currentUser;
    if (user1 != null) {
      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('userMail', isEqualTo: user1.email)
          .get();
      final user =
          snapshot.docs.map((doc) => Users.fromMap(doc.data())).toList();
      emit(UserState(user: user));
    }
  }
}
