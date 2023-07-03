class EmpProductDisplayModel {
  List<Server>? server;
  List<Server1>? server1;

  EmpProductDisplayModel({this.server, this.server1});

  EmpProductDisplayModel.fromJson(Map<String, dynamic> json) {
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
  String? pid;
  String? pname;
  String? pcode;
  String? price;
  String? pphoto;
  String? pdesc;
  String? stock;
  String? msprice;
  String? ms;

  Server(
      {this.pid,
        this.pname,
        this.pcode,
        this.price,
        this.pphoto,
        this.pdesc,
        this.stock,
        this.msprice,
        this.ms});

  Server.fromJson(Map<String, dynamic> json) {
    pid = json['pid'];
    pname = json['pname'];
    pcode = json['pcode'];
    price = json['price'];
    pphoto = json['pphoto'];
    pdesc = json['pdesc'];
    stock = json['stock'];
    msprice = json['msprice'];
    ms = json['ms'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pid'] = this.pid;
    data['pname'] = this.pname;
    data['pcode'] = this.pcode;
    data['price'] = this.price;
    data['pphoto'] = this.pphoto;
    data['pdesc'] = this.pdesc;
    data['stock'] = this.stock;
    data['msprice'] = this.msprice;
    data['ms'] = this.ms;
    return data;
  }
}

class Server1 {
  String? subcatid;
  String? subcatname;

  Server1({this.subcatid, this.subcatname});

  Server1.fromJson(Map<String, dynamic> json) {
    subcatid = json['subcatid'];
    subcatname = json['subcatname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subcatid'] = this.subcatid;
    data['subcatname'] = this.subcatname;
    return data;
  }
}
