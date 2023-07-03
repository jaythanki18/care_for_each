class EmployeeSubcatProductDisplayModel {
  List<Server>? server;

  EmployeeSubcatProductDisplayModel({this.server});

  EmployeeSubcatProductDisplayModel.fromJson(Map<String, dynamic> json) {
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
  String? pname;
  String? pcode;
  String? price;
  String? pphoto;

  Server({this.pname, this.pcode, this.price, this.pphoto});

  Server.fromJson(Map<String, dynamic> json) {
    pname = json['pname'];
    pcode = json['pcode'];
    price = json['price'];
    pphoto = json['pphoto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pname'] = this.pname;
    data['pcode'] = this.pcode;
    data['price'] = this.price;
    data['pphoto'] = this.pphoto;
    return data;
  }
}
