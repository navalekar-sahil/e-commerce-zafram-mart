import 'package:flutter/material.dart';
import 'package:zafram_mart/component/my_widgtes.dart';
import 'package:zafram_mart/component/offerList_widgtes.dart';
import 'package:zafram_mart/screen/categoryItemListScreen.dart';
import '../component/color.dart';

class OrderDetails extends StatefulWidget {
  final String name;
  final String orderId;
  final double price;
  final String ImagePath;

  const OrderDetails({
    required this.name,
    required this.price,
    required this.orderId,
    required this.ImagePath,
  });

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  List<Map<String, dynamic>> offer = [
    {
      "id": 1,
      "category": "Fruits",
      "name": "Oil (Aashirvad Pure Oil)",
      "quantity": "1 L",
      "price": "176",
      "discount": 50,
      "imagePath": "assets/images2/Fortune Oil.png"
    },
    {
      "id": 2,
      "category": "Fruits",
      "name": "Amul Gold Milk 1L ",
      "quantity": "1 L",
      "price": "94",
      "discount": 23,
      "imagePath": "assets/images2/Amul Gold.png"
    },
    {
      "id": 3,
      "category": "Fruits",
      "name": "Amul Pure Milk ",
      "quantity": "500 G",
      "price": 54,
      "discount": 20,
      "imagePath": "assets/images2/Amul tax.png"
    },
    {
      "id": 4,
      "category": "Fruits",
      "name": "Amul Kool Milk ",
      "quantity": "200 G",
      "price": 78,
      "discount": 20,
      "imagePath": "assets/images2/AmulKool.png"
    },
    {
      "id": 1,
      "category": "Clothing",
      "name": "Chakki Atta, Aashirvaad Chakki Atta ",
      "quantity": "5 kg ",
      "price": 310,
      "discount": 40,
      "size": ["M", "X", "L", "XL", "XXL"],
      "imagePath": "assets/images2/chakki Atta.png"
    },
    {
      "id": 2,
      "category": "Clothing",
      "name": "Chana Daal",
      "quantity": "2 Kg",
      "price": 250,
      "discount": 20,
      "imagePath": "assets/images2/chana daal.png"
    },
    {
      "id": 3,
      "category": "Clothing",
      "name": "Cow Ghee Big Pack",
      "quantity": "1 kg ",
      "price": 450,
      "discount": 30,
      "size": ["S", "M", "L"],
      "imagePath": "assets/images2/Cow Ghee big pack.png"
    }
  ];

  //for location
  // late location. _location;
  // MapController _mapController = MapController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        backgroundColor: appbarColor,
        title: Text(
          "Orders Details",
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'montserrat',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(height: 5),
              Text(
                "Order Id : ${widget.orderId}",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'montserrat',
                ),
              ),
              Divider(thickness: 2),
              // SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "${widget.name}",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'montserrat',
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    width: 100,
                    child: Image.asset(
                      "${widget.ImagePath}",
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                "Rs ${widget.price}",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'montserrat',
                ),
              ),

              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.blue.withOpacity(0.5),
                ),
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "Help our delivery agent reach you faster",
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'montserrat',
                            // fontWeight: FontWeight.w500,
                          ),
                          maxLines: 2,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 120,
                      margin: EdgeInsets.symmetric(horizontal: 6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          // color: Colors.orange.withOpacity(0.9),
                          color: Colors.white70),
                      child: InkWell(
                        child: Center(
                            child: Text(
                          "Share Locatipon",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'montserrat',
                          ),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
              // SizedBox(height: 30,),
              orderStepper(),
              SizedBox(
                height: 10,
              ),

              Container(
                // color: Colors.grey,
                width: double.infinity,
                height: 45,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        width: 150,
                        height: 40,
                        child: myButton("Need Help", Colors.green, () {})),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                        width: 150,
                        height: 40,
                        child: myButton("Cancel Order", orange, () {
                          orderCancel(context);
                        })),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Best Selling",
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'montserrat',
                          // fontStyle: FontStyle.italic,
                          // color: Colors.grey[700],
                          fontWeight: FontWeight.w700)),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoryItem(),
                            ));
                      },
                      child: Text(
                        "See all",
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'montserrat',
                            color: orange,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              offerList(offer)
            ],
          ),
        ),
      ),
    );
  }

  Widget orderStepper() {
    int _currentStep = 0;
    return Stepper(
      physics: NeverScrollableScrollPhysics(),
      connectorThickness: 1.5,
      currentStep: _currentStep,
      controlsBuilder: (context, controls) {
        return Row();
      },
      steps: <Step>[
        Step(
          title: Text('Order Confirm,Today',
              style: TextStyle(
                fontFamily: 'montserrat',
              )),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Your order has been successfully placed.',
                  style: TextStyle(
                    fontFamily: 'montserrat',
                  )),
              SizedBox(height: 10),
              Text('Order ID: ${widget.orderId}',
                  style: TextStyle(
                    fontFamily: 'montserrat',
                  )),
            ],
          ),
          isActive: _currentStep >= 0,
          state: _currentStep >= 1 ? StepState.complete : StepState.indexed,
        ),
        Step(
          title: Text('Shipped',
              style: TextStyle(
                fontFamily: 'montserrat',
              )),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Your order is being processed.',
                  style: TextStyle(
                    fontFamily: 'montserrat',
                  )),
              SizedBox(height: 10),
              Text('Estimated delivery date: April 25, 2024',
                  style: TextStyle(
                    fontFamily: 'montserrat',
                  )),
            ],
          ),
          isActive: _currentStep >= 1,
          state: _currentStep >= 2 ? StepState.complete : StepState.indexed,
        ),
        Step(
          title: Text('Out For Delivery',
              style: TextStyle(
                fontFamily: 'montserrat',
              )),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Your order is out for delivery.',
                  style: TextStyle(
                    fontFamily: 'montserrat',
                  )),
              SizedBox(height: 10),
              Text('Delivery person: John Doe',
                  style: TextStyle(
                    fontFamily: 'montserrat',
                  )),
              Text('Contact: +1234567890',
                  style: TextStyle(
                    fontFamily: 'montserrat',
                  )),
            ],
          ),
          isActive: _currentStep >= 2,
          state: _currentStep >= 3 ? StepState.complete : StepState.indexed,
        ),
        Step(
          title: Text('Delivered, May 06'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your order has been delivered.',
                style: TextStyle(
                  fontFamily: 'montserrat',
                ),
              ),
            ],
          ),
          isActive: _currentStep >= 3,
          state: _currentStep >= 4 ? StepState.complete : StepState.indexed,
        ),
      ],
    );
  }

  TextStyle cancelOrderStyle() {
    return TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      fontFamily: 'montserrat',
    );
  }

  Future<void> orderCancel(BuildContext context) async {
    final _formKey = GlobalKey<FormState>();
    int? _selectedOption;

    showDialog<void>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          content: Container(
            width: double.maxFinite,
            // padding: EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Reason For Cancellation",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 20),
                    RadioListTile<int>(
                      title: Text('I want to change the payment option',
                          style: cancelOrderStyle()),
                      value: 1,
                      groupValue: _selectedOption,
                      onChanged: (value) {
                        setState(() {
                          _selectedOption = value;
                        });
                      },
                    ),
                    RadioListTile<int>(
                      title: Text('I want to change the contact details',
                          style: cancelOrderStyle()),
                      value: 2,
                      groupValue: _selectedOption,
                      onChanged: (value) {
                        setState(() {
                          _selectedOption = value;
                        });
                      },
                    ),
                    RadioListTile<int>(
                      title: Text('Price of the product has now decreased',
                          style: cancelOrderStyle()),
                      value: 3,
                      groupValue: _selectedOption,
                      onChanged: (value) {
                        setState(() {
                          _selectedOption = value;
                        });
                      },
                    ),
                    RadioListTile<int>(
                      title: Text('My reasons are not listed here',
                          style: cancelOrderStyle()),
                      value: 4,
                      groupValue: _selectedOption,
                      onChanged: (value) {
                        setState(() {
                          _selectedOption = value;
                        });
                      },
                    ),
                    RadioListTile<int>(
                      title: Text('I was hoping for shorter delivery time',
                          style: cancelOrderStyle()),
                      value: 5,
                      groupValue: _selectedOption,
                      onChanged: (value) {
                        setState(() {
                          _selectedOption = value;
                        });
                      },
                    ),
                    RadioListTile<int>(
                      title: Text('I want to change the delivery address',
                          style: cancelOrderStyle()),
                      value: 6,
                      groupValue: _selectedOption,
                      onChanged: (value) {
                        setState(() {
                          _selectedOption = value;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    myButton("Submit Request", orange, () {
                      Navigator.of(context).pop();
                    })
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
