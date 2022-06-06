//' (id INTEGER PRIMARY KEY,Name TEXT,LastPaid DOUBLE,TotalSuppliers DOUBLE,LastDate Text)');
class SuppliersModule {
  String? name;
  int?id;
  double? LastPaid;
  double? TotalSuppliers;
  double? AllMoney;
  String? feesDate;

  SuppliersModule(
      {this.name, this.id, this.LastPaid, this.TotalSuppliers, this.feesDate,this.AllMoney});

  SuppliersModule.fromJson(Map<String, dynamic> json){
    name = json['name'];
    id= json['id'];
    LastPaid = json['LastPaid'];
    TotalSuppliers = json['TotalSuppliers'];
    AllMoney = json['AllMoney'];
    feesDate = json['feesDate'];

  }

  Map<String, dynamic> toJson(){

    return {
      'name':name,
      'id':id,
      'LastPaid':LastPaid,
      'TotalSuppliers':TotalSuppliers,
      'AllMoney':AllMoney,
      'feesDate':feesDate,
    };
  }
}