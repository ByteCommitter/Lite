class User {
  final String name;
  final String phoneNumber;
  final DateTime dateTime;

  User({required this.name, required this.phoneNumber, required this.dateTime});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      phoneNumber: json['Phone number'],
      dateTime: DateTime.parse(json['Date Time']),
    );
  }
}