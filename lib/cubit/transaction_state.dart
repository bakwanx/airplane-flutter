part of 'transaction_cubit.dart';

@immutable
abstract class TransactionState {}

class TransactionInitial extends TransactionState {}

class TransactionLoading extends TransactionState {}

class TransactionSuccess extends TransactionState {
  final List<TransactionModel> transactionModels;
  TransactionSuccess(this.transactionModels);

  @override
  // TODO: implement props
  List<Object?> get props => [transactionModels];
}

class TransactionFailed extends TransactionState {

  final String error;
  TransactionFailed(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
