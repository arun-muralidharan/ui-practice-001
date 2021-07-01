import 'package:about_life/controllers/homeController.dart';
import 'package:about_life/models/contact.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class People extends StatelessWidget {
  const People({Key? key, this.people = const []}) : super(key: key);

  final List<Contact> people;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: people
          .map(
            (_contact) => person(context, _contact),
          )
          .toList(),
    );
  }

  Widget person(BuildContext context, Contact contact) {
    final HomeController _homeController = Get.find();
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => _homeController.toggleContact(contact),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 69,
                  width: 69,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: contact.selected
                        ? null
                        : LinearGradient(
                            colors: [
                              Theme.of(context).primaryColor,
                              Theme.of(context).colorScheme.secondary,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                  ),
                ),
                Container(
                  height: 66,
                  width: 66,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    image: DecorationImage(
                      image: NetworkImage(contact.person.imageURI ??
                          "https://via.placeholder.com/100x100"),
                    ),
                  ),
                ),
                contact.selected
                    ? Container(
                        height: 66,
                        width: 66,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withAlpha(70),
                        ),
                        child: Icon(Icons.add_box_rounded),
                      )
                    : Container(
                        height: 66,
                        width: 66,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            width: 3,
                          ),
                        ),
                      ),
              ],
            ),
            SizedBox(height: 12),
            Text(
              contact.person.id == _homeController.user.id
                  ? "You"
                  : contact.person.firstName,
            ),
          ],
        ),
      ),
    );
  }
}
