import 'package:about_life/data/people.dart';
import 'package:about_life/models/contact.dart';
import 'package:about_life/models/person.dart';

List<Contact> populateUnique(
    List<Contact> contacts, List<int> userIds, ContactType type) {
  for (int _userId in userIds) {
    try {
      Person _person = people.firstWhere((_person) => _person.id == _userId);
      int _index =
          contacts.indexWhere((_contact) => _contact.person.id == _person.id);
      if (_index < 0) {
        contacts.add(Contact(_person, [type], false));
      } else {
        contacts[_index].types.add(type);
      }
    } catch (e) {
      print(e);
    }
  }
  return contacts;
}
