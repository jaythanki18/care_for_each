class WishlistDetailDisplayCompanyModel {
  List<Server1>? server1;
  List<Server>? server;

  WishlistDetailDisplayCompanyModel({this.server1, this.server});

  WishlistDetailDisplayCompanyModel.fromJson(Map<String, dynamic> json) {
    if (json['server1'] != null) {
      server1 = <Server1>[];
      json['server1'].forEach((v) {
        server1!.add(new Server1.fromJson(v));
      });
    }
    if (json['server'] != null) {
      server = <Server>[];
      json['server'].forEach((v) {
        server!.add(new Server.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.server1 != null) {
      data['server1'] = this.server1!.map((v) => v.toJson()).toList();
    }
    if (this.server != null) {
      data['server'] = this.server!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Server1 {
  String? pname;
  String? pcode;
  String? pdesc;
  String? photo;
  String? sprice;
  String? qty;

  Server1(
      {this.pname, this.pcode, this.pdesc, this.photo, this.sprice, this.qty});

  Server1.fromJson(Map<String, dynamic> json) {
    pname = json['pname'];
    pcode = json['pcode'];
    pdesc = json['pdesc'];
    photo = json['photo'];
    sprice = json['sprice'];
    qty = json['qty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pname'] = this.pname;
    data['pcode'] = this.pcode;
    data['pdesc'] = this.pdesc;
    data['photo'] = this.photo;
    data['sprice'] = this.sprice;
    data['qty'] = this.qty;
    return data;
  }
}

class Server {
  String? cphoto;
  String? cname;
  String? ccname;
  String? cemid;
  String? cmobileno;
  int? gt;
  String? pa;
  String? cdate;
  String? eemailid;
  String? edesc;
  String? ename;
  String? ephoto;

  Server(
      {this.cphoto,
        this.cname,
        this.ccname,
        this.cemid,
        this.cmobileno,
        this.gt,
        this.pa,
        this.cdate,
        this.eemailid,
        this.edesc,
        this.ename,
        this.ephoto});

  Server.fromJson(Map<String, dynamic> json) {
    cphoto = json['cphoto'];
    cname = json['cname'];
    ccname = json['ccname'];
    cemid = json['cemid'];
    cmobileno = json['cmobileno'];
    gt = json['gt'];
    pa = json['pa'];
    cdate = json['cdate'];
    eemailid = json['eemailid'];
    edesc = json['edesc'];
    ename = json['ename'];
    ephoto = json['ephoto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cphoto'] = this.cphoto;
    data['cname'] = this.cname;
    data['ccname'] = this.ccname;
    data['cemid'] = this.cemid;
    data['cmobileno'] = this.cmobileno;
    data['gt'] = this.gt;
    data['pa'] = this.pa;
    data['cdate'] = this.cdate;
    data['eemailid'] = this.eemailid;
    data['edesc'] = this.edesc;
    data['ename'] = this.ename;
    data['ephoto'] = this.ephoto;
    return data;
  }
}
