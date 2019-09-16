class Result{
  int _correct;
  int _incorrect;
  int _unattempted;

  Result({correct, incorrect, unattempted}){
    _correct = correct;
    _incorrect = incorrect;
    _unattempted = unattempted;
  }

  int get unattempted => _unattempted;

  set unattempted(int value) {
    _unattempted = value;
  }

  int get incorrect => _incorrect;

  set incorrect(int value) {
    _incorrect = value;
  }

  int get correct => _correct;

  set correct(int value) {
    _correct = value;
  }


}