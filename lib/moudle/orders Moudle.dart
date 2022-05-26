
class OrdersMoudel {
  String? Name;
  String? Code;
  double? quantity;


  OrdersMoudel(
      {this.Name,
        this.Code,
        this.quantity,
      });
  OrdersMoudel.fromJson(Map<String, dynamic> json)
  {
    Name = json['name'];
    Code = json['code'];
    quantity = json['quantity'];

  }
  Map<String, dynamic> toJson()
  {
    return {
      'Name': Name,
      'Code': Code,
      'quantity': quantity,

    };
  }
}
