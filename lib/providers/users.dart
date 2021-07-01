import 'package:about_life/data/people.dart';
import 'package:about_life/models/person.dart';

Person? getUser(int userId) {
  try {
    Person person = people.firstWhere((_person) => _person.id == userId);
    return person;
  } catch (e) {
    return null;
  }
}
