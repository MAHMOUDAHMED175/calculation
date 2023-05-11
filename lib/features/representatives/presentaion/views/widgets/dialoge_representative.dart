import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../views_models/managers/representatives_cubit.dart';

class DialogeRepresentatives extends StatefulWidget {
  @override
  _DialogeRepresentativesState createState() => _DialogeRepresentativesState();
}

class _DialogeRepresentativesState extends State<DialogeRepresentatives> {
  late List<Map> listRepresentName;
  late String representName;

  @override
  void initState() {
    super.initState();
    listRepresentName = RepresentativesCubit.get(context).represent;
    representName = listRepresentName[0]['representName'];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //qr code
            Text(
              "حذف",
              style: Styles.textStyle30,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "رجاء اختيار اسم مندوب لحذفه",
              style: Styles.textStyle16,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(
                  color: Colors.white,
                  width: 1,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: DropdownButton(
                    value: representName,
                    items: listRepresentName.map((option2) {
                      return DropdownMenuItem(
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text("${option2['representName']}")),
                        value: option2['representName'],
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        representName = value.toString();
                      });
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: CustomButton(
                        backgroundColor: ColorsApp.defualtColor,
                        textColor: Colors.white,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        text: 'الغاء'),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: CustomButton(
                    backgroundColor: Colors.red,
                    textColor: ColorsApp.whiteColor,
                    text: 'حذف',
                    onPressed: () {
                      RepresentativesCubit.get(context)
                          .DeleteDataRepresent(repName: representName);
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
