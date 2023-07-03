class WishlistDisplayProductModel {
  List<Server>? server;

  WishlistDisplayProductModel({this.server});

  WishlistDisplayProductModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? pcode;
  String? pdesc;
  String? sprice;
  String? pphoto;
  String? qty;

  Server(
      {this.name, this.pcode, this.pdesc, this.sprice, this.pphoto, this.qty});

  Server.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    pcode = json['pcode'];
    pdesc = json['pdesc'];
    sprice = json['sprice'];
    pphoto = json['pphoto'];
    qty = json['qty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['pcode'] = this.pcode;
    data['pdesc'] = this.pdesc;
    data['sprice'] = this.sprice;
    data['pphoto'] = this.pphoto;
    data['qty'] = this.qty;
    return data;
  }
}
