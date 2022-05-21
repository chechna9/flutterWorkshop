import 'package:flutter/material.dart';
import 'package:simple_app/constants.dart';

class ContactDetaille extends StatelessWidget {
  final String? name;
  final String phoneNumber;

  const ContactDetaille({
    Key? key,
    required this.name,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey2,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: grey1,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
          ),
        ),
      ),
      body: Column(
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage("assets/pict2.jpg"),
            radius: 100,
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: grey1,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  name != null
                      ? Text(
                          name!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        )
                      : Container(),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    phoneNumber,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.call,
                          size: 40,
                          color: Colors.green,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.message,
                          size: 40,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
