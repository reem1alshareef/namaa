// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:namaagp/SignUp/ViewModelSignUp.dart';

// // Mocking AuthenticationService
// //class MockAuthenticationService extends Mock implements AuthenticationService {}

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   group('SignUp Testing', () {
//     test('Successful sign up', () async {
//       final testobj = ViewModelSignUp();

//       String result = await testobj.signUp(
//           'usersName', 'usersNwEmail@gmail.com', 'Te23*we4', true);

//       expect(result, '0');
//     });

//     test('Account exist, failed sign up', () async {
//       final testobj = ViewModelSignUp();

//       String result = await testobj.signUp(
//           'usersName', 'email@gmail.com', 'Te23*we4', true);

//       expect(result, '2');
//     });

//     test('Invalid Inputs, failed sign up', () async {
//       final testobj = ViewModelSignUp();

//       String result = await testobj.signUp(
//           'usersName', 'newEmail2@gmail.com', 'Ab', false);

//       expect(result, '1');
//     });
//   });
// }
