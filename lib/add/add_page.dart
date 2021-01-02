import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/main_model.dart';

class AddPage extends StatelessWidget {
  final MainModel model;
  AddPage(this.model);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainModel>.value(
        value: model,
        child: Scaffold(
          appBar: AppBar(
            title: Text('新規追加'),
          ),
          body: Consumer<MainModel>(builder: (context, model, child) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: "TODO",
                        hintText: "例: 筋トレ"
                    ),
                    onChanged: (text) {
                      model.newTodoText = text;
                    },
                  ),
                ),
                RaisedButton(
                  child: Text('TODOを追加'),
                  onPressed: () async {
                    await model.add();
                    Navigator.pop(context);
                  }),
              ],
            );
          }),
        ),
    );
  }
}
