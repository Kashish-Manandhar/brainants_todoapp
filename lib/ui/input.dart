import 'package:brainants_todoapp/model/Memo.dart';
import 'package:brainants_todoapp/service/databsae/StoreService.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Input extends StatefulWidget {
  Todo todo;
  int i;
  Input({this.todo,this.i});
  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  String task="";
  String time="";
  StoreService _store=StoreService();
  final _key=GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    setState(() {
      if(widget.i==1)
        {
         task=widget.todo.task;
          time=widget.todo.time;

        }
    });




  }
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 100,
        width: 150,
        child: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Column(
              children: [

                SizedBox(height: 10,),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: (widget.i==0) ? "Enter the Task" : task,
                      border:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      )

                  ),

                  validator: (val){
                    if(val.isEmpty)
                    {
                      return "Please enter the task";
                    }
                  },
                  onChanged: (val){
                    setState(() {
                      task=val;
                    });
                  },


                ),

              ],

            ),
          ),
        ),
      ),
      actions: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.green
          ),
          child: FlatButton(onPressed: () async{
              if(widget.i==0) {
                  DateTime datetime=DateTime.now();
                  DateFormat formate=new DateFormat("yyyy-MM-dd HH:mm:ss");
                  setState(() {
                    time=formate.format(datetime);
                  });
                  if(_key.currentState.validate())
                    {
                      Todo todo = new Todo(task: task,time: time,isChecked: false);
                      await _store.addData(todo);
                      Navigator.of(context).pop();
                    }
                }
                else{
                Todo todo = new Todo(task: task,time: time,isChecked: false);
                  await _store.update(todo);
                  Navigator.of(context).pop();
                }

                  }


          , child: Text(
    (widget.i==0)?"Save":"Update",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
          )),
        )
      ],
    );
  }
}
