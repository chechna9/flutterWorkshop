import 'package:flutter/material.dart';
import 'package:simple_app/add_contact.dart';
import 'package:simple_app/constants.dart';
import 'package:simple_app/contact_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ContactCard> contacts = [];

  bool add(ContactCard e) {
    if (contacts
            .indexWhere((element) => element.phoneNumber == e.phoneNumber) ==
        -1) {
      setState(() {
        contacts.add(e);
      });
      return true;
    } else {
      return false;
    }
  }

  void delete(String number) {
    setState(() {
      contacts.remove((element) => element.phoneNumber == number);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    contacts = [
      ContactCard(
        name: "Yacine",
        phoneNumber: "0557042274",
        delete: delete,
      ),
      ContactCard(
        name: "Amir",
        phoneNumber: "0557042275",
        delete: delete,
      ),
      ContactCard(
        name: "Mazen",
        phoneNumber: "0557042276",
        delete: delete,
      ),
      ContactCard(
        name: "Djawad",
        phoneNumber: "0557042277",
        delete: delete,
      ),
      ContactCard(
        name: "Yazid",
        phoneNumber: "0557042278",
        delete: delete,
      ),
      ContactCard(
        name: "Cristiano",
        phoneNumber: "0557042279",
        delete: delete,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey2,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: grey1,
        title: const Text(
          "Contacts",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => Dialog(
                    child: AddContact(
                      add: add,
                      delete: delete,
                    ),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    insetPadding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 20),
                  ));
        },
        backgroundColor: Colors.amber,
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: contacts,
          ),
        ),
      ),
    );
  }
}
