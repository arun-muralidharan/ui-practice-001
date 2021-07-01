import 'package:about_life/models/person.dart';

List<Person> people = [
  Person(
    id: 1,
    firstName: "Yibo",
    imageURI: "https://i.pravatar.cc/100?img=33",
  ),
  Person(
    id: 2,
    firstName: "Alex",
    imageURI: "https://i.pravatar.cc/100?img=3",
  ),
  Person(
    id: 3,
    firstName: "Nina",
    imageURI: "https://i.pravatar.cc/100?img=5",
  ),
  Person(
    id: 4,
    firstName: "Mark",
    secondName: "Kyle",
    imageURI: "https://i.pravatar.cc/100?img=7",
  ),
  Person(
    id: 5,
    firstName: "Carla",
    imageURI: "https://i.pravatar.cc/100?img=9",
  ),
  Person(
    id: 6,
    firstName: "John",
    imageURI: "https://i.pravatar.cc/100?img=8",
  )
];

List<int> recentIds = [1, 2, 3, 4];
List<int> friendIds = [2, 4, 5, 6];
List<int> newbieIds = [6, 5, 4, 3];
