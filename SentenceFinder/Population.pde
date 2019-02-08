class Population{
  DNA dna[];
  int membersQnt, membersSize, h = 30, score = 0, parentsQnt = 0, maxFitness, bestMember;
  int[] fitnessScore;
  String[] pop, pool;
  
  Population(int c_membersQnt, int c_membersSize){
    membersQnt = c_membersQnt;
    membersSize = c_membersSize;
    pool = new String[1];
  }
  
  void generate(int mutRate){
    int selectedParent = int(random(0, parentsQnt));
    pop = new String[membersQnt];
    dna = new DNA[membersQnt];
    for(int i=0; i<membersQnt; i++){
      dna[i] = new DNA(membersSize, pool[selectedParent], mutRate);
      pop[i] = dna[i].getText();
    }
  }
  
  void calculateFitness(String c_targer){
    int poolIndex = 0, poolSize = 0;
    char[] targetList = c_targer.toCharArray();
    fitnessScore = new int[membersQnt];
    
    // CALCULATE FITNESS
    for(int i=0; i<membersQnt; i++){
        for(int k=0; k<membersSize; k++){
          if(targetList[k] == dna[i].getChar(k)){
            score++;
          }
          
          if(k == membersSize-1){
            score = int(pow(score, 2));
            if(score >= maxFitness){
              fitnessScore[i] = score;
              bestMember = i;
            }else{
              fitnessScore[i] = -1;
            }
            score = 0;
          }
        }
        maxFitness = max(fitnessScore);
      }
      
     //CREATE POOL
     for(int i=0; i<membersQnt; i++){
       poolSize += fitnessScore[i]+1;
     }
     pool = new String[poolSize];
     for(int i=0; i<membersQnt; i++){
       for(int k=0; k<fitnessScore[i]+1; k++){
         pool[poolIndex] = dna[i].getText();
         poolIndex++;
       }
     }
     parentsQnt = poolSize;
  }
  
  String getBestMember(){
    return pop[bestMember];
  }
  
  void show(){
    fill(255);
    stroke(255);
    rect(width/2, 0, width/2, height);
    fill(0);
    textSize(24);
    for(int i=0; i<membersQnt; i++){
      text(pop[i], width/2+100, h);
      h += 32;
      if( i == membersQnt-1){
        h=30;
      }
    }
  }
}
