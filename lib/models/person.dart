class Person {
  final int id;
  final String firstname;
  final String lastname;

  Person({
    this.id,
    this.firstname,
    this.lastname,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      id: json['id'],
      firstname: json['firstname'],
      lastname: json['lastname'],
    );
  }
}
