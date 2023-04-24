import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/widgets/custom_button.dart';
import 'package:cache_repo/features/store/presentaion/views_models/managers/cubit/cubit.dart';
import 'package:cache_repo/features/store/presentaion/views_models/managers/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class gridSell extends StatelessWidget {
  const gridSell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreCubit, StoreStates>(
        builder: (BuildContext context, state) {
      return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          var product=StoreCubit.get(context).product;
          double screenHeight = MediaQuery.of(context).size.height;
          return SizedBox(
            height: screenHeight * 0.8,
            width: double.infinity, // اجعل الارتفاع يساوي نصف ارتفاع الشاشة
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 2.0,
                mainAxisSpacing: 4.0,
                childAspectRatio: .6,
              ),
              itemBuilder: (context, index) => gridItem(product:product[index],index:index),
              itemCount:StoreCubit.get(context).product.length,



            ),
          );
        },
      );
    });
  }
}

class gridItem extends StatelessWidget {
   gridItem({Key? key,required this.product,required this.index}) : super(key: key);

  Map product;
  int index;
  @override
  Widget build(BuildContext context) {
        return LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1, color: Colors.black),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Image(
                        image: AssetImage('assets/images/money.jpg'),
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          product['productName'],
                          textAlign: TextAlign.center,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.all(4.0),
                        child: CustomButton(
                          onPressed: (){

                            StoreCubit.get(context).addProductToSell(index,context);
                            StoreCubit.get(context).allPriceSellFloatingActionButton();
                          },
                          backgroundColor: ColorsApp.defualtColor,
                          textColor: Colors.white,
                          text: 'اضافه',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
  }
}
