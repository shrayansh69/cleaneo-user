import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cleaneo_user/Dashboard/Wash/Select%20Vendor/chooseVendor_page.dart';
import 'package:cleaneo_user/Dashboard/Wash/wash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VendorDetailsPage extends StatefulWidget {
  String vendorID;
  VendorDetailsPage({Key? key, required this.vendorID}) : super(key: key);

  @override
  State<VendorDetailsPage> createState() => _VendorDetailsPageState();
}

Map<String, dynamic> vendorListDynamic = {};

class _VendorDetailsPageState extends State<VendorDetailsPage> {
  Future<Object> fetchResponse() async {
    final url =
        'https://drycleaneo.com/CleaneoUser/api/vendorDetails/${widget.vendorID}';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // Cast each item in the list to Map<String, dynamic>
        setState(() {
          vendorListDynamic = jsonDecode(response.body);
        });

        print(vendorListDynamic);
        return response.body;
      } else {
        // If the response status code is not 200, throw an exception or handle
        // the error accordingly.
        throw Exception('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exceptions if any occur during the request.
      print('Error fetching data: $e');
      return []; // Return an empty list in case of an error.
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchResponse();
  }

  var ownerName = "Mr. John Doe";
  var rating = 4.5;
  var address = "123 Main Street, Anytown, USA 12345";
  var gstNo = "22AAAA0000A1Z5";
  var contactNo = "+91-9876543210";
  var email = "freshbubbles1@gmail.com";
  bool SI1 = false;
  bool SI2 = false;
  bool SI3 = false;
  bool SI4 = false;
  @override
  Widget build(BuildContext context) {
    var mQuery = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xff006acb),
        ),
        child: Column(
          children: [
            SizedBox(height: mQuery.size.height * 0.034),
            Padding(
              padding: EdgeInsets.only(
                top: mQuery.size.height * 0.058,
                bottom: mQuery.size.height * 0.03,
                left: mQuery.size.width * 0.045,
                right: mQuery.size.width * 0.045,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) {
                      //   return ChooseVendorPage();
                      // }));
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: mQuery.size.width * 0.045,
                  ),
                  Text(
                    // "Choose Vendor",
                    "Vendor Details",
                    style: TextStyle(
                      fontSize: mQuery.size.height * 0.027,
                      color: Colors.white,
                      fontFamily: 'SatoshiBold',
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: mQuery.size.height * 0.028,
                    left: mQuery.size.width * 0.045,
                    right: mQuery.size.width * 0.045,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Container(
                        //   width: mQuery.size.width*0.3,
                        //   height: mQuery.size.height*0.04,
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(6),
                        //     border: Border.all(
                        //       color: Color(0xff29b2fe)
                        //     ),
                        //   ),
                        //   child: Center(
                        //     child: Text("Show All",style: TextStyle(
                        //       color: Color(0xff29b2fe),
                        //       fontSize: mQuery.size.height * 0.017,
                        //       fontFamily: 'SatoshiBold',
                        //     ),),
                        //   ),
                        // ),
                        SizedBox(
                          height: mQuery.size.height * 0.03,
                        ),
                        Container(
                          width: double.infinity,
                          height: mQuery.size.height * 0.8,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 0,
                                    blurRadius: 7,
                                    offset: Offset(0, 0))
                              ]),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: mQuery.size.height * 0.08,
                                  color: Color(0xffe9f8ff),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: mQuery.size.width * 0.036,
                                        ),
                                        Container(
                                          width: mQuery.size.width * 0.12,
                                          height: mQuery.size.height * 0.1,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                SI1 == false
                                                    ? "https://drycleaneo.com/CleaneoVendor/storage/images/${widget.vendorID}/storepicture/3.jpg"
                                                    : "https://drycleaneo.com/CleaneoVendor/storage/images/${widget.vendorID}/storepicture/3.png",
                                              ),
                                              onError: (exception, stackTrace) {
                                                // If loading imageUrl1 fails, fallback to imageUrl2
                                                setState(() {
                                                  SI1 = true;
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: mQuery.size.width * 0.03,
                                        ),
                                        SingleChildScrollView(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                vendorListDynamic['name'] ==
                                                        null
                                                    ? 'Loading'
                                                    : vendorListDynamic['name'],
                                                style: TextStyle(
                                                    fontFamily: 'SatoshiBold',
                                                    fontSize:
                                                        mQuery.size.height *
                                                            0.02),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: mQuery.size.height * 0.023,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: mQuery.size.width * 0.04),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Ratings",
                                                style: TextStyle(
                                                    fontSize:
                                                        mQuery.size.height *
                                                            0.017,
                                                    fontFamily:
                                                        'SatoshiMedium'),
                                              ),
                                              SizedBox(
                                                height:
                                                    mQuery.size.height * 0.005,
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    size: mQuery.size.width *
                                                        0.047,
                                                    color: Color(0xff29b2fe),
                                                  ),
                                                  SizedBox(
                                                    width: mQuery.size.width *
                                                        0.02,
                                                  ),
                                                  Text(
                                                    vendorListDynamic[
                                                                'rating'] !=
                                                            null
                                                        ? vendorListDynamic[
                                                                'rating']
                                                            .toString()
                                                        : 'No reviews yet',
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'SatoshiMedium'),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                          Expanded(child: SizedBox()),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.verified,
                                                size: mQuery.size.width * 0.05,
                                                color: Color(0xff009c1a),
                                              ),
                                              SizedBox(
                                                width: mQuery.size.width * 0.01,
                                              ),
                                              Text(
                                                "Verified",
                                                style: TextStyle(
                                                    color: Color(0xff009c1a),
                                                    fontFamily:
                                                        'SatoshiMedium'),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      // Address
                                      SizedBox(
                                        height: mQuery.size.height * 0.02,
                                      ),
                                      Text(
                                        "Price Ranges",
                                        style: TextStyle(
                                            fontSize:
                                                mQuery.size.height * 0.017,
                                            fontFamily: 'SatoshiMedium'),
                                      ),
                                      SizedBox(
                                        height: mQuery.size.height * 0.005,
                                      ),
                                      Text(
                                        "Wash Price (₹30-100)",
                                        style: TextStyle(
                                            fontSize:
                                                mQuery.size.height * 0.016,
                                            fontFamily: 'SatoshiMedium',
                                            color: Colors.black54),
                                      ),
                                      Text(
                                        "Iron Price (₹10-40)",
                                        style: TextStyle(
                                            fontSize:
                                                mQuery.size.height * 0.016,
                                            fontFamily: 'SatoshiMedium',
                                            color: Colors.black54),
                                      ),
                                      Text(
                                        "Dry Clean Price (₹80-200)",
                                        style: TextStyle(
                                            fontSize:
                                                mQuery.size.height * 0.016,
                                            fontFamily: 'SatoshiMedium',
                                            color: Colors.black54),
                                      ),
                                      Text(
                                        "Premium Wash Price (₹100-250)",
                                        style: TextStyle(
                                            fontSize:
                                                mQuery.size.height * 0.016,
                                            fontFamily: 'SatoshiMedium',
                                            color: Colors.black54),
                                      ),

                                      // // GST NO
                                      // SizedBox(height: mQuery.size.height*0.02,),
                                      // Text("GST No.",style: TextStyle(
                                      //     fontSize: mQuery.size.height*0.017,
                                      //     fontFamily: 'SatoshiMedium'
                                      // ),),
                                      // SizedBox(height: mQuery.size.height*0.005,),
                                      // Text("$gstNo",style: TextStyle(
                                      //     fontSize: mQuery.size.height*0.016,
                                      //     fontFamily: 'SatoshiMedium',
                                      //     color: Colors.black54
                                      // ),
                                      // ),
                                      //
                                      // // Contact
                                      // SizedBox(height: mQuery.size.height*0.02,),
                                      // Text("Contact",style: TextStyle(
                                      //     fontSize: mQuery.size.height*0.017,
                                      //     fontFamily: 'SatoshiMedium'
                                      // ),),
                                      // SizedBox(height: mQuery.size.height*0.005,),
                                      // Text("$contactNo",style: TextStyle(
                                      //     fontSize: mQuery.size.height*0.016,
                                      //     fontFamily: 'SatoshiMedium',
                                      //     color: Colors.black54
                                      // ),
                                      // ),
                                      //
                                      // Email
                                      // SizedBox(height: mQuery.size.height*0.02,),
                                      // Text("Email",style: TextStyle(
                                      //     fontSize: mQuery.size.height*0.017,
                                      //     fontFamily: 'SatoshiMedium'
                                      // ),),
                                      // SizedBox(height: mQuery.size.height*0.005,),
                                      // Text("$email",style: TextStyle(
                                      //     fontSize: mQuery.size.height*0.016,
                                      //     fontFamily: 'SatoshiMedium',
                                      //     color: Colors.black54
                                      // ),
                                      // ),

                                      SizedBox(
                                        height: mQuery.size.height * 0.02,
                                      ),
                                      Text(
                                        "Services",
                                        style: TextStyle(
                                            fontSize:
                                                mQuery.size.height * 0.017,
                                            fontFamily: 'SatoshiMedium'),
                                      ),
                                      SizedBox(
                                        height: mQuery.size.height * 0.02,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          // Navigator.push(context,
                                          //     MaterialPageRoute(
                                          //         builder: (context) {
                                          //   return WashPage();
                                          // }));
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: mQuery.size.width * 0.17,
                                              height: mQuery.size.width * 0.16,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(0.5),
                                                        spreadRadius: 0,
                                                        blurRadius: 7,
                                                        offset: Offset(0, 0))
                                                  ]),
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: mQuery.size.height *
                                                        0.008,
                                                  ),
                                                  Image.asset(
                                                    "assets/images/vendor Detail Images/hand-washing.png",
                                                    width: mQuery.size.width *
                                                        0.08,
                                                  ),
                                                  Text(
                                                    "Wash",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff28b2fe),
                                                        fontSize:
                                                            mQuery.size.height *
                                                                0.015),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: mQuery.size.width * 0.17,
                                              height: mQuery.size.width * 0.16,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(0.5),
                                                        spreadRadius: 0,
                                                        blurRadius: 7,
                                                        offset: Offset(0, 0))
                                                  ]),
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: mQuery.size.height *
                                                        0.008,
                                                  ),
                                                  Image.asset(
                                                    "assets/images/vendor Detail Images/iron.png",
                                                    width: mQuery.size.width *
                                                        0.08,
                                                  ),
                                                  Text(
                                                    "Iron",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff5da17e),
                                                        fontSize:
                                                            mQuery.size.height *
                                                                0.015),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: mQuery.size.width * 0.17,
                                              height: mQuery.size.width * 0.16,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(0.5),
                                                        spreadRadius: 0,
                                                        blurRadius: 7,
                                                        offset: Offset(0, 0))
                                                  ]),
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: mQuery.size.height *
                                                        0.009,
                                                  ),
                                                  Image.asset(
                                                    "assets/images/vendor Detail Images/premium1.png",
                                                    width: mQuery.size.width *
                                                        0.07,
                                                  ),
                                                  SizedBox(
                                                    height: mQuery.size.height *
                                                        0.004,
                                                  ),
                                                  Text(
                                                    "Dry Clean",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xffc44970),
                                                        fontSize:
                                                            mQuery.size.height *
                                                                0.015),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: mQuery.size.width * 0.17,
                                              height: mQuery.size.width * 0.16,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(0.5),
                                                        spreadRadius: 0,
                                                        blurRadius: 7,
                                                        offset: Offset(0, 0))
                                                  ]),
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: mQuery.size.height *
                                                        0.008,
                                                  ),
                                                  Image.asset(
                                                    "assets/images/vendor Detail Images/bathtub.png",
                                                    width: mQuery.size.width *
                                                        0.08,
                                                  ),
                                                  Text(
                                                    "Premium",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xffdd874e),
                                                        fontSize:
                                                            mQuery.size.height *
                                                                0.015),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),

                                      SizedBox(
                                        height: mQuery.size.height * 0.02,
                                      ),
                                      Text(
                                        "Gallary",
                                        style: TextStyle(
                                            fontSize:
                                                mQuery.size.height * 0.017,
                                            fontFamily: 'SatoshiMedium'),
                                      ),
                                      SizedBox(
                                        height: mQuery.size.height * 0.02,
                                      ),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            Container(
                                              width: mQuery.size.width * 0.3,
                                              height: mQuery.size.height * 0.2,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                    SI1 == false
                                                        ? "https://drycleaneo.com/CleaneoVendor/storage/images/${widget.vendorID}/storepicture/1.jpg"
                                                        : "https://drycleaneo.com/CleaneoVendor/storage/images/${widget.vendorID}/storepicture/1.png",
                                                  ),
                                                  onError:
                                                      (exception, stackTrace) {
                                                    // If loading imageUrl1 fails, fallback to imageUrl2
                                                    setState(() {
                                                      SI1 = true;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                                width:
                                                    mQuery.size.width * 0.032),
                                            Container(
                                              width: mQuery.size.width * 0.3,
                                              height: mQuery.size.height * 0.2,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                    SI1 == false
                                                        ? "https://drycleaneo.com/CleaneoVendor/storage/images/${widget.vendorID}/storepicture/2.jpg"
                                                        : "https://drycleaneo.com/CleaneoVendor/storage/images/${widget.vendorID}/storepicture/2.png",
                                                  ),
                                                  onError:
                                                      (exception, stackTrace) {
                                                    // If loading imageUrl1 fails, fallback to imageUrl2
                                                    setState(() {
                                                      SI1 = true;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                                width:
                                                    mQuery.size.width * 0.032),
                                            Container(
                                              width: mQuery.size.width * 0.3,
                                              height: mQuery.size.height * 0.2,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                    SI1 == false
                                                        ? "https://drycleaneo.com/CleaneoVendor/storage/images/${widget.vendorID}/storepicture/3.jpg"
                                                        : "https://drycleaneo.com/CleaneoVendor/storage/images/${widget.vendorID}/storepicture/3.png",
                                                  ),
                                                  onError:
                                                      (exception, stackTrace) {
                                                    // If loading imageUrl1 fails, fallback to imageUrl2
                                                    setState(() {
                                                      SI1 = true;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                                width:
                                                    mQuery.size.width * 0.032),
                                            Container(
                                              width: mQuery.size.width * 0.3,
                                              height: mQuery.size.height * 0.2,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                    SI1 == false
                                                        ? "https://drycleaneo.com/CleaneoVendor/storage/images/${widget.vendorID}/storepicture/4.jpg"
                                                        : "https://drycleaneo.com/CleaneoVendor/storage/images/${widget.vendorID}/storepicture/4.png",
                                                  ),
                                                  onError:
                                                      (exception, stackTrace) {
                                                    // If loading imageUrl1 fails, fallback to imageUrl2
                                                    setState(() {
                                                      SI1 = true;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: mQuery.size.height * 0.03,
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: mQuery.size.height * 0.02,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
