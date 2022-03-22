import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

class OTPScreen extends StatefulWidget {
  final String phone;
  const OTPScreen({required this.phone, Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final List images = [
    "https://ouch-cdn2.icons8.com/R1SUR5BD6JUGreEgxYBUBw0LBJKzHeM6VTYmtfmoQRY/rs:fit:256:218/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvMzAv/MzA3NzBlMGUtZTgx/YS00MTZkLWI0ZTYt/NDU1MWEzNjk4MTlh/LnN2Zw.png",
    "https://ouch-cdn2.icons8.com/jUVsvGx8nL0aKho6aX4TezGZa23zFoFBa9-TszvXULs/rs:fit:256:256/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvNzkw/Lzg2NDVlNDllLTcx/ZDItNDM1NC04YjM5/LWI0MjZkZWI4M2Zk/MS5zdmc.png",
    "https://ouch-cdn2.icons8.com/Vi8Baseh8toX5zlLptHjk5grvmTWdY-3pYT4HifsmJc/rs:fit:256:256/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvODA3/LzlkYjc1NmZlLTgz/MTctNDAzZC04NTNj/LThmZjRkNDAyZDc3/NS5zdmc.png",
  ];
  bool _onEditing = true;
  bool onCompleted = false;
  bool isLogeing = false;
  bool isCheck = false;
  int selectImage = 0;
  late Timer timer;
  final changeImage = Stream.periodic(const Duration(seconds: 5), (index) {
    debugPrint("$index");
  });
  late StreamSubscription changeImageListen;
  @override
  void initState() {
    changeImageListen = changeImage.listen((event) {
      setState(() {
        ++selectImage;
      });
      if (selectImage == images.length) {
        selectImage = 0;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    changeImageListen.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              children: [
                const SizedBox(height: 40),
                SizedBox(
                  height: size.height * 0.4,
                  child: Stack(children: [
                    for (var i = 0; i < images.length; ++i)
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: AnimatedOpacity(
                          duration: const Duration(seconds: 1),
                          opacity: selectImage == i ? 1 : 0,
                          child: Image.network(
                            images[selectImage],
                          ),
                        ),
                      ),
                  ]),
                ),
                const SizedBox(height: 50),
                const Text(
                  "Verification",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                const SizedBox(height: 20),
                Text(
                  "Please enter the 4 digit code sent to ${widget.phone}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 30),
                VerificationCode(
                  autofocus: true,
                  textStyle:
                      const TextStyle(fontSize: 20.0, color: Colors.black),
                  keyboardType: TextInputType.number,
                  underlineColor: Colors.grey[900],
                  length: 6,
                  cursorColor: Colors.black,
                  onCompleted: (String value) {
                    setState(() {
                      onCompleted = true;
                    });
                  },
                  digitsOnly: true,
                  onEditing: (bool value) {
                    setState(() {
                      _onEditing = value;
                    });
                    if (!_onEditing) FocusScope.of(context).unfocus();
                  },
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't resive the OTP? ",
                      style: TextStyle(color: Colors.grey[600], fontSize: 18),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Text(
                        "Resend",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                GestureDetector(
                  onTap: () {
                    if (onCompleted) {
                      setState(() {
                        isLogeing = !isLogeing;
                      });
                      timer = Timer(const Duration(seconds: 3), () {
                        setState(() {
                          isLogeing = !isLogeing;
                          isCheck = !isCheck;
                        });
                      });
                    }
                  },
                  child: Container(
                    height: 50,
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                        child: isLogeing
                            ? const CircularProgressIndicator(
                                color: Colors.white)
                            : (isCheck
                                ? const Icon(
                                    Icons.check_circle_rounded,
                                    color: Colors.white,
                                  )
                                : const Text(
                                    "Verify",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ))),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  ListView newMethod(Size size) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: images.length,
      itemBuilder: (context, index) => AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        opacity: selectImage == index ? 1 : 0,
        child: Column(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image.network(
                images[0],
                fit: BoxFit.cover,
                height: size.height * 0.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
