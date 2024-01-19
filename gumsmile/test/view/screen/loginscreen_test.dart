import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gumsmile/provider/login_provider.dart';
import 'package:gumsmile/view/screen/loginscreen.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('TESTING LOGIN UI', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => LoginProvider(),
        child: const ScreenLogin(),
      ),
    ));

    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Dont have any account?'), findsOneWidget);
    expect(find.text('Register now'), findsOneWidget);
    expect(find.byType(TextFormField), findsWidgets);
    expect(find.byType(Image), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
  });
}