import 'package:flutter_bloc/flutter_bloc.dart';
import 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());

  String selectedMethod = "";

  void selectMethod(String method) {
    selectedMethod = method;
    emit(PaymentMethodSelected(method));
  }

  void confirmPayment() {
    if (selectedMethod.isEmpty) {
      emit(PaymentError("Please select a payment method"));
      return;
    }

    emit(PaymentSuccess(selectedMethod));
  }
}