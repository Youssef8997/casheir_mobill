//(id INTEGER PRIMARY KEY,Name TEXT,Salary DOUBLE,HireDate Text,AttendanceDate Text,LeavingDate Text)');
class MoneyEmpo {
  int?id;
  String? restSalary;
  String? paidMoney;
  double? MoneyBefore;
  String? date;
  String? Name;

  MoneyEmpo(
      { this.id, this.restSalary, this.paidMoney, this.date, this.Name, this.MoneyBefore});

  MoneyEmpo.fromJson(Map<String, dynamic> json){
    id= json['id'];
    restSalary = json['restSalary'];
    paidMoney = json['paidMoney'];
    date = json['date'];
    Name = json['Name'];
    MoneyBefore = json['MoneyBefore'];

  }

  Map<String, dynamic> toJson(){

    return {
      'id':id,
      'restSalary':restSalary,
      'paidMoney':paidMoney,
      'date':date,
      'Name':Name,
      'MoneyBefore':MoneyBefore,
    };
  }
}