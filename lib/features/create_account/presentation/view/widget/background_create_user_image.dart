import 'package:enr_tickets/core/utils/widget/assets.dart';
import 'package:enr_tickets/features/create_account/presentation/view/widget/create_account_body.dart';
import 'package:flutter/material.dart';

class BackgroundCreateUserImage extends StatelessWidget {
  const BackgroundCreateUserImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(AssetsData.backgroundimage, fit: BoxFit.cover),
        ),
        CreateAccountBody(),
      ],
    );
  }
}
