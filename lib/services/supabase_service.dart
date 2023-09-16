import 'dart:math';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

// class SupabaseService {
//   final SupabaseClient _supabaseClient = SupabaseClient(
//     'https://rpwqxndlhdiqkrejigse.supabase.co',
//     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJwd3F4bmRsaGRpcWtyZWppZ3NlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTMwNjY4NDQsImV4cCI6MjAwODY0Mjg0NH0.qlIR6KNotfLwl30HsVSUW9M3smblYaYxtk_D7W2L_EU',
//   );

//   Future<void> signup({
    
//     required String name,
//     required String phoneNumber,
//     required String password,
//     required String passcode,
//   }) async {
    
//     final response = await _supabaseClient.from('userAccount').insert([
//       {
//         'phoneNumber': phoneNumber,
//         'name': name,
//         'password': password,
//         'passcode': passcode,
//       },
//     ]);

//     if (response.error == null) {
//       print('User data inserted successfully');
//     } else {
//       throw Exception('Failed to insert user data: ${response.error}');
//     }
    
//   }
// }


import 'package:supabase/supabase.dart';
import 'dart:js' as js;

class SupabaseService {
  final supabase = Supabase.instance.client;
  final SupabaseClient _supabaseClient = SupabaseClient(
    'https://rpwqxndlhdiqkrejigse.supabase.co',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJwd3F4bmRsaGRpcWtyZWppZ3NlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTMwNjY4NDQsImV4cCI6MjAwODY0Mjg0NH0.qlIR6KNotfLwl30HsVSUW9M3smblYaYxtk_D7W2L_EU',
  );
  
//   Future<void> signup (context, {required String phoneNumber, required String name})async{
//   await supabase.auth.signUp({
//   name : name,
//   phoneNember,
//   email: email,
//   password: password,
// })}


Future<void> signInWithOtp(String phoneNumber) async {
await supabase.auth.signInWithOtp(
  phone: phoneNumber, 
);
  }

Future<void> verifyOTP(String phoneNumber)async {
final AuthResponse res = await supabase.auth.verifyOTP(
  type: OtpType.sms,
  token: 'd736cad8f9f60a18bdd42c58938e90ee',
  phone: phoneNumber,
);
final Session? session = res.session;
final User? user = res.user;
}

}

  // String _verificationPhoneNumber = ''; // Track the phone number being verified

  // Future<void> signUp({
  //   required String name,
  //   required String phoneNumber,
  //   required String password,
  // }) async {
  //   // Insert user data into Supabase
  //   final response = await _supabaseClient.from('userAccount').insert([
  //     {
  //       'phoneNumber': phoneNumber,
  //       'name': name,
  //       'password': password,
  //     },
  //   ]).execute();

  //   if (response.status >= 200 && response.status < 300) {
  //     // Send verification SMS
  //     _verificationPhoneNumber = phoneNumber;
  //     final passcode = generateVerificationCode();
  //     await sendVerificationSMS(passcode);
  //     print('User data inserted successfully');
  //   } else {
  //     final errorData = response.data as Map<String, dynamic>?;

  //     if (errorData != null) {
  //       final errorMessage = errorData['message'] as String?;
  //       throw Exception('Failed to insert user data: $errorMessage');
  //     } else {
  //       throw Exception('Failed to insert user data');
  //     }
  //   }
  // }

  


  // String generateVerificationCode() {
  //   // Generate a random 6-digit verification code
  //   final random = Random();
  //   final code = random.nextInt(999999);
  //   return code.toString().padLeft(6, '0');
  // }

//   Future<bool> verifyCode(String verificationCode) async {
//     // Perform verification logic here
//     // You can compare the user-entered code with the generated passcode from Supabase
//     // Replace this part with your actual verification logic
//     final generatedPasscodeResponse = await _supabaseClient
//         .from('userAccount')
//         .select('verificationCode')
//         .eq('phoneNumber', _verificationPhoneNumber)
//         .single()
//         .execute();

//     final generatedPasscode =
//         generatedPasscodeResponse.data['verificationCode'];

//     return verificationCode == generatedPasscode;
//   }
// }


///بنحتاجه بعدين
const String supabaseUrl = "https://rpwqxndlhdiqkrejigse.supabase.co";
const String token =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJwd3F4bmRsaGRpcWtyZWppZ3NlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTMwNjY4NDQsImV4cCI6MjAwODY0Mjg0NH0.qlIR6KNotfLwl30HsVSUW9M3smblYaYxtk_D7W2L_EU";

  final client = SupabaseClient(supabaseUrl, token);
//final client = SupabaseClient(supabaseUrl, token);
  Future<void> logout (context)async{
    await client.auth.signOut();
  }

