import 'package:supabase_flutter/supabase_flutter.dart';


final supabaseClient = SupabaseClient('https://rpwqxndlhdiqkrejigse.supabase.co', "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJwd3F4bmRsaGRpcWtyZWppZ3NlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTMwNjY4NDQsImV4cCI6MjAwODY0Mjg0NH0.qlIR6KNotfLwl30HsVSUW9M3smblYaYxtk_D7W2L_EU");
final supabase = Supabase.instance.client;
class AuthenticationService {
  
  //AuthenticationService authService = GetIt.instance<AuthenticationService>();
  // await Supabase.initialize(
  //   url:'https://rpwqxndlhdiqkrejigse.supabase.co',
  //   anonKey:'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJwd3F4bmRsaGRpcWtyZWppZ3NlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTMwNjY4NDQsImV4cCI6MjAwODY0Mjg0NH0.qlIR6KNotfLwl30HsVSUW9M3smblYaYxtk_D7W2L_EU',
  // );

  Future<void> signUp({required String namee, required String email, required String passwordd}) async {
    //try {
      //Call the appropriate method from Supabase to sign up the user
      try{
  final supabaseClient = SupabaseClient('https://rpwqxndlhdiqkrejigse.supabase.co', "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJwd3F4bmRsaGRpcWtyZWppZ3NlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTMwNjY4NDQsImV4cCI6MjAwODY0Mjg0NH0.qlIR6KNotfLwl30HsVSUW9M3smblYaYxtk_D7W2L_EU");
await supabaseClient.auth.signUp(
        email: email, // Use the phone number as the email (assuming Supabase requires an email for sign-up)
        password: passwordd,
      );
      
      //verifyUserAccount();
  }catch(e){

  }
      




      // if (response.user == null) {
      //   // Additional logic to save the user data in Supabase
      //   // final user = response.user;
      //   // final userData = {
      //   //   'name': name,
      //   //   'phone_number': phoneNumber,
      //   //   'password' : password,
      //   //   'passcode' : passcode,
      //   // };
      //   print('Im null user');

      //   // Save the user data in a Supabase table
      //   //final saveResponse = await _supabaseClient.from('userAccount').upsert([userData]);
      //   // if (saveResponse == null) {
      //   //   // Handle any additional logic after successful sign-up and data save
      //   //   return;
      //   // } else {
      //   //   throw Exception('Data save error: ${saveResponse.toString()}');
      //   // }
      // } else {
      //   throw Exception('Sign-up error: ${response.toString()}');
      // }
    // } catch (e) {
    //   // Handle any errors that occur during the sign-up process
    //   throw e.toString();
    // }
   }

  static Future<void> verifyUserAccount(String otp, String email)async{
    // String otp='';
    // //await supabase.auth.signInWithOtp(email: 'shadenfalharbi@gmail.com',);
    // otp = stdin.readLineSync()!;
    try{
await supabase.auth.verifyOTP(token: otp, type: OtpType.email, email: email);
//return true;
    }catch(e){
      print(e.toString());
      //return false;
    }
    

   }
   
   Future<void> sendOTP(String email) async {
   await supabase.auth.signInWithOtp(
    email: email,
  );

  // if (response.toString() != null) {
  //   throw Exception('Error sending OTP: ${response.error.message}');
  // }
}


  // Add other authentication methods using Supabase
}


