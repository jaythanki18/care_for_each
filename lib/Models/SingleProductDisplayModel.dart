class SingleProductDisplayModel {
  List<Server>? server;

  SingleProductDisplayModel({this.server});

  SingleProductDisplayModel.fromJson(Map<String, dynamic> json) {
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
  String? pcode;
  String? pname;
  String? pdesc;
  String? price;
  String? pphoto;
  String? stock;
  String? minimumStock;
  String? sprice;

  Server(
      {this.pcode,
        this.pname,
        this.pdesc,
        this.price,
        this.pphoto,
        this.stock,
        this.minimumStock,
        this.sprice});

  Server.fromJson(Map<String, dynamic> json) {
    pcode = json['pcode'];
    pname = json['pname'];
    pdesc = json['pdesc'];
    price = json['price'];
    pphoto = json['pphoto'];
    stock = json['stock'];
    minimumStock = json['minimum_stock'];
    sprice = json['sprice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pcode'] = this.pcode;
    data['pname'] = this.pname;
    data['pdesc'] = this.pdesc;
    data['price'] = this.price;
    data['pphoto'] = this.pphoto;
    data['stock'] = this.stock;
    data['minimum_stock'] = this.minimumStock;
    data['sprice'] = this.sprice;
    return data;
  }
}
