import 'package:flutter/material.dart';

class FormPage extends StatefulWidget{
  const FormPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FormPageState();
  }
}

class _FormPageState extends State<FormPage>{
  final _usernameController = TextEditingController();
  final _pwdController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Form Page")),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _usernameController,
                autofocus: true,
                decoration: const InputDecoration(
                    labelText: "Username",
                    hintText: "Username or email address",
                    prefixIcon: Icon(Icons.person)
                ),
                validator: (text){
                  return text?.isNotEmpty??false? null : "Username cannot be empty";
                },
              ),
              TextFormField(
                controller: _pwdController,
                obscureText: true,
                decoration: const InputDecoration(
                    labelText: "Password",
                    hintText: "Enter your password here",
                    prefixIcon: Icon(Icons.lock)
                ),
                validator: (text){
                  return text?.isNotEmpty??false ? null : "Password cannot be null";
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(onPressed: (){
                        if ((_formKey.currentState)?.validate()??false){
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Row(
                                    children: const [
                                      Icon(Icons.check,color: Colors.blue,),
                                      Padding(padding: EdgeInsets.only(left: 10.0),child: Text("Successfully login"),)
                                    ],
                                  )
                              )
                          );
                        }
                      }, icon: const Icon(Icons.login), label:
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text("Test Login"),
                      )
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _pwdController.clear();
          _usernameController.clear();
        },
        child: const Icon(Icons.clear),
      ),
    );
  }
}