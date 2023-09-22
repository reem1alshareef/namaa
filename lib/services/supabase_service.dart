import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class SupabaseService {
  final supabase = Supabase.instance.client;

Future<void> signup() async {
// await supabase.auth.signUp(
//   phone: phoneNumber,
//   password: password,
//   data: {'name': name}, //لو نبي داتا اضافية لليوزر غير الرقم و الباسوورد نضيفها هنا 
final AuthResponse res = await supabase.auth.signUp(
  email: '441200087@student.ksu.edu.sa',
  password: '4567jh',
  data: {'username': 'reem' , 'phone':'0532614855'},
);
final Session? session = res.session;
final User? user = res.user;
// await supabase.auth.admin.createUser(AdminUserAttributes(
//   email: '441200087@student.ksu.edu.sa',

//   password: 'reem is queen',
//   //userMetadata: {'name': 'meow'},
// ));
;}


// Future<void> verifyOTP() async {
// final AuthResponse res = await supabase.auth.verifyOTP(
//   type: OtpType.email,
//   email: '441200087@student.ksu.edu.sa', token: '111198',
// );
// final Session? session = res.session;
// final User? user = res.user;
// }


// final ResendResponse res = await supabase.auth.resend(
//   type: OtpType.email,
//   email: 'email@example.com',
// );

Future<void> signInWithOtp() async {
await supabase.auth.signInWithOtp(
  email: '441200087@student.ksu.edu.sa',
  emailRedirectTo: kIsWeb ? null : 'io.supabase.flutter://signin-callback/',
);}


// Future<void> verifyOTP(String phoneNumber)async {
// //final AuthResponse res = 
// await supabase.auth.verifyOTP(
//   type: OtpType.signup,
//   token: 'd736cad8f9f60a18bdd42c58938e90ee',
//   phone: phoneNumber,
// );}
// اتوقع ان السطرين هذي نحتاجها عشان نتاكد من اليوزر اللي داخل حاليا
//final Session? session = res.session;
//final User? user = res.user;

//او بطريقه ثانية اذا نبي نعرف اليوزر اللي موجود حاليا و نسترجع بياناته
//final User? user = supabase.auth.currentUser;

Future<void> resend() async{
await supabase.auth.resend(
  type: OtpType.email,
  email: '441200087@student.ksu.edu.sa',
);
}


static const String supabaseUrl = 'https://rpwqxndlhdiqkrejigse.supabase.co';
static const String token =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJwd3F4bmRsaGRpcWtyZWppZ3NlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTMwNjY4NDQsImV4cCI6MjAwODY0Mjg0NH0.qlIR6KNotfLwl30HsVSUW9M3smblYaYxtk_D7W2L_EU";
final client = SupabaseClient(supabaseUrl, token);
  Future<void> signUpUser(String? email, String? password , int? phone ) async {
    debugPrint("email:$email password:$password phone:$phone");
    (email != null && phone == null) || (email == null && phone != null);
    final result = await client.auth.signUp(email :email , password: 'reemreem' );

    debugPrint(result.toString());
}

//  Future<void> signInUser(context, {String? email, String? password}) async {
//     debugPrint("email:$email password:$password");
//     final result = await client.auth.signInWithPassword(email: email!, password: password!);
//     debugPrint(result.toString());

// }


Future<void> signInUser(context, {String? email, String? password, String? phone , String? otp}) async {
  debugPrint("email: $email password: $password phone: $phone otp: $otp");

  try {
    if (password != null && otp != null) {
      // Sign in with password first
      final passwordResponse = await client.auth.signInWithPassword(
        email: email!,
        password: password,
      );
      // Verify the OTP
      final otpResponse = await client.auth.verifyOTP(
        type: OtpType.email,
        token: otp,
        email: email,
        phone:phone,
      );
      debugPrint('Password response: ${passwordResponse.toString()}');
      debugPrint('OTP response: ${otpResponse.toString()}');
    } else {
      throw Exception('Both password and OTP are required.');
    }
  } catch (error) {
    // Handle any authentication errors
    debugPrint('Authentication error: $error');
  }
}


  Future<void> logout (context)async{
    await client.auth.signOut();
  }

}