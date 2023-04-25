import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'buy_state.dart';

class BuyCubit extends Cubit<BuyState> {
  BuyCubit() : super(BuyInitial());
}
