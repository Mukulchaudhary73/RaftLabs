import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomFormFieldWidget extends StatelessWidget {
  var hintText;
  CustomFormFieldWidget({Key? key, this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 124, 205, 116).withOpacity(.38),
        borderRadius: BorderRadius.circular(12),
      ),
      height: 50,
      child: TextFormField(
        readOnly: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.only(left: 20, top: 8),
          hintStyle: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
          hintText: hintText,
        ),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  var nameText;
  CustomText({Key? key, this.nameText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      nameText,
      style: const TextStyle(
        fontSize: 14,
        color: Colors.green,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class CustomGreetingsColumn extends StatelessWidget {
  CustomGreetingsColumn(
      {Key? key,
      this.greetingName,
      this.imageName,
      this.connectionImage,
      this.isConnected})
      : super(key: key);
  var imageName, greetingName, connectionImage, isConnected;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 100.0,
          backgroundImage: AssetImage(imageName),
          backgroundColor: Colors.transparent,
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          greetingName,
          style: TextStyle(fontSize: 22),
        ),
        const SizedBox(
          height: 30,
        ),
        !isConnected
            ? CircleAvatar(
                radius: 100.0,
                backgroundImage: AssetImage(connectionImage),
                backgroundColor: Colors.transparent,
              )
            : Container(),
        const SizedBox(
          height: 30,
        ),
        !isConnected
            ? const Text(
                "Check your internet connection",
                style: TextStyle(fontSize: 22),
              )
            : const Text(""),
      ],
    );
  }
}
