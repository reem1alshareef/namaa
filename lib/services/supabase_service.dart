import 'package:supabase_flutter/supabase_flutter.dart';


class SupabaseService {
  final supabase = Supabase.instance.client;

Future<void> signup(String phoneNumber , String password , String name) async {
await supabase.auth.signUp(
  phone: phoneNumber,
  password: password,
  data: {'name': name}, //لو نبي داتا اضافية لليوزر غير الرقم و الباسوورد نضيفها هنا 
);}

Future<void> signInWithOtp(String phoneNumber) async {
await supabase.auth.signInWithOtp(
  phone: phoneNumber,
  channel: OtpChannel.whatsapp,  
);

Future<void> verifyOTP(String phoneNumber)async {
//final AuthResponse res = 
await supabase.auth.verifyOTP(
  type: OtpType.signup,
  token: 'd736cad8f9f60a18bdd42c58938e90ee',
  phone: phoneNumber,
);}
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