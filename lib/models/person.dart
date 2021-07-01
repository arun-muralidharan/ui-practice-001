class Person {
  int id;
  String firstName;
  String? secondName;
  String? imageURI;

  Person({
    required this.id,
    required this.firstName,
    this.secondName,
    this.imageURI,
  });
}
