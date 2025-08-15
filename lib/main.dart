import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// - Patient-
import 'patient/AddDeviceScreen.dart';
import 'patient/splash_screen.dart';
import 'patient/splash_bloc.dart';
import 'patient/welcome_screen.dart' as PatientWelcomeScreen;
import 'patient/signup_screen.dart';
import 'patient/login_screen.dart' as PatientLoginScreen;
import 'patient/user_data_screen.dart';
import 'patient/home_screen.dart';
import 'patient/data_entry_screen.dart';
import 'patient/exercises_screen.dart';
import 'patient/communication_screen.dart' as PatientCommunicationScreen;
import 'patient/settings_screen.dart' as PatientSettingsScreen;
import 'patient/challenges_screen.dart';
import 'patient/two_week_blood_sugar_challenge_screen.dart';
import 'patient/nutritional_challenges_screen.dart';
import 'patient/physical_challenges_screen.dart';
import 'patient/connect_device_screen.dart';
import 'patient/bluetooth_pairing_screen.dart';
import 'patient/success_screen.dart';
import 'patient/emergency_call_screen.dart';
import 'patient/add_contact_screen.dart' as PatientAddContactScreen;
import 'patient/nutrition_screen.dart';
import 'patient/chat_screen.dart' as PatientChatScreen;

// - Doctor-
import 'doctor/add_contact_screen.dart' as DoctorAddContactScreen;
import 'doctor/doctor_dashboard_screen.dart';
import 'doctor/patients_screen.dart';
import 'doctor/patient_profile_screen.dart';
import 'doctor/communication_screen.dart' as DoctorCommunicationScreen;
import 'doctor/settings_screen.dart' as DoctorSettingsScreen;
import 'doctor/doctor_drawer.dart';
import 'doctor/patient_details_screen.dart' as DoctorPatientDetailsScreen;
import 'doctor/chat_screen.dart' as DoctorChatScreen;

// - Coach-
import 'coach/dashboard_screen.dart';
import 'coach/patients_screen.dart';
import 'coach/patient_details_screen.dart' as CoachClientDetailsScreen;
import 'coach/communication_screen.dart' as CoachCommunicationScreen;
import 'coach/settings_screen.dart' as CoachSettingsScreen;
import 'coach/chat_screen.dart' as CoachChatScreen;
import 'coach/coach_drawer.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DiabetoX App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => SplashBloc(),
        child: const SplashScreen(),
      ),
      routes: {
        // --- Patient Routes ---
        '/patient/welcome': (context) => const PatientWelcomeScreen.WelcomeScreen(),
        '/patient/signup': (context) => const SignupScreen(),
        '/patient/login': (context) => const PatientLoginScreen.LoginScreen(),
        '/patient/user_data': (context) => const UserDataScreen(),
        '/patient/home': (context) => const HomeScreen(),
        '/patient/data_entry': (context) => const DataEntryScreen(),
        '/patient/exercises': (context) => const ExercisesScreen(),
        '/patient/communication': (context) => const PatientCommunicationScreen.CommunicationScreen(),
        '/patient/settings': (context) => const PatientSettingsScreen.SettingsScreen(),
        '/patient/challenges': (context) => const ChallengesScreen(),
        '/patient/blood_sugar_challenge': (context) => const TwoWeekBloodSugarChallengeScreen(),
        '/patient/nutritional_challenges': (context) => const NutritionalChallengesScreen(),
        '/patient/physical_challenges': (context) => const PhysicalChallengesScreen(),
        '/patient/add_contact': (context) => const PatientAddContactScreen.AddContactScreen(),
        '/patient/connect_device': (context) => const ConnectDeviceScreen(),
        '/patient/bluetooth_pairing': (context) => const BluetoothPairingScreen(),
        '/patient/success_screen': (context) => const SuccessScreen(),
        '/patient/emergency_call': (context) => const EmergencyCallScreen(),
        '/patient/nutrition': (context) => const NutritionScreen(),
        '/patient/add_device': (context) => const AddDeviceScreen(),
        // Note: Patient chat route is handled in onGenerateRoute to pass arguments.

        // --- Doctor Routes ---
        '/doctor/login': (context) => const PatientLoginScreen.LoginScreen(), // يمكن إعادة استخدام شاشة تسجيل الدخول للمريض
        '/doctor/welcome': (context) => const PatientWelcomeScreen.WelcomeScreen(), // يمكن إعادة استخدام شاشة الترحيب
        '/doctor/dashboard': (context) => const DoctorDashboardScreen(),
        '/doctor/patients': (context) => const PatientsScreen(),
        '/doctor/communication': (context) => const DoctorCommunicationScreen.CommunicationScreen(),
        '/doctor/settings': (context) => const DoctorSettingsScreen.SettingsScreen(),
        '/doctor/add_contact': (context) => const DoctorAddContactScreen.AddContactScreen(),

        // --- Coach Routes (جديدة) ---
        '/coach/login': (context) => const PatientLoginScreen.LoginScreen(), // يمكن إعادة استخدام شاشة تسجيل الدخول للمريض
        '/coach/welcome': (context) => const PatientWelcomeScreen.WelcomeScreen(), // يمكن إعادة استخدام شاشة الترحيب
        '/coach/dashboard': (context) => const CoachDashboardScreen(),
        '/coach/clients': (context) => const ClientsScreen(),
        '/coach/communication': (context) => const CoachCommunicationScreen.CommunicationScreen(),
        '/coach/settings': (context) => const CoachSettingsScreen.SettingsScreen(),
      },
      onGenerateRoute: (settings) {
        // --- Handle routes that require arguments ---

        // Patient Chat Screen
        if (settings.name == '/patient/chat') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) => PatientChatScreen.ChatScreen(
              chatPartnerName: args['chatPartnerName'],
              contact: args['contact'],
            ),
          );
        }

        // Doctor's Patient Profile Screen
        if (settings.name == '/doctor/patient_profile') {
          final args = settings.arguments as Map<String, String>?;
          if (args != null && args.containsKey('name') && args.containsKey('condition') && args.containsKey('image')) {
            return MaterialPageRoute(
              builder: (context) => PatientProfileScreen(
                patientName: args['name']!,
                patientCondition: args['condition']!,
                patientImage: args['image']!,
              ),
            );
          }
          return MaterialPageRoute(
            builder: (context) => const PatientProfileScreen(
              patientName: 'Unknown Patient',
              patientCondition: 'N/A',
              patientImage: 'assets/images/placeholder_patient.png',
            ),
          );
        }

        // Doctor Chat Screen
        if (settings.name == '/doctor/chat') {
          final patientName = settings.arguments as String;
          return MaterialPageRoute(
            builder: (context) => DoctorChatScreen.ChatScreen(patientName: patientName),
          );
        }

        // Doctor's Patient Details Screen
        if (settings.name == '/doctor/patient_details') {
          final clientData = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) => DoctorPatientDetailsScreen.PatientDetailsScreen(PatientData: clientData, patientName: '',, detailType: '',),
          );
        }

        // --- Coach Routes requiring arguments (جديدة) ---
        // Coach Client Details Screen
        if (settings.name == '/coach/client_details') {
          final clientData = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) => CoachClientDetailsScreen.ClientDetailsScreen(clientData: clientData),
          );
        }

        // Coach Chat Screen
        if (settings.name == '/coach/chat') {
          final clientName = settings.arguments as String;
          return MaterialPageRoute(
            builder: (context) => CoachChatScreen.ChatScreen(chatPartnerName: clientName, chatPartnerRole: 'client'), // Assuming similar chat screen
          );
        }

        return null;
      },
    );
  }
}
