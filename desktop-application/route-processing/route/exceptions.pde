class NotInDatabaseException extends Exception{
  NotInDatabaseException(String message){
    super(message);
  }
}
class InvalidDataException extends Exception{
  InvalidDataException(String message){
   super(message);
  }
}
