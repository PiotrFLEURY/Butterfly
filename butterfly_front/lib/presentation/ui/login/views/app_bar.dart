import 'package:butterfly_front/presentation/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:look/look.dart';

@Look('loginAppBarBuilder')
class LoginAppBar extends AppBar {
  LoginAppBar({
    super.key,
  }) : super(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Butterfly',
                  style: TextStyle(
                    color: ButterflyColors.quaternary,
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    debugPrint('gear pressed');
                  },
                  icon: const Icon(
                    Icons.settings,
                    color: ButterflyColors.quinary,
                    size: 32.0,
                  ),
                )
              ],
            ),
          ),
        );
}

loginAppBarBuilder() => Scaffold(appBar: LoginAppBar());
