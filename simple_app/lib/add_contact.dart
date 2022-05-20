import 'package:flutter/material.dart';
import 'package:simple_app/constants.dart';
import 'package:simple_app/contact_card.dart';
import 'package:simple_app/gender.dart';

class AddContact extends StatefulWidget {
  final Function add;
  final Function delete;
  const AddContact({Key? key, required this.add, required this.delete})
      : super(key: key);

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  bool isNumber(String v) {
    bool response = true;
    String digits = "0123456789";
    int i = 0;
    while (i < v.length && response) {
      response = digits.contains(v[i]);
      i++;
    }
    return response;
  }

  String _phoneNumber = "";
  String _name = "";
  Gender? _gender = Gender.male;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: BoxDecoration(
          color: grey1,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: const InputDecoration(
                    hintText: "Name",
                    hintStyle: TextStyle(
                      color: Colors.white,
                    )),
                onChanged: (value) => _name = value,
                validator: (v) =>
                    v!.length < 2 ? "Lenght sould be at lest 6" : null,
              ),
              TextFormField(
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: const InputDecoration(
                  hintText: "Phone Number",
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onChanged: (value) => _phoneNumber = value,
                validator: (v) =>
                    (v!.length == 10 && isNumber(v)) ? null : "Not a number",
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Radio<Gender>(
                          value: Gender.male,
                          groupValue: _gender,
                          onChanged: (Gender? g) {
                            setState(() {
                              _gender = g;
                            });

                            print(_gender);
                          }),
                      const Text(
                        "Male",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Radio<Gender>(
                          value: Gender.female,
                          groupValue: _gender,
                          onChanged: (Gender? g) {
                            setState(() {
                              _gender = g;
                            });
                          }),
                      const Text(
                        "Female",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() &&
                      widget.add(
                        ContactCard(
                          phoneNumber: _phoneNumber,
                          gender: _gender!,
                          name: _name,
                          delete: widget.delete,
                        ),
                      )) {
                    Navigator.pop(context);
                  } else {
                    _formKey.currentState!.reset();
                  }
                },
                child: const Text(
                  "Add",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: grey2,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
