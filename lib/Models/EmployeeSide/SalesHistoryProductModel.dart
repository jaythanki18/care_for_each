class SalesHistoryProductDetailModel {
  List<Server>? server;

  SalesHistoryProductDetailModel({this.server});

  SalesHistoryProductDetailModel.fromJson(Map<String, dynamic> json) {
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
  String? qty;

  Server({this.pname, this.pcode, this.price, this.pphoto, this.qty});

  Server.fromJson(Map<String, dynamic> json) {
    pname = json['pname'];
    pcode = json['pcode'];
    price = json['price'];
    pphoto = json['pphoto'];
    qty = json['qty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pname'] = this.pname;
    data['pcode'] = this.pcode;
    data['price'] = this.price;
    data['pphoto'] = this.pphoto;
    data['qty'] = this.qty;
    return data;
  }
}
