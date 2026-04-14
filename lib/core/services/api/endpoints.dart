class EndPoints {
  static const String baseUrl = "http://10.0.2.2:5000";

  /// 📧 Auth
  static const String signup = "/api/email/signup";
  static const String login = "/api/email/login";
  static const String forgetPassword = "/api/email/login-forget-password";
  static const String resetPassword = "/api/email/reset-password";

  /// 👤 Users
  static const String getUserTickets = "/api/users/Ticket/";
  static const String getStations = "/api/users/stations";
  static const String getTrips = "/api/users/trips";
  static const String getSeats = "/api/users/seats";
  static const String holdSeat = "/api/users/hold-seat";
  static const String createBooking = "/api/users/createBooking";

  /// 🚉 Admin - Trips
  static const String createTrip = "/api/admin/trip/create";
  static const String updateTrip = "/api/admin/trip/update/";
  static const String deleteTrip = "/api/admin/trip/delete/";
  static const String getTripById = "/api/admin/trip/";
  static const String getTripsByStation = "/api/admin/trip/station/";

  /// 🚄 Admin - Trains
  static const String createTrain = "/api/admin/train/create";
  static const String getTrainById = "/api/admin/train/";
  static const String getTrainByName = "/api/admin/train/name/";
  static const String getTrainsByStation = "/api/admin/train/station/";

  /// 💺 Admin - Seats
  static const String createSeat = "/api/admin/seat/create";
  static const String createSeatsBulk = "/api/admin/seats/bulk";
  static const String getSeatById = "/api/admin/seat/";

  /// 🏢 Admin - Stations
  static const String createStation = "/api/admin/station/create";
  static const String createStationsBulk = "/api/admin/stations/bulk";
  static const String getAllStations = "/api/admin/stations";
  static const String getStationById = "/api/admin/station/";
  static const String getStationByName = "/api/admin/station/name/";
}