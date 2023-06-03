// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
// import 'package:otp/otp.dart';
//
// class RegisterScreen extends StatefulWidget {
//   const RegisterScreen({Key? key}) : super(key: key);
//
//   @override
//   State<RegisterScreen> createState() => _RegisterScreenState();
// }
//
// class _RegisterScreenState extends State<RegisterScreen> {
//   TextEditingController usernameController = TextEditingController();
//   TextEditingController phoneController = TextEditingController();
//   double screenHeight = 0;
//   double screenWidth = 0;
//   double bottom = 0;
//
//   int screenState = 0;
//
//   Color blue = const Color(0xff8cccff);
//   String _otpCode = '';
//   bool _isVerified = false;
//
//   void _sendOtp() {
//     String phoneNumber = '01125345129'; // رقم الهاتف الذي سترسل إليه رمز التحقق
//
//     // قم بإنشاء رمز تحقق عشوائي
//     String otpCode = OTP.generateTOTPCodeString('SEdefwdfs jkwhsd fasdf asd fasd hfCRETsdcsad_KEY', 5);
//
//     // قم بإرسال رمز التحقق عبر الرسائل القصيرة أو أي وسيلة أخرى
//
//     setState(() {
//       _otpCode = otpCode;
//     });
//   }
//
//   void _verifyOtp() {
//     String enteredOtp = '123';
//
//     // قم بالتحقق من صحة رمز التحقق المدخل
//     bool isCorrect = OTP.constantTimeVerification(_otpCode,enteredOtp);
//
//
//     if (isCorrect) {
//       setState(() {
//         _isVerified = true;
//       });
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     screenHeight = MediaQuery.of(context).size.height;
//     screenWidth = MediaQuery.of(context).size.width;
//     bottom = MediaQuery.of(context).viewInsets.bottom;
//
//     return WillPopScope(
//       onWillPop: () {
//         setState(() {
//           screenState = 0;
//         });
//         return Future.value(false);
//       },
//       child: Scaffold(
//         backgroundColor: blue,
//         body: SizedBox(
//           height: screenHeight,
//           width: screenWidth,
//           child: Stack(
//             children: [
//               Align(
//                 alignment: Alignment.topCenter,
//                 child: Padding(
//                   padding: EdgeInsets.only(top: screenHeight / 8),
//                   child: Column(
//                     children: [
//                       Text(
//                         "JOIN US",
//                         style: GoogleFonts.montserrat(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: screenWidth / 8,
//                         ),
//                       ),
//                       Text(
//                         "Create an account today!",
//                         style: GoogleFonts.montserrat(
//                           color: Colors.white,
//                           fontSize: screenWidth / 30,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: circle(5),
//               ),
//               Transform.translate(
//                 offset: const Offset(30, -30),
//                 child: Align(
//                   alignment: Alignment.centerRight,
//                   child: circle(4.5),
//                 ),
//               ),
//               Center(
//                 child: circle(3),
//               ),
//               Align(
//                 alignment: Alignment.bottomCenter,
//                 child: AnimatedContainer(
//                   height: bottom > 0 ? screenHeight : screenHeight / 2,
//                   width: screenWidth,
//                   color: Colors.white,
//                   duration: const Duration(milliseconds: 800),
//                   curve: Curves.fastLinearToSlowEaseIn,
//                   child: Padding(
//                     padding: EdgeInsets.only(
//                       left: screenWidth / 12,
//                       right: screenWidth / 12,
//                       top: bottom > 0 ? screenHeight / 12 : 0,
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         screenState == 0 ? stateRegister() : stateOTP(),
//                         GestureDetector(
//                           onTap: () {
//                             if(usernameController.text.isEmpty) {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                   content: Text("Username is still empty!"),
//                                 ),
//                               );
//                             } else if(phoneController.text.isEmpty) {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                   content: Text("Phone number is still empty!"),
//                                 ),
//                               );
//                             } else {
//                               setState(() {
//                                 screenState = 1;
//                               });
//                             }
//                           },
//                           child: Container(
//                             height: 50,
//                             width: screenWidth,
//                             margin: EdgeInsets.only(bottom: screenHeight / 12),
//                             decoration: BoxDecoration(
//                               color: blue,
//                               borderRadius: BorderRadius.circular(50),
//                             ),
//                             child: Center(
//                               child: GestureDetector(
//                                 onTap: (){
//                                   _sendOtp();
//
//                                 },
//                                 child: Text(
//                                   "CONTINUE",
//                                   style: GoogleFonts.montserrat(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold,
//                                     letterSpacing: 1.5,
//                                     fontSize: 18,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget stateRegister() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "Username",
//           style: GoogleFonts.montserrat(
//             color: Colors.black87,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         const SizedBox(height: 8,),
//         TextFormField(
//           controller: usernameController,
//           decoration: InputDecoration(
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(16),
//             ),
//             contentPadding: const EdgeInsets.symmetric(
//               horizontal: 16,
//             ),
//           ),
//         ),
//         const SizedBox(height: 16,),
//         Text(
//           "Phone number",
//           style: GoogleFonts.montserrat(
//             color: Colors.black87,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         IntlPhoneField(
//           controller: phoneController,
//           showCountryFlag: false,
//           showDropdownIcon: false,
//           decoration: InputDecoration(
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(16),
//             ),
//             contentPadding: const EdgeInsets.symmetric(
//               horizontal: 16,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget stateOTP() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         RichText(
//           textAlign: TextAlign.center,
//           text: TextSpan(
//             children: [
//               TextSpan(
//                 text: "We just sent a code to ",
//                 style: GoogleFonts.montserrat(
//                   color: Colors.black87,
//                   fontSize: 18,
//                 ),
//               ),
//               TextSpan(
//                 text: phoneController.text,
//                 style: GoogleFonts.montserrat(
//                   color: Colors.black87,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18,
//                 ),
//               ),
//               TextSpan(
//                 text: "\nEnter the code here and we can continue!",
//                 style: GoogleFonts.montserrat(
//                   color: Colors.black87,
//                   fontSize: 12,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(height: 20,),
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: screenWidth / 12),
//           child: PinCodeTextField(
//             appContext: context,
//             length: 4,
//             onChanged: (value) {
//
//             },
//             pinTheme: PinTheme(
//               activeColor:  blue,
//               selectedColor:Colors.red,
//               inactiveColor: Colors.red,
//             ),
//           ),
//         ),
//         const SizedBox(height: 20,),
//         RichText(
//           text: TextSpan(
//             children: [
//               TextSpan(
//                 text: "Didn't receive the code? ",
//                 style: GoogleFonts.montserrat(
//                   color: Colors.black87,
//                   fontSize: 12,
//                 ),
//               ),
//               WidgetSpan(
//                 child: GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       screenState = 0;
//                     });
//                   },
//                   child: Text(
//                     "Resend",
//                     style: GoogleFonts.montserrat(
//                       color: Colors.black87,
//                       fontSize: 12,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget circle(double size) {
//     return Container(
//       height: screenHeight / size,
//       width: screenHeight / size,
//       decoration: const BoxDecoration(
//         shape: BoxShape.circle,
//         color: Colors.white,
//       ),
//     );
//   }
// }
//
// ///
//
// ///
//
// ///
