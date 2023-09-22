// import 'package:supabase/supabase.dart';
// import 'package:get_it/get_it.dart';

// final SupabaseClient _supabaseClient = SupabaseClient('https://rpwqxndlhdiqkrejigse.supabase.co', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJwd3F4bmRsaGRpcWtyZWppZ3NlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTMwNjY4NDQsImV4cCI6MjAwODY0Mjg0NH0.qlIR6KNotfLwl30HsVSUW9M3smblYaYxtk_D7W2L_EU');

// class AuthenticationService {
//   //AuthenticationService authService = GetIt.instance<AuthenticationService>();
  

//   Future<void> signUp({required String name, required String phoneNumber, required String password,  required String passcode}) async {
//     try {
//       // Call the appropriate method from Supabase to sign up the user
//       final response = await _supabaseClient.auth.signUp(
//         phone: phoneNumber, // Use the phone number as the email (assuming Supabase requires an email for sign-up)
//         password: password,
        
//       );

//       if (response == null) {
//         // Additional logic to save the user data in Supabase
//         final user = response.user;
//         final userData = {
//           'name': name,
//           'phone_number': phoneNumber,
//           'password' : password,
//           'passcode' : passcode,
//         };

//         // Save the user data in a Supabase table
//         final saveResponse = await _supabaseClient.from('userAccount').upsert([userData]);
//         if (saveResponse == null) {
//           // Handle any additional logic after successful sign-up and data save
//           return;
//         } else {
//           throw Exception('Data save error: ${saveResponse.toString()}');
//         }
//       } else {
//         throw Exception('Sign-up error: ${response.toString()}');
//       }
//     } catch (e) {
//       // Handle any errors that occur during the sign-up process
//       throw e.toString();
//     }
//   }

//   // Add other authentication methods using Supabase
// }


