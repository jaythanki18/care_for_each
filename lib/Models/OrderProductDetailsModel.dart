class OrderProductDetailsModel {
  List<Server>? server;

  OrderProductDetailsModel({this.server});

  OrderProductDetailsModel.fromJson(Map<String, dynamic> json) {
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
  String? sprice;
  String? photo;
  String? qty;

  Server(
      {this.pname, this.pcode, this.pdesc, this.sprice, this.photo, this.qty});

  Server.fromJson(Map<String, dynamic> json) {
    pname = json['pname'];
    pcode = json['pcode'];
    pdesc = json['pdesc'];
    sprice = json['sprice'];
    photo = json['photo'];
    qty = json['qty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pname'] = this.pname;
    data['pcode'] = this.pcode;
    data['pdesc'] = this.pdesc;
    data['sprice'] = this.sprice;
    data['photo'] = this.photo;
    data['qty'] = this.qty;
    return data;
  }
}
