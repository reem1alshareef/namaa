import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class TextInputField extends StatelessWidget {
  final String title;
  final String placeHolder;
  final TextEditingController inputController;

  const TextInputField({
    Key? key,
    required this.title,
    required this.placeHolder,
    required this.inputController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        
        SizedBox(
          width: 350,
          //height: 25,
          child: Text(title,
              textAlign: TextAlign.right,
              style: GoogleFonts.getFont("Noto Sans Arabic",
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                  textStyle: const TextStyle(color: Color(0xFFC5C5CD)))),
        ),
        SizedBox(
            width: 350,
            //height: 35,//35
            child: TextFormField(
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.right,
//keyboardType: title=='الراتب'?TextInputType.number:TextInputType.values,
              decoration: InputDecoration(
                hintText: placeHolder,
                hintStyle: const TextStyle(
                    color: Color(0xFF898B99), height: 1, fontSize: 18),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                      width: 0.7, color: Color(0xFFB8BAC2)), //<-- SEE HERE
                ),
                
              ),
              controller: inputController,
              obscureText: title=='كلمة السر'|| title=='تأكيد كلمة السر' || title=='كلمة السر الجديدة'? true:false,
              validator: (value) {
              if (value == null || value.isEmpty) {
                return 'يرجى تعبئة الخانة';
              }
              if( (title=='البريد الإلكتروني' || title=='البريد الالكتروني') && !EmailValidator.validate(value)){
                return 'يرجى إدخال بريد إلكتروني صحيح';
              }
              if(title=='الاسم' && value.length<3 || value.length>40){
                return 'يرجى إدخال اسم صحيح';
              }
              if((title=='كلمة السر' || title =='كلمة السر الجديدة' )&& (value.length<10 || value.length>40)){
                return 'كلمة السر يجب أن تتكون من عشر خانات على الأقل';
              }
              if((title=='كلمة السر' || title =='كلمة السر الجديدة' )&& (!value.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]')))){
                return 'كلمة السر يجب أن تحوي رمز مميز مثل *';
              }
              if((title=='كلمة السر' || title =='كلمة السر الجديدة' )&& (!value.contains(new RegExp(r'[A-Z]')) )){
                return 'كلمة السر يجب أن تحوي حروف من الحالتين الكبيرة والصغيرة ';
              }
              if((title=='كلمة السر' || title =='كلمة السر الجديدة' )&& (!value.contains(new RegExp(r'[0-9]')))){
                return 'كلمة السر يجب أن تحوي رقم ';
              }
              return null;
            }

            )),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }

  bool hasUpperAndLowerCases(String password){
    bool hasUpper=false;
    bool hasLower=false;
    int i=0;
    var character='';
    while (i < password.length){
               character = password.substring(i,i+1);
               print(character);
                  if (character == character.toUpperCase()) {
                      hasUpper=true;
                  }
                  if (character == character.toLowerCase()){
                      hasLower=true;
                  }
              
              i++;
            }

    return hasUpper & hasLower;
  }
}
