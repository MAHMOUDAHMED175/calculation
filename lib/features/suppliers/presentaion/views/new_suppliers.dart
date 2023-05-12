import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/utils/styles.dart';
import 'package:cache_repo/core/widgets/text_from_field_widget.dart';
import 'package:cache_repo/features/suppliers/presentaion/views/widgets/new_suppliers_widgets/app_bar_New_suppliers.dart';
import 'package:cache_repo/features/suppliers/presentaion/views_models/managers/cubit/supplires_cubit.dart';
import 'package:flutter/material.dart';

class NewSuppliers extends StatelessWidget {
  NewSuppliers({Key? key}) : super(key: key);

  var nameSuppliersController = TextEditingController();
  var AddressController = TextEditingController();
  var addressPriceController = TextEditingController();
  var phoneController = TextEditingController();
  var moneyController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarNewSuppliers()),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,

          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Icon(Icons.person_add_alt_1_sharp, size: 80,
                color: ColorsApp.defualtColor,),

              //content NewProuduct for textformfield
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "الاسم بالكامل",
                      style: Styles.textStyle18,
                    ),
                    defaultFormField(
                        controller: nameSuppliersController,
                        type: TextInputType.text,
                        hintText: "محمد على عبدالله",
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Add Name';
                          }
                        }
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "العنوان",
                      style: Styles.textStyle18,
                    ),
                    defaultFormField(
                        controller: addressPriceController,
                        type: TextInputType.text,
                        hintText: "اطفيح - الجيزه",
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Add Address';
                          }
                        }
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "رقم الهاتف",
                      style: Styles.textStyle18,
                    ),
                    defaultFormField(
                        controller: phoneController,
                        type: TextInputType.number,
                        hintText: "011253....129",
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Add Phone';
                          }
                        }
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "المبلغ الباقى للمورد",
                      style: Styles.textStyle18,
                    ),
                    defaultFormField(
                        controller: moneyController,
                        type: TextInputType.number,
                        hintText: "0",
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Add Money';
                          }
                        }
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "ملاحظات",
                      style: Styles.textStyle18,
                    ),
                    Container(
                      padding: EdgeInsets.all(16.0),
                      margin: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: AddressController,
                        decoration: InputDecoration.collapsed(
                          hintStyle: TextStyle(color: Colors.grey),
                          hintText: 'ملاحظات على المورد',
                        ),
                        maxLines: 5,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  SuppliersCubit.get(context)
                                      .InsertDatabaseSuppliers(
                                      suppliersName: nameSuppliersController.text,
                                      suppliersAddress: addressPriceController.text,
                                      suppliersPhone: phoneController.text,
                                      suppliersNote: AddressController.text,
                                      money: moneyController.text,
                                  );
                                  Navigator.pop(context);

                                  // SuppliersCubit.get(context).moneyStillSuppliers(context);

                                }
                              },
                              style: TextButton.styleFrom(
                                  backgroundColor: ColorsApp.defualtColor),
                              child: Text(
                                "حفظ بيانات المورد",
                                style: Styles.textStyle18
                                    .copyWith(color: ColorsApp.whiteColor),
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
//
// //
// class NewSuppliers extends StatelessWidget {
//   String customerName = 'ahmed';
//   String customerAddress = 'alkorimate';
//   double total = 22;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Invoice'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [                  TextButton(onPressed: (){}, child: Icon(Icons.adb_sharp)),
//             TextButton(onPressed: (){}, child: Icon(Icons.adb_sharp)),
//             TextButton(onPressed: (){}, child: Icon(Icons.adb_sharp)),
//
//             Expanded(
//               child: Row(
//                 children: [
//                   Expanded(
//                       child: Text(
//                           'Customer Name : $customerName')),
//                   TextButton(onPressed: (){}, child: Icon(Icons.adb_sharp)),
//                   Expanded(
//                     child: Text(
//                         'Customer Name : $customerName'),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 10),
//             Text(
//                 'Customer ddress: $customerAddress'),
//             SizedBox(height: 10),
//             Text('Total Amount: $total'),
//             SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: () => _printInvoice(context),
//               child: Text('Princccct Invoice'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future<void> _printInvoice(BuildContext context) async {
//     final pdf = pw.Document();
//
//     pdf.addPage(
//       pw.Page(
//         pageFormat: PdfPageFormat.a6,
//         build: (pw.Context context) {
//           return pw.Center(
//             child: pw.Column(
//               mainAxisAlignment: pw.MainAxisAlignment.center,
//               children: [
//                 pw.Text('Invoice', style: pw.TextStyle(fontSize: 24)),
//                 pw.SizedBox(height: 20),
//                 pw.Text('Customer Name: $customerName'),
//                 pw.SizedBox(height: 10),
//                 pw.Text('Customer Address: $customerAddress'),
//                 pw.SizedBox(height: 10),
//                 pw.Text('Total Amount: $total'),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//     final bytes = await pdf.save();
//
//     await Printing.layoutPdf(
//       onLayout: (_) => bytes.buffer.asUint8List(),
//     );
//   }
// }
//
//




//
//
// تعريف دالة للبحث عن الطابعات المتصلة بالبلوتوث
// Future<List<BluetoothDevice>> _searchForBluetoothDevices() async {
//   // استعداد FlutterBluetoothSerial للبحث عن الأجهزة المتصلة بالبلوتوث
//   FlutterBluetoothSerial flutterBluetoothSerial = FlutterBluetoothSerial.instance;
//   List<BluetoothDevice> devices = [];
//
//   // الحصول على جميع الأجهزة المتصلة بالبلوتوث
//   List<BluetoothDevice> allDevices = await flutterBluetoothSerial.getBondedDevices();
//   devices.addAll(allDevices);
//
//   // البحث عن الأجهزة الجديدة المتصلة بالبلوتوث
//   Stream<BluetoothDiscoveryResult> stream = flutterBluetoothSerial.startDiscovery();
//   await for (BluetoothDiscoveryResult result in stream) {
//     if (!devices.contains(result.device)) {
//       devices.add(result.device);
//     }
//   }
//
//   return devices;
// }
//
// // دالة لإرسال النص المحول إلى ملف PDF إلى الطابعة
// Future<void> _printPdfToBluetoothPrinter(String printerName, Uint8List bytes) async {
//   // استعداد FlutterBluetoothSerial لإرسال الطباعة
//   FlutterBluetoothSerial flutterBluetoothSerial = FlutterBluetoothSerial.instance;
//
//   // العثور على الطابعة المطلوبة باستخدام اسمها
//   List<BluetoothDevice> devices = await _searchForBluetoothDevices();
//   BluetoothDevice printer = devices.firstWhere(
//           (device) => device.name == printerName,
//       // orElse: () => null!
//   );
//   if (printer == null) {
//     throw Exception('Printer not found!');
//   }
//
//   // الاتصال بالطابعة
//   BluetoothConnection connection = await BluetoothConnection.toAddress(printer.address);
//
//   // إرسال محتوى الملف إلى الطابعة
//   connection.output.add(bytes);
//   await connection.output.allSent;
//
//   // إنهاء الاتصال
//   await connection.close();
// }
//
// // دالة لإنشاء ملف PDF وطباعته عن طريق البلوتوث
// Future<void> _printInvoice(BuildContext context) async {
//   final pdf = pw.Document();
//
//   pdf.addPage(
//     pw.Page(
//       pageFormat: PdfPageFormat.a5,
//       build: (pw.Context context) {
//         return pw.Center(
//           child: pw.Column(
//             mainAxisAlignment: pw.MainAxisAlignment.center,
//             children: [
//               pw.Text('Invoice', style: pw.TextStyle(fontSize: 40)),
//               pw.SizedBox(height: 20),
//               pw.Text('Customer Name: $customerName'),
//               pw.SizedBox(height: 10),
//               pw.Text('Customer Address: $customerAddress'),
//               pw.SizedBox(height: 10),
//               pw.Table.fromTextArray(
//                 context: context,
//                 data: <List<String>>[
//                   <String>['Product', 'Price'],
//                   <String>['Product 1', '100'],
//                   <String>['Product 2', '50'],
//                   <String>['Product 3', '75'],
//                 ],
//               ),
//               pw.SizedBox(height: 20),
//               pw.Text('Total: $total'),
//             ],
//           ),
//         );
//       },
//     ),
//   );
//
// // تحويل الملف إلى bytes
//   final Uint8List bytes = await pdf.save();
//
// // إرسال الملف إلى الطابعة المحددة
//   await _printPdfToBluetoothPrinter('Printer Name', bytes);
// }
// }