class CategoryDisplayModel {
  List<Server>? server;

  CategoryDisplayModel({this.server});

  CategoryDisplayModel.fromJson(Map<String, dynamic> json) {
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
  String? catname;
  String? gst;
  String? catid;

  Server({this.catname, this.gst, this.catid});

  Server.fromJson(Map<String, dynamic> json) {
    catname = json['catname'];
    gst = json['gst'];
    catid = json['catid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['catname'] = this.catname;
    data['gst'] = this.gst;
    data['catid'] = this.catid;
    return data;
  }
}
