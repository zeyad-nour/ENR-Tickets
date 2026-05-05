class EndPoints {


  ///  Auth
  static const String signup = "/email/signup";
  static const String login = "/email/login";
  static const String verifyOTP = "/email/verifyOTP";
  static const String resendOTP = "/email/resend-otp";
  static const String forgotPassword = "/email/forgot-password";
  static const String resetPassword = "/email/reset-password";
  static const String loginGoogle = "/email/login/google";
  static const String loginFacebook = "/email/login/facebook";

  static const String account = "/email/account";
  static const String userCreateAdmin = "/email/UserCreate/admin";

  ///  Users - Bookings
  static const String getBookings = "/users/bookings";
  static const String deleteBooking = "/users/bookings/"; // + id
  static const String payBooking = "/users/bookings/pay";

  ///  Stations
  static const String getStations = "/users/stations";
  static const String searchStations = "/users/stations/search";

  ///  Trips
  static const String searchTrips = "/users/trips/search";
  static const String tripsByStation = "/users/trips/by-station";
  static const String tripRoute = "/users/trips/"; // + tripId + /route
  static const String tripSeats = "/users/trips/"; // + tripId + /seats

  ///  Seats
  static const String holdSeat = "/users/seats/"; // + seatId + /hold

  /// 🛠 Admin - Trains
  // static const String createTrain = "/admin/trains";
  // static const String createTrainSingle = "/admin/train";
  // static const String getTrains = "/admin/trains";
  // static const String getTrainById = "/admin/train/"; // + id

  // /// 🛠 Admin - Trips
  // static const String createTrip = "/admin/trips";
  // static const String createTripSingle = "/admin/trip";
  // static const String getTrips = "/admin/trips";
  // static const String getTripById = "/admin/trip/"; // + id
  // static const String updateTrip = "/admin/trip/"; // + id
  // static const String deleteTrip = "/admin/trip/"; // + id

  // /// 🪑 Admin - Seats
  // static const String createSeats = "/admin/seats";
  // static const String createSeatSingle = "/admin/seat";
  // static const String updateSeat = "/admin/seat/"; // + id
  // static const String deleteSeat = "/admin/seat/"; // + id

  // /// 🏢 Admin - Stations
  // static const String createStations = "/admin/stations";
  // static const String createStationSingle = "/admin/station";
  // static const String getStationsAdmin = "/admin/stations";
  // static const String getStationById = "/admin/station/"; // + id
  // static const String updateStation = "/admin/station/"; // + id
  // static const String deleteStation = "/admin/station/"; // + id

  // /// 👥 Admin - Users
  // static const String getUsers = "/admin/users";
  // static const String deleteUser = "/admin/users/"; // + id

  // /// 🧹 Admin system
  // static const String freeUpDatabase = "/admin/database/freeup";

  // /// 📦 Commissary
  // static const String verifyQR = "/commissary/verify-qr";
}