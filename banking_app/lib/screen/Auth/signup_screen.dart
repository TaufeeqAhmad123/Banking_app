import 'package:banking_app/screen/Auth/widget/custom_richtext.dart';
import 'package:banking_app/screen/Auth/widget/divider.dart';
import 'package:banking_app/screen/Auth/widget/terms_privacy.dart';
import 'package:banking_app/screen/Auth/widget/text_button.dart';
import 'package:banking_app/screen/home/home_screen.dart';
import 'package:banking_app/utils/appcolor.dart';
import 'package:banking_app/utils/page_transition.dart';
import 'package:banking_app/widget/primary_button.dart';
import 'package:banking_app/widget/primary_textfield.dart';
import 'package:banking_app/widget/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kWhite,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Text(
                  'Create Your Account👋',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ).copyWith(color: AppColor.kGrayscaleDark100, fontSize: 20),
                ),
                const SizedBox(height: 8),
                Text(
                  'We happy to see you. Sign up to your account',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColor.kWhite,
                  ).copyWith(color: AppColor.kGrayscale40, fontSize: 14),
                ),
                SizedBox(height: 36),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'First Name',
                          style:
                              GoogleFonts.plusJakartaSans(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColor.kWhite,
                              ).copyWith(
                                color: AppColor.kGrayscaleDark100,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                        ),
                        const SizedBox(height: 8),
                        PrimaryTextFormField(
                          borderRadius: BorderRadius.circular(12),
                          hintText: 'Jhon',
                          controller: emailC,
                          keyboardType: TextInputType.emailAddress,
                          
                          width: 180,
                          height: 52,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Last Name',
                          style:
                              GoogleFonts.plusJakartaSans(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColor.kWhite,
                              ).copyWith(
                                color: AppColor.kGrayscaleDark100,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                        ),
                        const SizedBox(height: 8),
                        PrimaryTextFormField(
                          borderRadius: BorderRadius.circular(12),
                          hintText: 'Dev',
                          controller: emailC,
                          keyboardType: TextInputType.emailAddress,
                          
                          width: 180,
                          height: 52,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
                      style:
                          GoogleFonts.plusJakartaSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColor.kWhite,
                          ).copyWith(
                            color: AppColor.kGrayscaleDark100,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                    ),
                    const SizedBox(height: 8),
                    PrimaryTextFormField(
                      borderRadius: BorderRadius.circular(12),
                      hintText: 'Khaledmohammed@gmail.com',
                      controller: emailC,
                      keyboardType: TextInputType.emailAddress,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'[a-zA-Z0-9@.]'),
                        ),
                      ],
                      width: double.infinity,
                      height: 52,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Password',
                      style:
                          GoogleFonts.plusJakartaSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColor.kWhite,
                          ).copyWith(
                            color: AppColor.kGrayscaleDark100,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                    ),
                    const SizedBox(height: 8),
                    PrimaryTextFormField(
                      borderRadius: BorderRadius.circular(12),
                      hintText: 'Password',
                      isPassword: true,
                      controller: passwordC,
                      keyboardType: TextInputType.number,
                      width: double.infinity,
                      height: 52,
                    ),
                  ],
                ),
                
                const SizedBox(height: 32),
                Column(
                  children: [
                    PrimaryButton(
                      elevation: 0,
                      onTap: () => slideTransition(
                        context,
                        const HomeScreen(),
                      ),
                      text: 'Create Account',
                      bgColor: Theme.of(context).primaryColor,
                      borderRadius: 20,
                      height: 46,
                      width: 327,
                      textColor: AppColor.kWhite,
                      fontSize: 14,
                    ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: CustomRichText(
                        title: 'Already have an account?',
                        subtitle: ' Login here',
                        onTab: () => Navigator.pushNamed(context, '/signin'),
                        subtitleTextStyle:
                            GoogleFonts.plusJakartaSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColor.kWhite,
                            ).copyWith(
                              color: AppColor.kPrimary,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 45),
                  child: Column(
                    children: [
                      const DividerRow(title: 'Or Sign In with'),
                      const SizedBox(height: 24),
                      SecondaryButton(
                        height: 56,
                        textColor: AppColor.kGrayscaleDark100,
                        width: 280,
                        onTap: () {},
                        borderRadius: 24,
                        bgColor: AppColor.kBackground.withOpacity(0.3),
                        text: 'Continue with Google',
                        icons: 'assets/google.png',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: TermsAndPrivacyText(
                    title1: '  By signing up you agree to our',
                    title2: ' Terms ',
                    title3: '  and',
                    title4: ' Conditions of Use',
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
