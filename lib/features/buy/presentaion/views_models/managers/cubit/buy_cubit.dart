import 'package:cache_repo/features/store/presentaion/views_models/managers/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'buy_state.dart';

class BuyCubit extends Cubit<BuyState> {
  BuyCubit() : super(BuyInitial());

  static BuyCubit get(context) => BlocProvider.of(context);

  List searchBuyProductItem = [];

  void searchBuyProduct({required String text}) {
    searchBuyProductItem = buyProduct
        .where((element) => element['productName'].contains(text.toLowerCase()))
        .toList();
    emit(searchProductSellState());
  }

  ///buyProduct
  List<Map> buyProduct = [];

  void addProductToBuy(int index, context) {
    if (buyProduct.isEmpty) {
      buyProduct.add(StoreCubit.get(context).product[index]);
    } else if (!buyProduct.contains(StoreCubit.get(context).product[index])) {
      buyProduct.add(StoreCubit.get(context).product[index]);
    }
    emit(addProductToBuyState());
    Navigator.pop(context);
  }

  ///buyProduct

  //لاجمالى
  var countallPriceBuyFloatingActionButton = 0.0;

  //الضريبه 0.14
  double DarebaResult = 0.0;

  //الاجمالى بعد الضريبه
  double afterCalculateDarebaResult = 0.0;

  Set<String> addedProducts = {};

  ///deleteItemBuyProduct
  void deleteItemBuyProduct(String itemId) {
    for (int i = 0; i < buyProduct.length; i++) {
      if (buyProduct[i]['productName'] == itemId) {
        String productName = buyProduct[i]['productName'];
        int productCount = int.parse(buyProduct[i]['productCount']);
        int productBuy = int.parse(buyProduct[i]['productBuy']);
        buyProduct.removeAt(i);
        emit(deleteItemBuyProductState());

        if (countallPriceBuyFloatingActionButton > 0) {
          countallPriceBuyFloatingActionButton -= productCount *
              productBuy; // تحديث قيمة المتغير countallPriceBuyFloatingActionButton
        }

        if (DarebaResult > 0) {
          DarebaResult -= countallPriceBuyFloatingActionButton * 0.14;
          if (countallPriceBuyFloatingActionButton == 0) {
            DarebaResult = 0;
          }
        }

        if (afterCalculateDarebaResult > 0) {
          afterCalculateDarebaResult -=
              countallPriceBuyFloatingActionButton + DarebaResult;
          if (DarebaResult == 0) {
            afterCalculateDarebaResult = 0;
          }
        }

        addedProducts.remove(productName); // حذف اسم المنتج من الـ Set
        emit(deleteItemBuyProductState());

        break;
      }
    }
    for (int i = 0; i < searchBuyProductItem.length; i++) {
      if (searchBuyProductItem[i]['productName'] == itemId) {
        String productName = searchBuyProductItem[i]['productName'];
        int productCount = int.parse(searchBuyProductItem[i]['productCount']);
        int productBuy = int.parse(searchBuyProductItem[i]['productBuy']);
        searchBuyProductItem.removeAt(i);

        if (countallPriceBuyFloatingActionButton > 0) {
          countallPriceBuyFloatingActionButton -= productCount *
              productBuy; // تحديث قيمة المتغير countallPriceBuyFloatingActionButton
        }

        if (DarebaResult > 0) {
          DarebaResult -= countallPriceBuyFloatingActionButton * 0.14;
          if (countallPriceBuyFloatingActionButton == 0) {
            DarebaResult = 0;
          }
        }

        if (afterCalculateDarebaResult > 0) {
          afterCalculateDarebaResult -=
              countallPriceBuyFloatingActionButton + DarebaResult;
          if (DarebaResult == 0) {
            afterCalculateDarebaResult = 0;
          }
        }

        addedProducts.remove(productName); // حذف اسم المنتج من الـ Set
        // emit(deleteItemBuyProductState());
        break;
      }
    }
    // Dareba = countallPriceBuyFloatingActionButton * 0.14;
  }

  ///deleteItemBuyProduct

  void allPriceBuyFloatingActionButton() {
    for (int i = 0; i < buyProduct.length; i++) {
      String productName = buyProduct[i]['productName'];
      if (!addedProducts.contains(productName)) {
        // Check if product has already been added
        countallPriceBuyFloatingActionButton +=
            int.parse(buyProduct[i]['productCount']) *
                int.parse(buyProduct[i]['productBuy']);
        addedProducts.add(productName);

        double Dareba =
            (countallPriceBuyFloatingActionButton.toDouble()) * 0.14;
        int roundedNumberDareba =
            (Dareba * 10).round(); // تقريب القيمة لأقرب عشرة
        DarebaResult = roundedNumberDareba / 10;

        // تحويل القيمة إلى عدد عشري مرة أخرى

        double afterCalculateDareba =
            ((countallPriceBuyFloatingActionButton) + DarebaResult);
        int roundedNumber =
            (afterCalculateDareba * 10).round(); // تقريب القيمة لأقرب عشرة
        afterCalculateDarebaResult = roundedNumber / 10;
        // Add product name to set
      }
    }
    for (int i = 0; i < searchBuyProductItem.length; i++) {
      String productName = searchBuyProductItem[i]['productName'];
      if (!addedProducts.contains(productName)) {
        // Check if product has already been added
        countallPriceBuyFloatingActionButton +=
            int.parse(searchBuyProductItem[i]['productCount']) *
                int.parse(searchBuyProductItem[i]['productBuy']);
        addedProducts.add(productName);

        double Dareba =
            (countallPriceBuyFloatingActionButton.toDouble()) * 0.14;
        int roundedNumberDareba =
            (Dareba * 10).round(); // تقريب القيمة لأقرب عشرة
        DarebaResult = roundedNumberDareba / 10;

        // تحويل القيمة إلى عدد عشري مرة أخرى

        double afterCalculateDareba =
            ((countallPriceBuyFloatingActionButton) + DarebaResult);
        int roundedNumber =
            (afterCalculateDareba * 10).round(); // تقريب القيمة لأقرب عشرة
        afterCalculateDarebaResult = roundedNumber / 10;

        emit(addProductFloatingActionButton2());

        // Add product name to set
      }
    }
  }

  ///addProductFloatingActionButton

  ///paymentFloatingActiomButton
  double buyRemainingPayment = 0.0;

  void buyRemainingPaymentFloatingActionButton(String paymented) {
    for (int i = 0; i < buyProduct.length; i++) {
      buyRemainingPayment = (countallPriceBuyFloatingActionButton.toDouble() -
          double.parse(paymented));
    }
    if (buyRemainingPayment <= 0) {
      buyRemainingPayment = 0;
      print(buyRemainingPayment);
    }
    emit(buyRemainingPaymentFloatingActionButtonState());
  }

  ///paymentFloatingActiomButton
}
