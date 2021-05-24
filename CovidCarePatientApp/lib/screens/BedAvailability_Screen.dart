import 'package:flutter/material.dart';
import '../widgets/BedAvailability_item.dart';
import '../widgets/Header.dart';

class BedAvailabilityScreen extends StatelessWidget {
  const BedAvailabilityScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        // height: size.height,
        child: SingleChildScrollView(
          child: Column(children: [
            Header(),
            Container(
              width: size.width,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              color: const Color(0xffcce0d2),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Covid Bed Availabilities",
                      style: TextStyle(
                          fontSize: 18,
                          color: const Color(0xff1d617a),
                          fontWeight: FontWeight.bold),
                    ),
                  ]),
            ),
            SizedBox(height: size.height * 0.02),
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: size.width * 0.9,
                decoration: BoxDecoration(
                    border: Border(
                  left: BorderSide(
                    width: 3,
                    color: const Color(0xfff05945),
                  ),
                )),
                child: GridView.count(
                    physics: ScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    shrinkWrap: true,
                    children: [
                      BedAvailabilityState(
                        state: 'Tamil Nadu',
                        url: 'https://covidtnadu.com/',
                      ),
                      BedAvailabilityState(
                        state: 'Gurgaon',
                        url: 'https://covidggn.com/',
                      ),
                      BedAvailabilityState(
                        state: 'Delhi',
                        url: 'https://coviddelhi.com/',
                      ),
                      BedAvailabilityState(
                        state: 'Thane',
                        url:
                            'https://covidthane.org/availabiltyOfHospitalBeds.html',
                      ),
                      BedAvailabilityState(
                        state: 'Bengaluru',
                        url: 'https://covidbengaluru.com/',
                      ),
                      BedAvailabilityState(
                        state: 'Andhra Pradesh',
                        url: 'https://covidaps.com/',
                      ),
                      BedAvailabilityState(
                        state: 'Telangana',
                        url: 'https://covidtelangana.com',
                      ),
                      BedAvailabilityState(
                        state: 'West Bengal',
                        url: 'https://covidwb.com',
                      ),
                      BedAvailabilityState(
                        state: 'Pune',
                        url: 'https://covidpune.com',
                      ),
                      BedAvailabilityState(
                        state: 'Ahmedabad',
                        url: 'https://covidamd.com',
                      ),
                      BedAvailabilityState(
                        state: 'Vadodara',
                        url: 'https://covidbaroda.com',
                      ),
                      BedAvailabilityState(
                        state: 'Nagpur',
                        url:
                            'http://nsscdcl.org/covidbeds/AvailableHospitals.jsp',
                      ),
                      BedAvailabilityState(
                        state: 'Nashik',
                        url: 'https://covidnashik.com',
                      ),
                      BedAvailabilityState(
                        state: 'Madhya Pradesh',
                        url: 'https://covidmp.com',
                      ),
                      BedAvailabilityState(
                        state: 'Uttar Pradesh',
                        url: 'http://dgmhup.gov.in/en/CovidReport',
                      ),
                      BedAvailabilityState(
                        state: 'Rajasthan',
                        url:
                            'https://covidinfo.rajasthan.gov.in/COVID19HOSPITALBEDSSTATUSSTATE.aspx',
                      ),
                      BedAvailabilityState(
                        state: 'Bhopal',
                        url: 'https://bhopalcovidbeds.in/',
                      ),
                      BedAvailabilityState(
                        state: 'Haryana',
                        url: 'https://coronaharyana.in/',
                      ),
                      BedAvailabilityState(
                        state: 'Beed, Maharashtra',
                        url: 'https://covidbeed.com',
                      ),
                      BedAvailabilityState(
                        state: 'Gandhinagar, Gujarat',
                        url: 'https://covidgandhinagar.com',
                      ),
                    ]),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
