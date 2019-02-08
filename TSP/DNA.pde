class DNA{
  int[] dna;
  DNA(int c_dnaLenght, String parent, int mutRate){
    int dnaLenght = c_dnaLenght;
    dna = new int[dnaLenght];
    if(parent != null){
      int[] parentDna = toIntArray(parent);
      for(int i = 0; i < dnaLenght; i++){
        dna[i] = parentDna[i];
      }
      for(int i = 0; i < dnaLenght; i++){
        float mutationRnd = random(101);
        if(mutationRnd <= mutRate){
          dna = shuffle(dna, 1);
        }
      }
    }else{
      //CREATE A SEQUENCE
      for(int i = 0; i < dnaLenght; i++){
        dna[i] = i;
      }
      //SHUFFLE SEQUENCE
      dna = shuffle(dna, 100);
    }
  }
  
  String getDna(){
    String dnaSequence = "";
    for(int i = 0; i < dna.length; i++){
      dnaSequence += str(dna[i]);
    }
    return dnaSequence;
  }
  
  int[] toIntArray(String array){
    char[] charArray = array.toCharArray();
    String[] stringArray = new String[charArray.length];
    for(int i = 0; i < charArray.length; i++){
      stringArray[i] = str(charArray[i]);
    }
    int[] intArray = new int[charArray.length];
    for(int i = 0; i < charArray.length; i++){
      intArray[i] = int(stringArray[i]);
    }
    return intArray;
  }
  
  int[] shuffle(int[] c_order, int repetitions){
    int[] newOrder = c_order;
    for(int k = 0; k < repetitions; k++){
      int indexA = int(random(c_order.length));
      int indexB = int(random(c_order.length));
      int buffer = newOrder[indexA];
      newOrder[indexA] = newOrder[indexB];
      newOrder[indexB] = buffer;
    }
    return newOrder;
  }
}
