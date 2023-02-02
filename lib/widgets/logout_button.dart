import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getinfinitybox/providers/login_provider.dart';

import 'package:getinfinitybox/screens/login_screen.dart';
import 'package:getinfinitybox/utils/colors.dart';

class LogoutButton extends ConsumerWidget {
  const LogoutButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () {
        ref.read(loginProvider.notifier).logout();
        Navigator.pushReplacementNamed(context, LoginScreen.route);
      },
      icon: const Icon(
        Icons.logout,
        color: AppColors.pureBlackColor,
      ),
    );
  }
}
