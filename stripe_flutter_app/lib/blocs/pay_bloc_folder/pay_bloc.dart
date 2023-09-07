import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../models/custom_credit_card.dart';

part 'pay_event.dart';
part 'pay_state.dart';

class PayBloc extends Bloc<PayEvent, PayState> {
  PayBloc() : super(const PayState(creditCard: null)) {
    on<PayEvent>(
      (event, emit) {
        if (event is OnSelectCard) {
          emit(state.copyWith(isActive: true, creditCard: event.card));
        } else if (event is OnUnSelectCard) {
          emit(state.copyWith(isActive: false));
        }
      },
    );
  }
}
