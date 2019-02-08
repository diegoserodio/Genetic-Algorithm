class DNA{
  int size;
  String parent = "";
  char[] member;
  
  DNA(int c_size, String c_parent, int mutRate){
    size = c_size;
    parent = c_parent;
    member = new char[size];
    if(parent != null){
      char[] parentArray = parent.toCharArray();
      for(int i=0; i<size; i++){
        float mutateRnd = random(101);
        if(mutateRnd < mutRate){
          char c = (char) int(random(32, 127));
          member[i] = c;
        }else{
          member[i] = parentArray[i];
        }
      }
    }else{
      for(int i=0; i<size; i++){
      char c = (char) int(random(32, 127));
      member[i] = c;
      }
    }
  }
  
  String getText(){
    String buffer = "";
    for(int i=0; i<size; i++){
      buffer = buffer+member[i];
    }
    return buffer;
  }
  
  char getChar(int index){
    return member[index];
  }
}
