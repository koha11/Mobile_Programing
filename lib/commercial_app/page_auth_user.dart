import 'package:anhkhoa_flutter_app/commercial_app/admin_pages/fruits_page_admin.dart';
import 'package:anhkhoa_flutter_app/commercial_app/page_verify_otp.dart';
import 'package:flutter/material.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

AuthResponse? response;

class PageAuthUser extends StatelessWidget {
  const PageAuthUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(child: Container()),
              SupaEmailAuth(
                onSignInComplete: (res) {
                  response = res;
                  Navigator.of(context).pop();
                },
                onSignUpComplete: (res) {
                  if (res.user != null) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PageVerifyOtp(
                        email: res.user!.email!,
                      ),
                    ));
                  }
                },
                showConfirmPasswordField: true,
              ),
              Expanded(child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}
