// import 'package:flutter/material.dart';
// import 'package:whatsapp_clone/routes.dart';
// import 'package:whatsapp_clone/ui/color.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController _phoneNumberController = TextEditingController();
//   // final TextEditingController _passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 24.0),
//         color: AppColors.backgroundPrimary,
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextField(
//                 controller: _phoneNumberController,
//                 cursorColor: AppColors.textPrimary,
//                 decoration: InputDecoration(
//                   hintText: 'Phone Number',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30),
//                     borderSide: BorderSide.none,
//                   ),
//                   contentPadding: EdgeInsets.symmetric(horizontal: 20),
//                   filled: true,
//                   fillColor: AppColors.backgroundSecondary,
//                   hintStyle: const TextStyle(color: AppColors.textSecondary),
//                 ),
//                 style: const TextStyle(color: AppColors.textPrimary),
//                 keyboardType: TextInputType.phone,
//               ),
//               const SizedBox(height: 16),

//               // TextField(
//               //   controller: _passwordController,
//               //   cursorColor: AppColors.textPrimary,
//               //   obscureText: true,
//               //   decoration: InputDecoration(
//               //     hintText: 'Password',
//               //     border: OutlineInputBorder(
//               //       borderRadius: BorderRadius.circular(30),
//               //       borderSide: BorderSide.none,
//               //     ),
//               //     filled: true,
//               //     fillColor: AppColors.backgroundSecondary,
//               //     hintStyle: const TextStyle(color: AppColors.textSecondary),
//               //   ),
//               //   style: const TextStyle(color: AppColors.textPrimary),
//               // ),
//               // const SizedBox(height: 24),

//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, AppRoutes.home);
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: AppColors.textHighlighted,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 80),
//                 ),
//                 child: const Text(
//                   'Login',
//                   style: TextStyle(color: AppColors.black, fontSize: 18),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whatsapp_clone/db/db_helper.dart';
import 'package:whatsapp_clone/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  String _verificationId = '';
  String? _errorMessage;

  Future<void> _verifyPhoneNumber() async {
    setState(() {
      _errorMessage = '';
    });
    await _auth.verifyPhoneNumber(
      phoneNumber: _phoneController.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
        print("Phone number automatically verified and user signed in.");
      },
      verificationFailed: (FirebaseAuthException e) {
        setState(() {
          _errorMessage = "Failed to verify phone number: ${e.message}";
        });
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          _verificationId = verificationId;
        });
        setState(() {
          _errorMessage = "Verification code sent.";
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        setState(() {
          _verificationId = verificationId;
        });
      },
    );
  }

  Future<void> _signInWithPhoneNumber() async {
    setState(() {
      _errorMessage = null; // Reset error message
    });

    try {
      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: _codeController.text,
      );

      await _auth.signInWithCredential(credential);
      await DatabaseHelper.instance.insertUser();
      _goToHomePage();
    } on FirebaseAuthException catch (e) {
      setState(() {
        _errorMessage = "Verification failed: ${e.message}";
      });
    }
  }

  void _goToHomePage() {
    Navigator.pushNamed(context, AppRoutes.home);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Phone Auth")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(labelText: "Phone Number"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _verifyPhoneNumber,
              child: const Text("Verify Number"),
            ),
            TextField(
              controller: _codeController,
              decoration: const InputDecoration(labelText: "Verification Code"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _signInWithPhoneNumber,
              child: const Text("Sign in"),
            ),
            if (_errorMessage != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  _errorMessage!,
                  style: TextStyle(color: Colors.red),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

