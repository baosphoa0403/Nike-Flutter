// import 'package:flutter/material.dart';
// import 'package:nike_project/common/Button/elevated_button_custom.dart';

// class SignUpPage extends StatelessWidget {
//   const SignUpPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         height: MediaQuery.of(context).size.height,
//         padding: const EdgeInsets.all(40),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             const SizedBox(
//               height: 10,
//             ),
//             TextButton(
//               style: ButtonStyle(
//                   backgroundColor:
//                       MaterialStateProperty.all<Color>(Colors.blue[50]!),
//                   shape: MaterialStateProperty.all<OutlinedBorder>(
//                       const CircleBorder()),
//                   fixedSize:
//                       MaterialStateProperty.all<Size>(const Size(50, 50))),
//               child: const Icon(
//                 Icons.arrow_back,
//                 color: Colors.blue,
//               ),
//               onPressed: () {},
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: <Widget>[
//                 Lottie.asset(
//                   "assets/71361-sign-in.json",
//                   width: MediaQuery.of(context).size.width * 0.5,
//                 ),
//                 const Text(
//                   "Sign In\nAccount",
//                   style: TextStyle(
//                     fontSize: 32,
//                     fontWeight: FontWeight.bold,
//                     // backgroundColor: Colors.red,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 50,
//             ),
//             TextField(
//               decoration: InputDecoration(
//                 suffixIcon: const Icon(Icons.email),
//                 filled: true,
//                 fillColor: Colors.blue[50],
//                 hintText: "Email",
//                 contentPadding: const EdgeInsets.all(20),
//                 labelText: "Email",
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//               ),
//               autocorrect: false, // gợi ý
//               keyboardType: TextInputType.emailAddress, // have email
//               textInputAction: TextInputAction.next,
//             ),
//             const SizedBox(
//               height: 50,
//             ),
//             TextField(
//               decoration: InputDecoration(
//                 suffixIcon: const Icon(Icons.password_outlined),
//                 contentPadding: const EdgeInsets.all(20),
//                 filled: true,
//                 fillColor: Colors.blue[50],
//                 labelText: "Password",
//                 hintText: "Password",
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//               ),
//               obscureText: true,
//               textInputAction: TextInputAction.done,
//             ),
//             const SizedBox(
//               height: 40,
//             ),
//             ElevatedButtonCustom(
//               width: MediaQuery.of(context).size.width,
//               borderRadius: 10,
//               child: const Text("Login In"),
//               color: Colors.blueAccent.shade400,
//               height: MediaQuery.of(context).size.height * 0.06,
//               onPressed: () {},
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             SocialSignInButton(
//               width: MediaQuery.of(context).size.height * 0.6,
//               text: "Sign In With Google",
//               color: Colors.white,
//               textColor: Colors.black,
//               onPressed: () {},
//               borderRadius: 10.0,
//               height: MediaQuery.of(context).size.height * 0.06,
//               assertName: 'assets/google-48.png',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
