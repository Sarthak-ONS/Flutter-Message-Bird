import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter_message_bird/API/contacts_api.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({Key? key}) : super(key: key);

  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  List<Contact>? _list;

  Future getContacts() async {
    _list = await ContactsService.getContacts();
  }

  @override
  void initState() {
    super.initState();
    askContactsPermission();
  }

  askContactsPermission() async {
    final result = await ContactsAPI.getPermissionForContacts();

    switch (result) {
      case PermissionStatus.denied:
        // TODO: Handle this case.
        Navigator.pop(context);
        break;
      case PermissionStatus.granted:
        // TODO: Handle this case.
        getContacts();
        break;
      case PermissionStatus.restricted:
        // TODO: Handle this case.
        Navigator.pop(context);
        break;
      case PermissionStatus.limited:
        // TODO: Handle this case.
        Navigator.pop(context);
        break;
      case PermissionStatus.permanentlyDenied:
        // TODO: Handle this case.
        Navigator.pop(context);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff545AEA),
        title: const Text(
          'Contacts',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        titleSpacing: 0,
        shadowColor: Colors.black,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          if (_list![index].displayName == null) {
            return Container();
          }
          return ListTile(
            title: Text(
              _list![index].displayName!,
            ),
            subtitle: Text(''),
            onTap: () {},
          );
        },
        itemCount: _list!.length,
      ),
    );
  }
}
