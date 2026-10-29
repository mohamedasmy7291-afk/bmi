
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var isMale = false;
  var isFemale = false;

  double height = 150;
  int weight = 45;
  int age = 15;

  void calculateBMI() {
    double bmi = weight / ((height / 100) * (height / 100));

    String result;
    String description;

    if (age < 20) {
      result = "BMI: ${bmi.toStringAsFixed(1)}";
      description =
      "For people under 20, BMI should be interpreted using age-specific charts.";
    } else if (bmi < 18.5) {
      result = "Underweight";
      description = "Your BMI is ${bmi.toStringAsFixed(1)}";
    } else if (bmi < 25) {
      result = "Normal weight";
      description = "Your BMI is ${bmi.toStringAsFixed(1)}";
    } else if (bmi < 30) {
      result = "Overweight";
      description = "Your BMI is ${bmi.toStringAsFixed(1)}";
    } else {
      result = "Obesity";
      description = "Your BMI is ${bmi.toStringAsFixed(1)}";
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color(0xff0a0b22),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          title: Text(
            "Your BMI Result",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 23,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.monitor_heart_outlined,
                color: Colors.deepPurpleAccent,
                size: 55,
              ),
              SizedBox(height: 15),
              Text(
                bmi.toStringAsFixed(1),
                style: TextStyle(
                  color: Colors.deepPurpleAccent,
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                result,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 8),
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Close",
                style: TextStyle(
                  color: Colors.deepPurpleAccent,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0a0b11),
      appBar: AppBar(
        backgroundColor: Color(0xff0a0b22),
        title: Text(
          "BMI CALCULATOR",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.profile_circled,
              size: 35,
              color: Colors.deepPurpleAccent,
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            size: 27,
            color: Colors.grey,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Calculate your",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 25,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Body Mass Index",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Select your details below to get started",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 42),

              // Gender heading
              Row(
                children: [
                  Text(
                    "GENDER",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.man,
                    size: 27,
                    color: Colors.deepPurple,
                  ),
                  Icon(
                    Icons.woman,
                    size: 27,
                    color: Colors.deepPurple,
                  ),
                ],
              ),
              SizedBox(height: 10),

              // Gender cards
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(30),
                      onTap: () {
                        setState(() {
                          isMale = true;
                          isFemale = false;
                        });
                      },
                      child: Container(
                        height: 200,
                        width: 230,
                        decoration: BoxDecoration(
                          color: isMale
                              ? Color(0xff292044)
                              : Color(0xff0a0b22),
                          border: Border.all(
                            color: isMale
                                ? Colors.deepPurpleAccent
                                : Colors.transparent,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 100,
                              height: 80,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white10,
                              ),
                              child: Icon(
                                Icons.male,
                                size: 35,
                                color: isMale
                                    ? Colors.deepPurpleAccent
                                    : Colors.grey,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "male",
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(30),
                      onTap: () {
                        setState(() {
                          isMale = false;
                          isFemale = true;
                        });
                      },
                      child: Container(
                        height: 200,
                        width: 230,
                        decoration: BoxDecoration(
                          color: isFemale
                              ? Color(0xff292044)
                              : Color(0xff0a0b22),
                          border: Border.all(
                            color: isFemale
                                ? Colors.deepPurpleAccent
                                : Colors.transparent,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 100,
                              height: 80,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white10,
                              ),
                              child: Icon(
                                Icons.female,
                                size: 35,
                                color: isFemale
                                    ? Colors.deepPurpleAccent
                                    : Colors.grey,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "female",
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),

              // Height heading
              Row(
                children: [
                  Text(
                    "HEIGHT",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.height,
                    size: 30,
                    color: Colors.deepPurple,
                  ),
                ],
              ),
              SizedBox(height: 10),

              // Height card
              Container(
                height: 200,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Color(0xff0a0b22),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${height.toInt()}",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 55,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "cm",
                          style: TextStyle(
                            color: Colors.deepPurpleAccent,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Slider(
                      value: height,
                      max: 250,
                      min: 120,
                      thumbColor: Colors.white,
                      inactiveColor: Colors.white24,
                      activeColor: Colors.deepPurpleAccent,
                      onChanged: (value) {
                        setState(() {
                          height = value;
                        });
                      },
                    ),
                    SizedBox(height: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "120 cm",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          "250 cm",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),

              // Your details heading
              Row(
                children: [
                  Text(
                    "YOUR DETAILS",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.assignment_outlined,
                    size: 27,
                    color: Colors.deepPurple,
                  ),
                ],
              ),
              SizedBox(height: 10),

              // Weight and age cards
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 250,
                      decoration: BoxDecoration(
                        color: Color(0xff0a0b22),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 10),
                          Icon(
                            Icons.monitor_weight_outlined,
                            size: 30,
                            color: Colors.deepPurpleAccent,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Weight",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 25,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "$weight",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            "kg",
                            style: TextStyle(
                              fontSize: 23,
                              color: Colors.white30,
                            ),
                          ),
                          SizedBox(height: 5),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white10,
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        weight++;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 15),
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white10,
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (weight > 1) {
                                          weight--;
                                        }
                                      });
                                    },
                                    icon: Icon(
                                      Icons.remove,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Container(
                      height: 250,
                      decoration: BoxDecoration(
                        color: Color(0xff0a0b22),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 10),
                          Icon(
                            Icons.event_repeat,
                            size: 30,
                            color: Colors.deepPurpleAccent,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Age",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 25,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "$age",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            "years",
                            style: TextStyle(
                              fontSize: 23,
                              color: Colors.white30,
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white10,
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(width: 15),
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white10,
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (age > 1) {
                                        age--;
                                      }
                                    });
                                  },
                                  icon: Icon(
                                    Icons.remove,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),

              // Calculate button
              ElevatedButton.icon(
                onPressed: calculateBMI,
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(
                    MediaQuery.of(context).size.width,
                    60,
                  ),
                  backgroundColor: Colors.deepPurpleAccent,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                label: Text(
                  "Calculate BMI",
                  style: TextStyle(fontSize: 20),
                ),
                icon: Icon(CupertinoIcons.arrow_right),
              ),
              SizedBox(height: 10),
              Center(
                child: Text(
                  "YOUR HEALTH JOURNEY STARTS HERE",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
