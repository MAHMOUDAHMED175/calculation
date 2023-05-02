import 'package:cache_repo/features/store/presentaion/views_models/managers/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'sell_state.dart';

class SellCubit extends Cubit<SellState> {
  SellCubit() : super(SellInitial());

  static SellCubit get(context) => BlocProvider.of(context);

  ///sellProduct
  List<Map> sellProduct = [];

  void addProductToSell(int index, context) {
    if (sellProduct.isEmpty) {
      sellProduct.add(StoreCubit.get(context).product[index]);
    } else if (!sellProduct.contains(StoreCubit.get(context).product[index])) {
      sellProduct.add(StoreCubit.get(context).product[index]);
    }
    Navigator.pop(context);
    emit(addProductToSellState());
  }

  ///sellProduct

  List searchSellProductItem = [];

  void searchSellProduct({required String text}) {
    searchSellProductItem = sellProduct
        .where((element) => element['productName'].contains(text.toLowerCase()))
        .toList();
    emit(searchProductState());
  }

  ///searchProduct

  //الضريبه 0.14
  double DarebaResult = 0.0;

  //الاجمالى بعد الضريبه
  double afterCalculateDarebaResult = 0.0;

  ///deleteItemSellProduct
  void deleteItemSellProduct(String itemId) {
    for (int i = 0; i < sellProduct.length; i++) {
      if (sellProduct[i]['productName'] == itemId) {
        String productName = sellProduct[i]['productName'];
        int productCount = int.parse(sellProduct[i]['productCount']);
        int productSell = int.parse(sellProduct[i]['productSell']);
        sellProduct.removeAt(i);
        if (countallPriceSellFloatingActionButton > 0) {
          countallPriceSellFloatingActionButton -= productCount *
              productSell; // تحديث قيمة المتغير countallPriceSellFloatingActionButton
        }
        addedProducts.remove(productName); // حذف اسم المنتج من الـ Set

        if (DarebaResult > 0) {
          DarebaResult -= countallPriceSellFloatingActionButton * 0.14;
          if (countallPriceSellFloatingActionButton == 0) {
            DarebaResult = 0;
          }
        }

        if (afterCalculateDarebaResult > 0) {
          afterCalculateDarebaResult -=
              countallPriceSellFloatingActionButton + DarebaResult;
          if (DarebaResult == 0) {
            afterCalculateDarebaResult = 0;
          }
        }

        emit(deleteItemSellProductState());

        break;
      }
    }
    for (int i = 0; i < searchSellProductItem.length; i++) {
      if (searchSellProductItem[i]['productName'] == itemId) {
        String productName = searchSellProductItem[i]['productName'];
        int productCount = int.parse(searchSellProductItem[i]['productCount']);
        int productSell = int.parse(searchSellProductItem[i]['productSell']);
        searchSellProductItem.removeAt(i);
        if (countallPriceSellFloatingActionButton > 0) {
          countallPriceSellFloatingActionButton -= productCount *
              productSell; // تحديث قيمة المتغير countallPriceSellFloatingActionButton
        }
        addedProducts.remove(productName);

        if (DarebaResult > 0) {
          DarebaResult -= countallPriceSellFloatingActionButton * 0.14;
          if (countallPriceSellFloatingActionButton == 0) {
            DarebaResult = 0;
          }
        }

        if (afterCalculateDarebaResult > 0) {
          afterCalculateDarebaResult -=
              countallPriceSellFloatingActionButton + DarebaResult;
          if (DarebaResult == 0) {
            afterCalculateDarebaResult = 0;
          }
        } // حذف اسم المنتج من الـ Set
        emit(deleteItemSellProductState());
        break;
      }
    }
  }

  ///deleteItemSellProduct

  ///addProductFloatingActionButton
  int countallPriceSellFloatingActionButton = 0;
  Set<String> addedProducts = {}; // Set to keep track of added product names
  void allPriceSellFloatingActionButton() {
    for (int i = 0; i < sellProduct.length; i++) {
      String productName = sellProduct[i]['productName'];
      if (!addedProducts.contains(productName)) {
        // Check if product has already been added
        countallPriceSellFloatingActionButton +=
            int.parse(sellProduct[i]['productCount']) *
                int.parse(sellProduct[i]['productSell']);
        addedProducts.add(productName);

        double Dareba =
            (countallPriceSellFloatingActionButton.toDouble()) * 0.14;
        int roundedNumberDareba =
            (Dareba * 10).round(); // تقريب القيمة لأقرب عشرة
        DarebaResult = roundedNumberDareba / 10;

        // تحويل القيمة إلى عدد عشري مرة أخرى

        double afterCalculateDareba =
            ((countallPriceSellFloatingActionButton) + DarebaResult);
        int roundedNumber =
            (afterCalculateDareba * 10).round(); // تقريب القيمة لأقرب عشرة
        afterCalculateDarebaResult = roundedNumber / 10;
        emit(addProductFloatingActionButton());
        // Add product name to set
      }
    }
    for (int i = 0; i < searchSellProductItem.length; i++) {
      String productName = searchSellProductItem[i]['productName'];
      if (!addedProducts.contains(productName)) {
        // Check if product has already been added
        countallPriceSellFloatingActionButton +=
            int.parse(searchSellProductItem[i]['productCount']) *
                int.parse(searchSellProductItem[i]['productSell']);
        addedProducts.add(productName);

        double Dareba =
            (countallPriceSellFloatingActionButton.toDouble()) * 0.14;
        int roundedNumberDareba =
            (Dareba * 10).round(); // تقريب القيمة لأقرب عشرة
        DarebaResult = roundedNumberDareba / 10;

        // تحويل القيمة إلى عدد عشري مرة أخرى

        double afterCalculateDareba =
            ((countallPriceSellFloatingActionButton) + DarebaResult);
        int roundedNumber =
            (afterCalculateDareba * 10).round(); // تقريب القيمة لأقرب عشرة
        afterCalculateDarebaResult = roundedNumber / 10;
        emit(addProductFloatingActionButton());
        emit(addProductFloatingActionButton2());

        // Add product name to set
      }
    }
    print(countallPriceSellFloatingActionButton);
  }

  ///addProductFloatingActionButton

  ///paymentFloatingActiomButton
  int remainingPayment = 0;

  void remainingPaymentFloatingActionButton(String paymented) {
    for (int i = 0; i < sellProduct.length; i++) {
      remainingPayment =
          (afterCalculateDarebaResult.toInt() - int.parse(paymented));
    }
    if (remainingPayment <= 0) {
      remainingPayment = 0;
      print(remainingPayment);
    }
    emit(remainingPaymentFloatingActionButtonState());
  }

  ///paymentFloatingActiomButton
}
