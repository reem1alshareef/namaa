import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:namaagp/SignIn/ViewModelSignIn.dart';
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('Login Tests', () {
    testWidgets('Valid email and password should return true', (WidgetTester tester) async {
      final viewModel = ViewModelSignIn();
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(builder: (context) {
            return ElevatedButton(
              onPressed: () async {
                final result = await viewModel.signIn(
                  'reem.shareef21@hotmail.com',
                  '123123@Reem',
                  GlobalKey<FormState>(),
                );
                expect(result, true);
              },
              child: const Text('Test Button'),
            );
          }),
        ),
      );
      // Await the animation to complete
      await tester.pumpAndSettle();
    });

    testWidgets('Invalid email and valid password should return false', (WidgetTester tester) async {
      final viewModel = ViewModelSignIn();
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(builder: (context) {
            return ElevatedButton(
              onPressed: () async {
                final result = await viewModel.signIn(
                  'reem.shareef@hotmail.com',
                  '123123@Reem',
                  GlobalKey<FormState>(),
                );
                expect(result, false);
              },
              child: const Text('Test Button'),
            );
          }),
        ),
      );
      // Await the animation to complete
      await tester.pumpAndSettle();
    });

    testWidgets('Valid email and invalid password should return false', (WidgetTester tester) async {
      final viewModel = ViewModelSignIn();
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(builder: (context) {
            return ElevatedButton(
              onPressed: () async {
                final result = await viewModel.signIn(
                  'reem.shareef21@hotmail.com',
                  '123123Reem#',
                  GlobalKey<FormState>(),
                );
                expect(result, false);
              },
              child: const Text('Test Button'),
            );
          }),
        ),
      );
      // Await the animation to complete
      await tester.pumpAndSettle();
    });

    testWidgets('Invalid email and password should return false', (WidgetTester tester) async {
      final viewModel = ViewModelSignIn();
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(builder: (context) {
            return ElevatedButton(
              onPressed: () async {
                final result = await viewModel.signIn(
                  'reem1shareef.hotmail.com',
                  '123456R@123',
                  GlobalKey<FormState>(),
                );
                expect(result, false);
              },
              child: const Text('Test Button'),
            );
          }),
        ),
      );
      // Await the animation to complete
      await tester.pumpAndSettle();
    });

    testWidgets('Empty email and password should return false', (WidgetTester tester) async {
      final viewModel = ViewModelSignIn();
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(builder: (context) {
            return ElevatedButton(
              onPressed: () async {
                final result = await viewModel.signIn(
                  ' ',
                  ' ',
                  GlobalKey<FormState>(),
                );
                expect(result, false);
              },
              child: const Text('Test Button'),
            );
          }),
        ),
      );
      // Await the animation to complete
      await tester.pumpAndSettle();
    });
  });
}


//flutter test lib/test/authentication_test.dart