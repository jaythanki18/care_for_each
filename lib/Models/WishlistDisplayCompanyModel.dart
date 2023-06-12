class WishlistDisplayCompanyModel {
  List<Server>? server;

  WishlistDisplayCompanyModel({this.server});

  WishlistDisplayCompanyModel.fromJson(Map<String, dynamic> json) {
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
  String? wcid;
  String? custname;
  String? expecteddate;
  String? custemailid;
  String? custmobile;
  String? custCompanyName;
  String? ename;
  int? grandtotal;
  String? eEmailid;
  String? ephoto;

  Server(
      {this.wcid,
        this.custname,
        this.expecteddate,
        this.custemailid,
        this.custmobile,
        this.custCompanyName,
        this.ename,
        this.grandtotal,
        this.eEmailid,
        this.ephoto});

  Server.fromJson(Map<String, dynamic> json) {
    wcid = json['wcid'];
    custname = json['custname'];
    expecteddate = json['expecteddate'];
    custemailid = json['custemailid'];
    custmobile = json['custmobile'];
    custCompanyName = json['cust_company_name'];
    ename = json['ename'];
    grandtotal = json['grandtotal'];
    eEmailid = json['e_emailid'];
    ephoto = json['ephoto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['wcid'] = this.wcid;
    data['custname'] = this.custname;
    data['expecteddate'] = this.expecteddate;
    data['custemailid'] = this.custemailid;
    data['custmobile'] = this.custmobile;
    data['cust_company_name'] = this.custCompanyName;
    data['ename'] = this.ename;
    data['grandtotal'] = this.grandtotal;
    data['e_emailid'] = this.eEmailid;
    data['ephoto'] = this.ephoto;
    return data;
  }
}
