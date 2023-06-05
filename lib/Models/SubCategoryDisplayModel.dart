class SubCategoryDisplayModel {
  List<Server>? server;

  SubCategoryDisplayModel({this.server});

  SubCategoryDisplayModel.fromJson(Map<String, dynamic> json) {
    if (json['server'] != null) {
      server = <Server>[];
      json['server'].forEach((v) {
        server!.add(new Server.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.server != null) {
      data['server'] = this.server!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Server {
  String? subcatname;
  String? catname;
  String? catid;
  String? subcatid;

  Server({this.subcatname, this.catname, this.catid, this.subcatid});

  Server.fromJson(Map<String, dynamic> json) {
    subcatname = json['subcatname'];
    catname = json['catname'];
    catid = json['catid'];
    subcatid = json['subcatid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subcatname'] = this.subcatname;
    data['catname'] = this.catname;
    data['catid'] = this.catid;
    data['subcatid'] = this.subcatid;
    return data;
  }
}
