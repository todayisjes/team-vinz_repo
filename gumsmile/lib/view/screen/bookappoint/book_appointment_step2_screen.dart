import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gumsmile/const.dart';
import 'package:gumsmile/data/data.dart';
import 'package:gumsmile/model/appointment_model.dart';
import 'package:gumsmile/model/doctor_model.dart';
import 'package:gumsmile/provider/book_apointment_provider.dart';
import 'package:gumsmile/model/treatment_model.dart';
import 'package:gumsmile/service/appointment_service.dart';
import 'package:gumsmile/view/screen/bookappoint/book_appointment_step3_screen.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class Step2Screen extends StatelessWidget {
  final DoctorModel doctor;
  const Step2Screen({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'STEP 2 OUT OF 3',
          style: Constant().textAppBar,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: kPrimaryColor,
      ),
      body: Consumer<BookAppointmentProvider>(
        builder: (context, bookProv, _) {
          AppointmentService appointmentService = AppointmentService();
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(
                15.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 35.0,
                      backgroundImage: ExactAssetImage(doctor.picture),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Center(
                    child: Text(
                      "${doctor.name} Work Schedule",
                      style: Constant().textHeading.copyWith(
                            fontSize: 15.0,
                          ),
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  const Divider(
                    thickness: 1.0,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: doctor.workHours.length,
                    itemBuilder: (context, index) {
                      final workHour = doctor.workHours[index];
                      return Center(
                        child: Text(
                          '${doctor.workDays.join(', ')} - ${workHour.start.format(context)} - ${workHour.end.format(context)}',
                          style: Constant().text,
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    child: Text(
                      "Choose Your Treatment Type",
                      style: Constant().textButton.copyWith(
                            fontSize: 13.0,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                  DropdownButton<TreatmentType>(
                    hint: const Text('Select your treatment'),
                    style: Constant().text.copyWith(
                          fontSize: 15.0,
                        ),
                    value: bookProv.selectedTreatment,
                    onChanged: (value) => bookProv.selectTreatment(value),
                    items:
                        bookProv.data.map<DropdownMenuItem<TreatmentType>>((e) {
                      return DropdownMenuItem<TreatmentType>(
                        value: e,
                        child: Text(
                            '${e.name} - ${bookProv.formatCurrency.format(e.price)}'),
                      );
                    }).toList(),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    child: Text(
                      'Choose Your Date Appointment',
                      style: Constant().textButton.copyWith(
                            fontSize: 13.0,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TableCalendar(
                    focusedDay: bookProv.focusDay,
                    firstDay: DateTime.utc(2024, 1, 1),
                    lastDay: DateTime.utc(2029, 1, 1),
                    calendarFormat: CalendarFormat.month,
                    locale: 'en_US',
                    availableCalendarFormats: const {
                      CalendarFormat.month: 'Bulan',
                    },
                    daysOfWeekHeight: 50,
                    headerStyle: const HeaderStyle(
                      titleCentered: true,
                    ),
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    calendarStyle: CalendarStyle(
                      todayTextStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      selectedDecoration: BoxDecoration(
                        color: Constant().itemSelect,
                        shape: BoxShape.circle,
                      ),
                      weekNumberTextStyle: Constant().text.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                      holidayDecoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                    onDaySelected: (selectedDay, focusedDay) {
                      if (bookProv.isWorkDay(selectedDay, doctor)) {
                        bookProv.updateSelectDate(selectedDay);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("You choose wrong doctor works date"),
                          ),
                        );
                      }
                    },
                    selectedDayPredicate: (DateTime date) {
                      return bookProv.isDateSelectable(date);
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    child: Text(
                      'Choose Your Time Appointment',
                      style: Constant().textButton.copyWith(
                            fontSize: 13.0,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () async {
                          final workHour = doctor.workHours;
                          final TimeOfDay? picked = await showTimePicker(
                            context: context,
                            initialTime: bookProv.selectedTime,
                          );
                          if (picked != null &&
                              picked != bookProv.selectedTime) {
                            // Jika waktu dipilih, perbarui variabel _selectedTime
                            if (bookProv.isTimeWithinWorkHours(
                                picked, workHour)) {
                              bookProv.updateSelectTime(picked);
                            } else {
                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "You choose wrong work hours doctor's time",
                                  ),
                                ),
                              );
                            }
                          }
                        },
                        child: Center(
                          child: Text(
                            'Choose Time',
                            style: Constant().textButton.copyWith(
                                  fontSize: 16.0,
                                  color: Constant().itemSelect,
                                ),
                          ),
                        ),
                      ),
                      Text(
                        'Selected Time: ${bookProv.selectedTime.format(context)}',
                        style: Constant().text.copyWith(
                              fontSize: 13.5,
                            ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 30.0,
                    ),
                    width: double.infinity,
                    height: 60.0,
                    child: ElevatedButton(
                      onPressed: () async {
                        try {
                          final AppointmentModel appointment = AppointmentModel(
                            doctorName: doctor.name,
                            treatmentType:
                                bookProv.selectedTreatment!.name.toString(),
                            date: bookProv.selectDate!,
                            time: bookProv.selectedTime.format(context),
                            picture: doctor.picture,
                          );
                          await appointmentService
                              .insertAppointment(appointment);

                          Navigator.push(context, MaterialPageRoute(builder: (_) => BookAppointmentStep3Screen()));
                        } catch (e) {
                          rethrow;
                        }
                      },
                      child: Text('Save', style: GoogleFonts.lexendDeca(fontSize: 14, fontWeight: FontWeight.w700, color: const Color(0xFF454545))),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}