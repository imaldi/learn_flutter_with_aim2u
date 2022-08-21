import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learn_flutter_with_aim2u/const/number_consts.dart';
import 'package:learn_flutter_with_aim2u/helper/alert_dialog.dart';
import 'package:learn_flutter_with_aim2u/screen/my_home_screen.dart';
import 'package:learn_flutter_with_aim2u/widget/custom_text_field.dart';
import 'package:learn_flutter_with_aim2u/widget/suffix_icon_password_text_form_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _keyForm = GlobalKey<FormState>();
  String? nama;
  String? password;
  bool obscurePasswordText = true;

  checkForm(BuildContext context) {
    final form = _keyForm.currentState;
    if (form!.validate()) {
      setState(() {
        form.save();
        myAlertDialog(context: context, alertDialog: AlertDialog(
          title: const Text('Yakin?'),
          content: const Text('Serius yakin?'),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              Expanded(
                child: ElevatedButton(onPressed: (){
                  print('No');
                  Navigator.of(context).pop();
                }, child: const Text('No')),
              ),
              const SizedBox(width: sizeMedium,),
              Expanded(
                child: ElevatedButton(onPressed: (){
                  print('Yes');
                  Navigator.of(context).pop();
                  Navigator
                      .of(context).pushReplacement(
                        MaterialPageRoute(builder: (c) => MyHomeScreen(name: nama ?? "-") ));
                }, child: const Text('Yes')),
              ),
            ],)
          ],
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Register Screen'),
        ),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Form(

              /// Form perlu key untuk dipakai ketika validasi isi seluruh form
              key: _keyForm,
              child: Column(
                children: [
                  Container(
                    child: Text(
                      'Form Pendaftaran ${nama ?? ""}',
                      style: const TextStyle(fontSize: sizeBig),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  CustomTextField(
                    labelText: 'Nama Lengkap',
                    hintText: 'Nama Lengkap Elu Disini',
                    validator: (text) {
                      if (text!.isEmpty) {
                        return 'Nama tidak boleh kosong!';
                      }
                      if (RegExp(r'[^a-zA-Z\s]+').hasMatch(text)) {
                        return 'Nama hanya boleh berisi huruf dan spasi';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      nama = value;
                    },
                  ),
                  CustomTextField(
                    labelText: 'Password',
                    hintText: 'Password Anda',
                    validator: (text) {
                      return (text!.length < 3)
                          ? "Password minimal 8 karakter"
                          : null;
                    },
                    onChanged: (text) {
                      setState(() {
                        password = text;
                      });
                    },
                    decoration: InputDecoration(
                      suffixIcon: SuffixIconPasswordTextFormField(
                        obscurePasswordTextInWidget: obscurePasswordText,
                        onTap: () {
                          setState(() {
                            obscurePasswordText = !obscurePasswordText;
                          });
                        },
                      ),
                    ),
                    obscureText: obscurePasswordText,
                  ),
                  CustomTextField(
                    labelText: 'Password Confirmation',
                    hintText: 'Ketik Ulang Password',
                    validator: (text) {
                      return text == password ? null : "Password tidak cocok";
                    },
                    decoration: InputDecoration(
                      suffixIcon: SuffixIconPasswordTextFormField(
                        obscurePasswordTextInWidget: obscurePasswordText,
                        onTap: () {
                          setState(() {
                            obscurePasswordText = !obscurePasswordText;
                          });
                        },
                      ),
                    ),
                    obscureText: obscurePasswordText,
                  ),
                  Flexible(
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                              onPressed: () {
                                checkForm(context);
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.lightBlue[100],
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(sizeMedium),
                                  ),
                                  side: const BorderSide(
                                      width: 3, color: Colors.blue),
                                  minimumSize: Size(MediaQuery.of(context).size.width / 2, sizeHuge * 2)
                              ),
                              child: Text('Simpan',style: TextStyle(
                                  fontSize: sizeBig,
                                  color: Colors.blue[900]))),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        )));
  }
}
