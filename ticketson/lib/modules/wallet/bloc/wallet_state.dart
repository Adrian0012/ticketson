part of 'wallet_bloc.dart';

abstract class WalletState extends Equatable {
  const WalletState();

  @override
  List<Object?> get props => [];
}

class WalletsInitial extends WalletState {}

class WalletsLoading extends WalletState {}

class WalletsError extends WalletState {
  final String errorMessage;
  const WalletsError(this.errorMessage);
}

class WalletsLoaded extends WalletState {
  final List<Wallet> wallets;
  const WalletsLoaded(this.wallets);
}
