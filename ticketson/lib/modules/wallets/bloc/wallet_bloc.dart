import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ticketson/modules/wallets/models/wallet.dart';
import 'package:ticketson/modules/wallets/repository/wallet_repository.dart';

part 'wallet_event.dart';
part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  WalletBloc() : super(WalletsInitial()) {
    final WalletRepository walletRepository = WalletRepository();

    on<GetWallets>((event, emit) async {
      emit(WalletsLoading());
      final List<Wallet> wallets = await walletRepository.getWallets();
      if (wallets.isNotEmpty) {
        emit(WalletsLoaded(wallets));
      } else {
        emit(const WalletsError('GET Wallets Error'));
      }
    });
  }
}
