class Contact {
  final int id;
  final String name;

  Contact({required this.id, required this.name});

  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      id: map['id'] as int, 
      name: map['name'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }
}
