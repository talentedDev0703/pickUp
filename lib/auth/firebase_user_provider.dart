import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class PickupsFirebaseUser {
  PickupsFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

PickupsFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<PickupsFirebaseUser> pickupsFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<PickupsFirebaseUser>(
      (user) {
        currentUser = PickupsFirebaseUser(user);
        return currentUser!;
      },
    );
