class Technology {
  String name;
  String icon;
  String link;
  String description;

  Technology({this.name, this.icon, this.link, this.description});

  Technology.fromJson(dynamic json) {
    name = json['name'];
    icon = json['icon'];
    link = json['link'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['icon'] = this.icon;
    data['link'] = this.link;
    data['description'] = this.description;
    return data;
  }
}
