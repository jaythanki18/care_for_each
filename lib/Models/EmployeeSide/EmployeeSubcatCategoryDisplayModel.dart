class EmployeeSubcatCategoryDisplayModel {
  List<Server>? server;

  EmployeeSubcatCategoryDisplayModel({this.server});

  EmployeeSubcatCategoryDisplayModel.fromJson(Map<String, dynamic> json) {
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
  String? pdesc;
  String? price;
  String? pphoto;
  String? stock;

  Server(
      {this.pname,
        this.pcode,
        this.pdesc,
        this.price,
        this.pphoto,
        this.stock});

  Server.fromJson(Map<String, dynamic> json) {
    pname = json['pname'];
    pcode = json['pcode'];
    pdesc = json['pdesc'];
    price = json['price'];
    pphoto = json['pphoto'];
    stock = json['stock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pname'] = this.pname;
    data['pcode'] = this.pcode;
    data['pdesc'] = this.pdesc;
    data['price'] = this.price;
    data['pphoto'] = this.pphoto;
    data['stock'] = this.stock;
    return data;
  }
}
