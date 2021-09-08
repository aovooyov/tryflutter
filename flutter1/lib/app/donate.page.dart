import 'package:flutter/material.dart';

class DonatePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DonateState();
  }
}

class DonateState extends State<DonatePage> {
  final numberController = new TextEditingController();
  final expiredController = new TextEditingController();
  final csvController = new TextEditingController();
  final nameController = new TextEditingController();
  final emailController = new TextEditingController();
  final conditionController = new TextEditingController();

  final numberFocus = new FocusNode();
  final expiredFocus = new FocusNode();
  final csvFocus = new FocusNode();
  final nameFocus = new FocusNode();
  final emailFocus = new FocusNode();
  final conditionFocus = new FocusNode();

  final godLike = [1000, 10000, 1000000, 10000000, 100000000];
  int godSum;
  bool godAgree = true;

  final godKey = GlobalKey<FormState>();

  @override
  void initState() {
    godSum = godLike.last;
    super.initState();
  }

  @override
  void dispose() {
    // GC ?
    numberController.dispose();
    expiredController.dispose();
    csvController.dispose();
    nameController.dispose();
    emailController.dispose();
    conditionController.dispose();

    numberFocus.dispose();
    expiredFocus.dispose();
    csvFocus.dispose();
    nameFocus.dispose();
    emailFocus.dispose();
    conditionFocus.dispose();
    super.dispose();
  }

  InputDecoration decoration(String labelText,
      {String hintText, Icon suffixIcon}) {
    return InputDecoration(
      labelText: labelText,
      hintText: hintText,
      filled: true,
      labelStyle: TextStyle(
        color: Colors.white,
      ),
      hintStyle: TextStyle(
        color: Colors.grey[800],
      ),
      suffixIcon: suffixIcon,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(3),
        ),
        borderSide: BorderSide(
          color: Colors.amber[100],
          width: 1.0,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(3),
        ),
        borderSide: BorderSide(
          color: Colors.amber,
          width: 1.0,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(3),
        ),
        borderSide: BorderSide(
          color: Colors.red,
          width: 1.0,
        ),
      ),
    );
  }

  void focusChange(BuildContext context, FocusNode current, FocusNode next) {
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'DONATE PLEASE'.toUpperCase(),
          style: TextStyle(
            color: Colors.amber[200],
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: EdgeInsets.all(6),
          child: Card(
            margin: EdgeInsets.only(bottom: 0.0),
            color: Colors.black,
            child: Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Form(
                key: godKey,
                child: ListView(
                  // itemExtent: 30,
                  // shrinkWrap: true,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: 150,
                        child: Image.asset('assets/jesus.png'),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'Donate like a god'.toUpperCase(),
                        style: TextStyle(
                          color: Colors.amber[200],
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 26,
                    ),
                    DropdownButtonFormField(
                      decoration: decoration(
                        'Донат',
                        suffixIcon: Icon(
                          Icons.euro,
                          color: Colors.amber,
                        ),
                      ),
                      items: godLike.map((int sum) {
                        return DropdownMenuItem(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              '$sum€',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                backgroundColor: Colors.black,
                              ),
                            ),
                          ),
                          value: sum,
                        );
                      }).toList(),
                      value: godSum,
                      onChanged: (int sum) {
                        print(sum);
                        setState(() {
                          godSum = sum;
                        });
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: numberController,
                      focusNode: numberFocus,
                      onFieldSubmitted: (e) {
                        focusChange(context, numberFocus, expiredFocus);
                      },
                      keyboardType: TextInputType.number,
                      decoration: decoration(
                        'Номер карты',
                        hintText: '0000 0000 0000 0000',
                        suffixIcon: Icon(
                          Icons.credit_card,
                          color: Colors.amber,
                        ),
                      ),
                      style: TextStyle(
                        color: Colors.white,
                        decorationColor: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: expiredController,
                            focusNode: expiredFocus,
                            onFieldSubmitted: (e) {
                              focusChange(context, expiredFocus, csvFocus);
                            },
                            keyboardType: TextInputType.number,
                            decoration: decoration(
                              'Месяц/Год',
                              hintText: '00/00',
                              suffixIcon: Icon(
                                Icons.calendar_today_outlined,
                                color: Colors.amber,
                              ),
                            ),
                            style: TextStyle(
                              color: Colors.white,
                              decorationColor: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: csvController,
                            focusNode: csvFocus,
                            onFieldSubmitted: (e) {
                              focusChange(context, csvFocus, nameFocus);
                            },
                            keyboardType: TextInputType.number,
                            expands: false,
                            decoration: decoration(
                              'CSV',
                              hintText: '000',
                              suffixIcon: Icon(
                                Icons.security,
                                color: Colors.amber,
                              ),
                            ),
                            style: TextStyle(
                              color: Colors.white,
                              decorationColor: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: nameController,
                      focusNode: nameFocus,
                      onFieldSubmitted: (e) {
                        focusChange(context, nameFocus, emailFocus);
                      },
                      keyboardType: TextInputType.name,
                      decoration: decoration(
                        'Имя',
                        hintText: 'Jesus Christ',
                        suffixIcon: Icon(
                          Icons.person_outline,
                          color: Colors.amber,
                        ),
                      ),
                      style: TextStyle(
                        color: Colors.white,
                        decorationColor: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: emailController,
                      focusNode: emailFocus,
                      keyboardType: TextInputType.emailAddress,
                      decoration: decoration(
                        'Email',
                        hintText: 'jesus@christ.com',
                        suffixIcon: Icon(
                          Icons.alternate_email_outlined,
                          color: Colors.amber,
                        ),
                      ),
                      style: TextStyle(
                        color: Colors.white,
                        decorationColor: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.amber[100]),
                        borderRadius: BorderRadius.all(
                          Radius.circular(3),
                        ),
                      ),
                      child: SwitchListTile(
                        title: Text(
                          'I agree to the processing of my data by third parties',
                          style: TextStyle(
                            color: Colors.white,
                            decorationColor: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        secondary: Icon(
                          Icons.thumb_up_alt_outlined,
                          color: Colors.amber,
                        ),
                        activeColor: Colors.amber,
                        inactiveThumbColor: Colors.red,
                        inactiveTrackColor: Colors.amber[100],
                        controlAffinity: ListTileControlAffinity.leading,
                        value: godAgree,
                        onChanged: (value) {
                          setState(() {
                            godAgree = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    RaisedButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Donate',
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Icon(Icons.touch_app_outlined)
                        ],
                      ),
                      color: Colors.amber,
                      highlightColor: Colors.amber[100],
                      onPressed: () {
                        if (godKey.currentState.validate()) {
                          print('valid');
                        }
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
