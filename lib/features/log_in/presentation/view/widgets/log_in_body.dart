import 'package:enr_tickets/core/utils/strings.dart';
import 'package:enr_tickets/core/utils/widget/assets.dart';
import 'package:flutter/material.dart';

class LogInBody extends StatelessWidget {
  const LogInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Image.asset(AssetsData.logo)),
        Text(
          headlogIn,
          style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
