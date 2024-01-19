import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gumsmile/provider/register_provider.dart';
import 'package:gumsmile/view/screen/registerscreen.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('TESTING REGISTER UI', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => RegisterProvider(),
        child: const RegisterScreen(),
      ),
    ));

    expect(find.text('Create Account'), findsOneWidget);
    expect(find.text('Username'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Confirm Password'), findsOneWidget);
    expect(find.text('By creating account, I agree to terms & conditions and privacy policy'), findsOneWidget);
    expect(find.text('Sign Up'), findsOneWidget);
    expect(find.text('Already have an account?'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
    expect(find.byType(TextFormField), findsWidgets);
    expect(find.byType(Checkbox), findsOneWidget); 
    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.byIcon(Icons.lock), findsWidgets);
    expect(find.byIcon(Icons.email), findsOneWidget);
    expect(find.byIcon(Icons.person), findsOneWidget);
  });
}