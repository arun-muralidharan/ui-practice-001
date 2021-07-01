import 'package:about_life/data/people.dart';
import 'package:about_life/data/posts.dart';
import 'package:about_life/models/contact.dart';
import 'package:about_life/models/person.dart';
import 'package:about_life/models/post.dart';
import 'package:about_life/providers/contacts.dart';
import 'package:get/state_manager.dart';

class HomeController extends GetxController {
  Person user = people[0].obs();
  late List<Contact> contacts = [];
  late List<Post> homePosts = posts;

  @override
  void onInit() {
    super.onInit();
    contacts = populateUnique(contacts, recentIds, ContactType.Recent);
    contacts = populateUnique(contacts, friendIds, ContactType.Friend);
    contacts = populateUnique(contacts, newbieIds, ContactType.Newbie);
    int _userIndex =
        contacts.indexWhere((_contact) => _contact.person.id == user.id);
    if (_userIndex >= 0) {
      contacts[_userIndex].selected = true;
    }
  }

  List<Contact> recent() {
    List<Contact> recent = [];
    for (Contact contact in contacts) {
      if (contact.types.contains(ContactType.Recent)) recent.add(contact);
    }
    return recent;
  }

  List<Contact> friends() {
    List<Contact> recent = [];
    for (Contact contact in contacts) {
      if (contact.types.contains(ContactType.Friend)) recent.add(contact);
    }
    return recent;
  }

  List<Contact> newbies() {
    List<Contact> recent = [];
    for (Contact contact in contacts) {
      if (contact.types.contains(ContactType.Newbie)) recent.add(contact);
    }
    return recent;
  }

  void toggleContact(Contact contact) {
    int _index = contacts.indexWhere(
      (_contact) => _contact == contact,
    );
    if (_index < 0) return;
    if (contacts[_index].person.id == user.id) return;
    contacts[_index].selected = !contacts[_index].selected;
    update();
  }

  void toggleLikePost(Post post) {
    int _index = posts.indexOf(post);
    if (_index < 0) return;
    if (posts[_index].likedUserIds.contains(user.id)) {
      posts[_index].likedUserIds.remove(user.id);
    } else {
      posts[_index].likedUserIds.add(user.id);
    }
    update();
  }

  void toggleBookmarkPost(Post post) {
    int _index = posts.indexOf(post);
    if (_index < 0) return;
    if (posts[_index].bookmarkedUserIds.contains(user.id)) {
      posts[_index].bookmarkedUserIds.remove(user.id);
    } else {
      posts[_index].bookmarkedUserIds.add(user.id);
    }
    update();
  }
}
