import 'package:supabase_flutter/supabase_flutter.dart';
//{required String name, required String phoneNumber}

class SupabaseService {
  final supabase = Supabase.instance.client;
  //final s=SupabaseAuth.

 Future<void> signup(String phoneNumber , String password , String name, ) async {
//   await supabase.auth.verifyOTP(
//   type: OtpType.signup,
//   token: 'd736cad8f9f60a18bdd42c58938e90ee',
//   phone: phoneNumber,
// );
  //supabase_service.verifyOTP();
  //await verifyOTP(phoneNumber);
//   const { data, error } = await supabase.auth.signUp({
//   phone: '+57336567365',
//   password: 'testsupabasenow',
//   options: {
//     channel: 'whatsapp',
//   },
// }
// )
//await supabase.auth.verifyOTP(token: token, type: type);

//final AuthResponse res = 
await supabase.auth.signUp(phone: '+966532614855',password: 'password', );
await supabase.auth.signInWithOtp(
  phone: '+966532614855',
  //channel: OtpChannel.sms,
);
// await supabase.auth.verifyOTP(
//   type: OtpType.signup,
//   token: '9PFAPO6inaDf5isX',
//   phone: '+966502826880',
// );

//await supabase.auth.signUp(phone: '+966502826880',password: 'password', );
 }

// await supabase.auth.signUp(
//   channel: "whatsapp",
//   phone: phoneNumber,
//   password: password,
//   data: {'name': name}, //لو نبي داتا اضافية لليوزر غير الرقم و الباسوورد نضيفها هنا 
// );}

Future<void> signInWithOtp(String phoneNumber) async {//format error should be added
await supabase.auth.signInWithOtp(
  phone: phoneNumber,
  channel: OtpChannel.whatsapp,
);

Future<void> verifyOTP(String phoneNumber)async {
//final AuthResponse res = 
// await supabase.auth.verifyOTP(
//   type: OtpType.signup,
//   token: 'd736cad8f9f60a18bdd42c58938e90ee',
//   phone: phoneNumber,
// );
}
// اتوقع ان السطرين هذي نحتاجها عشان نتاكد من اليوزر اللي داخل حاليا
//final Session? session = res.session;
//final User? user = res.user;

//او بطريقه ثانية اذا نبي نعرف اليوزر اللي موجود حاليا و نسترجع بياناته
//final User? user = supabase.auth.currentUser;


}

Future<void> signOut(context)async{
    await supabase.auth.signOut();}

Future<void> resendResponse (String phoneNumber)async{
//final ResendResponse res =
await supabase.auth.resend(
  type: OtpType.signup,
  phone: phoneNumber,
  );}

}