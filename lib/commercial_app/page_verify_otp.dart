import 'package:anhkhoa_flutter_app/commercial_app/page_auth_user.dart';
import 'package:anhkhoa_flutter_app/commercial_app/page_user_info.dart';
import 'package:anhkhoa_flutter_app/helpers/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

class PageVerifyOtp extends StatelessWidget {
  String? email;
  PageVerifyOtp({super.key, required String email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Verify Account"),
      ),
      body: Column(
        children: [
          OtpTextField(
              numberOfFields: 6,
              borderColor: Color(0xFF512DA8),
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) async {
                response = await Supabase.instance.client.auth.verifyOTP(
                    type: OtpType.email, token: verificationCode, email: email);

                if (response?.session != null && response?.user != null) {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => PageUserInfo(),
                      ),
                      (route) => false);
                }
              }),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
              onPressed: () async {
                showSnackBar(context, msg: "Đang gửi mã OTP", second: 600);

                final reponse = await Supabase.instance.client.auth
                    .signInWithOtp(email: email);

                showSnackBar(context, msg: "Mã OTP đã được gửi");
              },
              child: Text("Gửi lại mã OTP"))
        ],
      ),
    );
  }
}
