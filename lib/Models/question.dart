

class Questions{
  final String question;
  final List<String> answer;
  final String crtans;
  bool iscrt;
 Questions(this.question, this.answer,this.crtans,this.iscrt,);

 List<String> shuffledAnswer(){
    final shuffleList=List.of(answer);
    shuffleList.shuffle();
    return shuffleList; 
  }
}