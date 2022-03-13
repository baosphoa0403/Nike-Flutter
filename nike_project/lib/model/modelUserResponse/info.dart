import 'dart:convert';

class Info {
  final String id;
  final String username;
  final String role;

  Info(
    this.id,
    this.username,
    this.role,
  );

  Info copyWith({
    String? id,
    String? username,
    String? role,
  }) {
    return Info(
      id ?? this.id,
      username ?? this.username,
      role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'role': role,
    };
  }

  factory Info.fromMap(Map<String, dynamic> map) {
    return Info(
      map['id'],
      map['username'],
      map['role'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Info.fromJson(String source) => Info.fromMap(json.decode(source));

  @override
  String toString() => 'Info(id: $id, username: $username, role: $role)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Info &&
        other.id == id &&
        other.username == username &&
        other.role == role;
  }

  @override
  int get hashCode => id.hashCode ^ username.hashCode ^ role.hashCode;
}
