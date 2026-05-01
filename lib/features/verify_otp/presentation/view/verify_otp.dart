import 'package:dio/dio.dart';
import 'package:enr_tickets/features/verify_otp/presentation/view/widgets/verify_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:enr_tickets/features/verify_otp/presentation/state_mangement/cubit/cubit_verify_cubit.dart';
import 'package:enr_tickets/features/verify_otp/data/repo/verify_repo_implement.dart';
import 'package:enr_tickets/core/services/api/api_service.dart';

class VerifyOtp extends StatelessWidget {
  final String email;
  const VerifyOtp({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CubitVerifyCubit(
        VerifyRepoImplement(ApiService(Dio())),
      ),
      child: Scaffold(
        body: VerifyBody(email: email,),
      ),
    );
  }
}