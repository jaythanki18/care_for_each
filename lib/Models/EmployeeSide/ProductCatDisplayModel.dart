class ProductCategoryDisplayModel {
  List<Server>? server;

  ProductCategoryDisplayModel({this.server});

  ProductCategoryDisplayModel.fromJson(Map<String, dynamic> json) {
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
  String? catid;
  String? catname;

  Server({this.catid, this.catname});

  Server.fromJson(Map<String, dynamic> json) {
    catid = json['catid'];
    catname = json['catname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['catid'] = this.catid;
    data['catname'] = this.catname;
    return data;
  }
}
