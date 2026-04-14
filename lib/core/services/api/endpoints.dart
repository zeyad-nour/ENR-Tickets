class EndPoints {
  static const String baseUrl = "http://10.0.2.2:5000";

  /// 🔐 Auth
  static const String login = "/login";
  static const String signup = "/signup";
  static const String forgetPassword = "/login-forget-password";
  static const String resetPassword = "/reset-password";

  /// 🚉 Stations
  static const String getStations = "/stations";
  static const String createStation = "/station/create";
  static const String getStationById = "/station/";
  static const String getStationByName = "/station/name/";

  /// 🚆 Trips
  static const String getTrips = "/trips";
  static const String createTrip = "/trip/create";
  static const String getTripById = "/trip/";
  static const String getTripsByStation = "/trip/station/";

  /// 🚄 Trains
  static const String createTrain = "/train/create";
  static const String getTrainById = "/train/";
  static const String getTrainByName = "/train/name/";

  /// 💺 Seats
  static const String getSeats = "/seats";
  static const String createSeat = "/seat/create";
  static const String getSeatById = "/seat/";
  static const String getSeatsByTrain = "/train/";
  static const String getAvailableSeatsByTrip = "/trip/";

  /// 🎟️ Booking
  static const String holdSeat = "/hold-seat";
  static const String createBooking = "/createBooking";
  static const String getUserTickets = "/Ticket/";
}