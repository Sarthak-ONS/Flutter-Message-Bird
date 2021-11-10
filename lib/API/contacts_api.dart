import 'package:permission_handler/permission_handler.dart';

class ContactsAPI {
  static Future<PermissionStatus> getPermissionForContacts() async {
    final permission = await Permission.contacts.status;

    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.permanentlyDenied) {
      final askingForPermission = await Permission.contacts.request();
      return askingForPermission;
    } else {
      return permission;
    }
  }
}
