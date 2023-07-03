class EmployeeGT {
  List<Server>? server;

  EmployeeGT({this.server});

  EmployeeGT.fromJson(Map<String, dynamic> json) {
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
  int? gt;

  Server({this.gt});

  Server.fromJson(Map<String, dynamic> json) {
    gt = json['gt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gt'] = this.gt;
    return data;
  }
}
