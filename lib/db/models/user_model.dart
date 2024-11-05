class User {
  final int? id;
  final String name;
  final String phoneNumber;
  final String? status;

  User({this.id, required this.name, required this.phoneNumber, this.status});

  // Convert a User object into a Map object
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phoneNumber': phoneNumber,
      'status': status
    };
  }

  // Extract a User object from a Map object
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      phoneNumber: map['phoneNumber'],
      status: map['status']
    );
  }
}