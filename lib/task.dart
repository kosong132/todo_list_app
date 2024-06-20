class Task {
  String id;
  String name;
  String status;
  DateTime dueDate;

  Task({required this.id, required this.name, required this.status, required this.dueDate});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'dueDate': dueDate.toIso8601String(),
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      name: map['name'],
      status: map['status'],
      dueDate: DateTime.parse(map['dueDate']),
    );
  }
}
