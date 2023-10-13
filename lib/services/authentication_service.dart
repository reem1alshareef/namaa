import 'package:supabase_flutter/supabase_flutter.dart';


final supabaseClient = SupabaseClient('https://rpwqxndlhdiqkrejigse.supabase.co', "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJwd3F4bmRsaGRpcWtyZWppZ3NlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTMwNjY4NDQsImV4cCI6MjAwODY0Mjg0NH0.qlIR6KNotfLwl30HsVSUW9M3smblYaYxtk_D7W2L_EU");
final supabase = Supabase.instance.client;
class AuthenticationService {
  static User? currentUser;
  
  //AuthenticationService authService = GetIt.instance<AuthenticationService>();
  // await Supabase.initialize(
  //   url:'https://rpwqxndlhdiqkrejigse.supabase.co',
  //   anonKey:'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJwd3F4bmRsaGRpcWtyZWppZ3NlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTMwNjY4NDQsImV4cCI6MjAwODY0Mjg0NH0.qlIR6KNotfLwl30HsVSUW9M3smblYaYxtk_D7W2L_EU',
  // );

  Future<int> signUp({required String namee, required String emaill, required String passwordd}) async {
    //try {
      //Call the appropriate method from Supabase to sign up the user
      try{
  final supabaseClient = SupabaseClient('https://rpwqxndlhdiqkrejigse.supabase.co', "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJwd3F4bmRsaGRpcWtyZWppZ3NlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTMwNjY4NDQsImV4cCI6MjAwODY0Mjg0NH0.qlIR6KNotfLwl30HsVSUW9M3smblYaYxtk_D7W2L_EU");
  print('$emaill and $passwordd');
  //supabaseClient.cl
final res=await supabaseClient.auth.signUp(
        email: emaill, // Use the phone number as the email (assuming Supabase requires an email for sign-up)
        password: passwordd,
      );
      final Session? session = res.session;
      final User? user = res.user;

await supabaseClient.from('userAccount')
  .insert([
    { 'Email': emaill, 'name': namee, 'passcode':'0000', 'UserID':res.user?.id},
  ]);
  return 0;
      //print(response.user?.id);

      //res.user.
      
      //verifyUserAccount();
  }catch(e){
return 2;
  }

  //return 0;
      




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
    try{

await supabase.auth.verifyOTP(token: otp, type: OtpType.email, email: email);
//return true;
    }catch(e){
      print(e.toString());
      //return false;
    }
    

}

  static Future<int> signInUser(String email, String password,) async {
    late AuthResponse response;
    //try{
      final supabaseClient = SupabaseClient('https://rpwqxndlhdiqkrejigse.supabase.co', "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJwd3F4bmRsaGRpcWtyZWppZ3NlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTMwNjY4NDQsImV4cCI6MjAwODY0Mjg0NH0.qlIR6KNotfLwl30HsVSUW9M3smblYaYxtk_D7W2L_EU");
//final supabase = supabaseClient.auth.admin.noSuchMethod(invocation)
try{
      response= await supabaseClient.auth.signInWithPassword(password: password, email: email);

}on Exception catch(e){
  print('An error occurred: $e');
  return 2;
//throw e;

}
  //  .catchError((error){
  //   // print('Error signing in: $error');
  //   // throw Exception(error);
  //   return Exception(error);

  //  });
   if (response.session!=null) {
final Session? session = response.session;
currentUser = response.user;
await supabase.auth.signInWithOtp(
  email: email,
);
  } else if (response.session==null){
}
return 0;
    // }catch(e){
    //   print(e.toString());
    //   return e;
    //   }
}


// static String? currentEmail(User? user) {
//   return user?.email;
// }

// String? currentEmail() {
//     return user?.email;
//   }
}