class Expense {
  String title = "";
  String category= "";
  String amount= "";
  String date = "";

  Expense({this.title,this.category,this.amount,this.date});

  factory Expense.fromJson(Map<String,dynamic> responseData){
    return Expense(
      title: responseData['title'],
      category: responseData['category'],
      amount: responseData['amount'],
      date: responseData['date']
    );
  }

  save(){
    print("saving expense using a web service");
  }

}