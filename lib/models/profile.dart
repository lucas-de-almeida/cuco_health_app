import 'dart:convert';

class Profile {
  final String name;
  final String avatar;
  final String email;
  final String bio;
  final int publicRepo;
  final String url;
  Profile({
    required this.name,
    required this.avatar,
    required this.email,
    required this.bio,
    required this.publicRepo,
    required this.url,
  });

  @override
  String toString() {
    return 'Profile(name: $name, avatar_url: $avatar, email: $email, bio: $bio, public_repos: $publicRepo, url: $url)';
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'avatar_url': avatar,
      'email': email,
      'bio': bio,
      'public_repos': publicRepo,
      'url': url,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      name: map['name'] ?? '',
      avatar: map['avatar_url'] ?? '',
      email: map['email'] ?? 'lucasdealmeidadev@gmail.com',
      bio: map['bio'] ?? '',
      publicRepo: map['public_repos']?.toInt() ?? 0,
      url: map['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Profile.fromJson(String source) =>
      Profile.fromMap(json.decode(source));
}
