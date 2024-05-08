import 'package:flutter/material.dart';
import 'package:zafram_mart/component/my_widgtes.dart';

import '../component/color.dart';

class MyAccount extends StatefulWidget {
  final String name;
  final String mobile;
  final String email;
  final String dob;
  const MyAccount({super.key, required this.name, required this.mobile, required this.email, required this.dob});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _mobileNumberController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _dobController = TextEditingController();

  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    List<String> gender = [
      'Male',
      'Female',
      'other',
    ];
    String _selectedGender = 'Male';

    return Scaffold(
      backgroundColor: pink,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: appbarColor,
        toolbarHeight: 70,
        // centerTitle: true,
        title: Text(
          "My Account",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'montserrat',
            // color: Colors.grey[600]
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),

              Text(
                "First Name",
                style: contactStyle(),
              ),
              accountTextfield(
                  controller: _firstNameController, hintText: "${widget.name.toString().split(" ")[0]}"),

              SizedBox(
                height: 15,
              ),
              Text(
                "Last Name",
                style: contactStyle(),
              ),
              accountTextfield(
                  controller: _lastNameController, hintText: "${widget.name.toString().split(" ")[1]}"),

              SizedBox(
                height: 15,
              ),
              Text(
                "Mobile Number",
                style: contactStyle(),
              ),
              TextField(
                controller: _mobileNumberController,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: "${widget.mobile}",

                  // prefixIcon: Icon(Icons.person, color: themeColor),
                ),
                keyboardType: TextInputType.phone,
              ),

              SizedBox(
                height: 15,
              ),
              Text(
                "Email",
                style: contactStyle(),
              ),
              accountTextfield(controller: _emailController, hintText: "Email"),

              SizedBox(
                height: 15,
              ),
              Text(
                "Gender",
                style: contactStyle(),
              ),
              DropdownButtonFormField<String>(
                value: _selectedGender,
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value!;
                  });
                },
                items: gender
                    .map((option) => DropdownMenuItem<String>(
                          value: option,
                          child: Text(
                            option,
                            style: TextStyle(fontFamily: 'montserrat'),
                          ),
                        ))
                    .toList(),
              ),

              //Date of birth
              SizedBox(
                height: 15,
              ),
              Text(
                "Date of Birth",
                style: contactStyle(),
              ),
              TextField(
                controller: _dobController,
                readOnly: true,
                decoration: const InputDecoration(
                  hintText: "dd/mm/yyyy",
                  suffixIcon: Icon(Icons.calendar_month)
                ),
                onTap: () {
                  _selecteDate();
                },
              ),

              SizedBox(height: 150),
              myButton("Save", appbarColor, () { }),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  //pick date
  Future<void> _selecteDate() async {
    DateTime? _picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    if (_picked != null) {
      setState(() {
        _dobController.text = _picked.toString().split(" ")[0];
      });
    }
  }

  //lable textstyle
  TextStyle contactStyle() {
    return TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w700,
      fontFamily: 'montserrat',
    );
  }
}
