class CartDisplayModel {
  List<Server>? server;
  List<Server1>? server1;

  CartDisplayModel({this.server, this.server1});

  CartDisplayModel.fromJson(Map<String, dynamic> json) {
    if (json['server'] != null) {
      server = <Server>[];
      json['server'].forEach((v) {
        server!.add(new Server.fromJson(v));
      });
    }
    if (json['server1'] != null) {
      server1 = <Server1>[];
      json['server1'].forEach((v) {
        server1!.add(new Server1.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.server != null) {
      data['server'] = this.server!.map((v) => v.toJson()).toList();
    }
    if (this.server1 != null) {
      data['server1'] = this.server1!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Server {
  String? pphoto;
  String? pname;
  String? pcode;
  String? sprice;
  String? qty;
  String? pid;
  int? gst;
  int? total;

  Server(
      {this.pphoto,
        this.pname,
        this.pcode,
        this.sprice,
        this.qty,
        this.pid,
        this.gst,
        this.total});

  Server.fromJson(Map<String, dynamic> json) {
    pphoto = json['pphoto'];
    pname = json['pname'];
    pcode = json['pcode'];
    sprice = json['sprice'];
    qty = json['qty'];
    pid = json['pid'];
    gst = json['gst'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pphoto'] = this.pphoto;
    data['pname'] = this.pname;
    data['pcode'] = this.pcode;
    data['sprice'] = this.sprice;
    data['qty'] = this.qty;
    data['pid'] = this.pid;
    data['gst'] = this.gst;
    data['total'] = this.total;
    return data;
  }
}

class Server1 {
  int? gt;
  String? redirect;

  Server1({this.gt, this.redirect});

  Server1.fromJson(Map<String, dynamic> json) {
    gt = json['gt'];
    redirect = json['redirect'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gt'] = this.gt;
    data['redirect'] = this.redirect;
    return data;
  }
}
