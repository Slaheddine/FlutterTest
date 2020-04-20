class Book {
  String id;
  int volume;
  String title;
  String author;
  String imageUrl;

  Book({this.id, this.volume, this.title, this.author, this.imageUrl});

  Book.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    volume = json['volume'];
    title = json['title'];
    author = json['author'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['volume'] = this.volume;
    data['title'] = this.title;
    data['author'] = this.author;
    data['imageUrl'] = this.imageUrl;
    return data;
  }

  @override
  bool operator == (other) {
    return id==(other.id);
  }

  @override
  int get hashCode => id.hashCode;
}