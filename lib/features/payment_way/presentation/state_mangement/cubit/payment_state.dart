abstract class PaymentState {}

class PaymentInitial extends PaymentState {}

class PaymentMethodSelected extends PaymentState {
  final String method;
  PaymentMethodSelected(this.method);
}

class PaymentError extends PaymentState {
  final String message;
  PaymentError(this.message);
}

class PaymentSuccess extends PaymentState {
  final String method;
  PaymentSuccess(this.method);
}