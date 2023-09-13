
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhoneAuthScreen extends StatefulWidget {
  static const String id = 'phone-auth-screen';

  @override
  State<PhoneAuthScreen> createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {

  bool validate=false;
  var countryCodeController = TextEditingController(text: "+91");
  var phoneNumberController = TextEditingController();

  showAlertDialog(BuildContext context){
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
          ),
          SizedBox(width: 8,),
          Text('Please wait')
        ],
      ),
    );
    showDialog(
        barrierDismissible: false,
        context: context, builder: (BuildContext context){
      return alert;
    });
  }


  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.orange,
        iconTheme: IconThemeData(color: Colors.black,),
        title: Text('Login',style: TextStyle(color: Colors.black),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40,),
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.orange,
                child: Icon(
                  CupertinoIcons.person_alt_circle,
                  color: Colors.black,
                  size: 60,),
              ),
              SizedBox(height: 12,),
              Text('Enter your phone number',
                style:
                TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),),

              SizedBox(height: 10,),
              Text("Will send confirmation code",
              style: TextStyle(color: Colors.grey,),),

              Row(
                children: [
                  Expanded(
                    flex:1,
                    child: TextFormField(
                     controller: countryCodeController,
                      enabled: false,
                      decoration: InputDecoration(
                        labelText: 'Country',
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),

                  Expanded(
                    flex:3,
                    child: TextFormField(
                      onChanged: (value){
                        if(value.length==10){
                          setState(() {
                            validate = true;
                          });
                        }else{
                          validate = false;
                        }
                      },

                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      controller: phoneNumberController,
                      decoration: InputDecoration(
                        labelText: 'Number',
                        hintText: 'Enter your phone number',
                        hintStyle: TextStyle(fontSize: 10,color: Colors.grey),
                      ),
                    ),),
                ],
              )
            ],
          )

      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: AbsorbPointer(
            absorbing: validate ==true ? false:true,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: validate == true
                    ? MaterialStateProperty.all(Theme.of(context).primaryColor): MaterialStateProperty.all(Colors.grey),
              ),
              onPressed: () {
                String number = '${countryCodeController.text}${phoneNumberController.text}';
                showAlertDialog(context);

              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Next',
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      )
    );

  }
}
