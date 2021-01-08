class Todo{

  String task;
  String time;
  bool isChecked;
  Todo({this.task,this.time,this.isChecked});


  Map<String,dynamic> toJson(){
    return {
      "task":this.task,
      "time":this.time,
      "checked":this.isChecked
    };
  }

  factory Todo.fromMap(Map obj){
    return Todo(task: obj["task"],
    time: obj['time'],
    isChecked: obj["checked"]);
  }


}
