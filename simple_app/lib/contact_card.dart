import 'package:flutter/material.dart';
import 'package:simple_app/constants.dart';
import 'package:simple_app/gender.dart';

class ContactCard extends StatefulWidget {
  final Gender gender;
  final String? name;
  final String phoneNumber;

  const ContactCard({
    Key? key,
    this.gender = Gender.male,
    required this.phoneNumber,
    this.name,
  }) : super(key: key);

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: grey1,
        ),
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Icon(
                widget.gender == Gender.female ? Icons.woman : Icons.man,
                color: Colors.white,
                size: 40,
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widget.name != null
                      ? Text(
                          widget.name!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        )
                      : Container(),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.phoneNumber,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.delete,
                color: grey2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
