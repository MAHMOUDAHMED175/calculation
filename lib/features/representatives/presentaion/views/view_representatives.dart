import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/utils/styles.dart';
import 'package:cache_repo/core/widgets/divider.dart';
import 'package:cache_repo/core/widgets/text_from_field_widget.dart';
import 'package:cache_repo/features/representatives/presentaion/views/widgets/view_representatives_widgets/ViewRepresentativesItem.dart';
import 'package:cache_repo/features/representatives/presentaion/views/widgets/view_representatives_widgets/app_bar_view_representative_widget.dart';
import 'package:cache_repo/features/representatives/presentaion/views_models/managers/representatives_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/view_representatives_widgets/header_view_representatives.dart';

class ViewRepresentatives extends StatelessWidget {
  var searchController = TextEditingController();

//2
  //222
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RepresentativesCubit, RepresentativesState>(
  listener: (context, state) {
  },
  builder: (context, state) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarViewRepresentatives()),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                children: [
                  Expanded(
                    child: defaultFormField(
                        controller: searchController,
                        prefix: Icons.search,
                        type: TextInputType.text,
                        hintText: 'ابحث عن اسم الكاشير',
                      submit: (value){
                        RepresentativesCubit.get(context).searchRepresentativesView(text: value!);

                      },
                      change: (value){

                        RepresentativesCubit.get(context).searchRepresentativesView(text: value!);
                      }

                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            headerViewRepresentatives(context),
            Expanded(
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index)=> ViewRepresentativesItem(
                  index: index,
                  represent: RepresentativesCubit.get(context).searchRepresentativeNameView.isEmpty
                      ? RepresentativesCubit.get(context).represent[index]
                    :RepresentativesCubit.get(context).searchRepresentativeNameView[index],
                ),
                separatorBuilder: (context, index) => myDivider(),
                itemCount:  RepresentativesCubit.get(context).searchRepresentativeNameView.isEmpty
                    ? RepresentativesCubit.get(context).represent.length
                    :RepresentativesCubit.get(context).searchRepresentativeNameView.length,
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
