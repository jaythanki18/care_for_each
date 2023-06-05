class ProductDisplayModel {
  List<Server>? server;

  ProductDisplayModel({this.server});

  ProductDisplayModel.fromJson(Map<String, dynamic> json) {
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
  String? price;
  String? pphoto;
  String? stock;
  String? pid;
  String? sprice;
  String? pdesc;

  Server(
      {this.pname,
      this.price,
      this.pphoto,
      this.stock,
      this.pid,
      this.sprice,
      this.pdesc});

  Server.fromJson(Map<String, dynamic> json) {
    pname = json['pname'];
    price = json['price'];
    pphoto = json['pphoto'];
    stock = json['stock'];
    pid = json['pid'];
    sprice = json['sprice'];
    pdesc = json['pdesc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pname'] = this.pname;
    data['price'] = this.price;
    data['pphoto'] = this.pphoto;
    data['stock'] = this.stock;
    data['pid'] = this.pid;
    data['sprice'] = this.sprice;
    data['pdesc'] = this.pdesc;
    return data;
  }
}
