class Rate {
  String? rate;

  Rate(this.rate);

  Rate.fromJson(Map<String, dynamic> json){
    rate = json['Rate'];
  }
  Map <String, dynamic> toJson(){
    return {
      'rate':rate,
    };
  }
}
