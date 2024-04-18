import 'package:epic_expolre/Views/Signin/SignUp.dart';
import 'package:flutter/material.dart';
import '../../../Widgets/app_text.dart';
import '../../../Widgets/app_text_field.dart';
import '../../../core/app_colors/app_colors.dart';
import '../../Widgets/app_button.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  bool obscurePassword = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Widget EmailTextField() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            title: "Email",
            color: AppColors.black,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(
            height: 10,
          ),
          AppTextField(
            hint: "Email",
            radius: 8,
            icon: Icons.email_outlined,
            hintFontSize: 12,
            obscureText: false,
            maxLines: 1,
            controller: emailController,
            validator: (value) {
              if (value!.isEmpty) {
                return "Email can't be empty";
              }
              final emailRegex =
                  RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
              if (!emailRegex.hasMatch(value)) {
                return "Invalid email address";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget PasswordTextField() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            title: "Password",
            color: AppColors.black,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(
            height: 10,
          ),
          AppTextField(

            hint: "Password",
            radius: 8,
            icon: Icons.lock_outline,
            hintFontSize: 12,
            suffixicon: IconButton(
              onPressed: () {
                setState(() {
                  obscurePassword = !obscurePassword;
                });
              },
              icon: Icon(
                color: AppColors.blue,
                obscurePassword ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            obscureText: obscurePassword,
            maxLines: 1,
            controller: passwordController,
          ),
        ],
      ),
    );
  }

  Widget SigininButton() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: AppButton(
        color: AppColors.blue,
        font_color: AppColors.white,
        title: "Sign in",
        onTap: () {
          final email = emailController.text;
          final password = passwordController.text;
          // Perform sign-in logic with email and password
        },
      ),
    );
  }

  Widget ForgetPassword() {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: TextButton(
        onPressed: () {},
        child: AppText(
            title: "Forget Password",
            color: AppColors.blue,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget GotoSignup() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppText(
            title: "Don’t have an Account?",
            color: AppColors.grey,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignupScreen(),));
            },
            child: AppText(
              title: "Sign Up",
              color: AppColors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(
            title: "Sign in",
            fontWeight: FontWeight.bold,
            color: AppColors.black,
            fontSize: 24),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Center(
                  child: Image.asset('assets/images/signup.png'),
                ),
                EmailTextField(),
                PasswordTextField(),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ForgetPassword(),
                SigininButton(),
              ],
            ),
            GotoSignup(),
          ],
        ),
      ),
    );
  }
}
