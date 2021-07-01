import 'package:about_life/models/person.dart';

class Contact {
  Person person;
  List<ContactType> types;
  bool selected;

  Contact(this.person, this.types, [this.selected = false]);
}

enum ContactType {
  Recent,
  Friend,
  Newbie,
}
