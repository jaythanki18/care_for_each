class AddToCartModel {
  List<Server>? server;

  AddToCartModel({this.server});

  AddToCartModel.fromJson(Map<String, dynamic> json) {
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
  String? status;
  String? redirect;

  Server({this.status, this.redirect});

  Server.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    redirect = json['redirect'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['redirect'] = this.redirect;
    return data;
  }
}
