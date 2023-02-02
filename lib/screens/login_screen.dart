import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getinfinitybox/providers/login_provider.dart';
import 'package:getinfinitybox/screens/product_list_screen.dart';
import 'package:getinfinitybox/utils/colors.dart';
import 'package:getinfinitybox/utils/helper_widgets.dart';
import 'package:getinfinitybox/utils/text_styles.dart';
import 'package:getinfinitybox/utils/extensions.dart';

class LoginScreen extends ConsumerWidget {
  static const String route = 'login_screen';
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.r),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: ListView(
              children: [
                addVerticalSpace(50.h),
                Image.asset(
                  "assets/logo.png",
                  alignment: Alignment.center,
                  height: 70.h,
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                addVerticalSpace(30.h),
                TextFormField(
                  controller: usernameController,
                  validator: (value) {
                    if (value!.isValidUserName) {
                      return "Username too short";
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'User Name',
                  ),
                ),
                addVerticalSpace(30.h),
                TextFormField(
                  obscureText: true,
                  controller: passwordController,
                  validator: (value) {
                    if (value!.isValidPassword) {
                      return "Password must be atleast 6 characters";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Password',
                  ),
                ),
                addVerticalSpace(30.h),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(MediaQuery.of(context).size.width, 60),
                    backgroundColor: AppColors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () async {
                    final isValid = _formKey.currentState!.validate();
                    if (!isValid) {
                      return;
                    }
                    _formKey.currentState!.save();

                    bool res = await ref.read(loginProvider.notifier).login(
                          username: usernameController.text.trim(),
                          password: passwordController.text.trim(),
                        );

                    if (res) {
                      // ignore: use_build_context_synchronously
                      Navigator.pushReplacementNamed(
                          context, ProductsListScreen.route);
                    }
                  },
                  child: Text(
                    'Login',
                    style: AppTextStyles.dmSans.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
