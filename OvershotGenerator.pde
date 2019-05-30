int warps = 780;
int dim_cell = 5;



int  height = 15*dim_cell; 



int[] pattern_code;
int[] pattern_width;
int ndx = 0;

int [][] stitches; 
int [][] shaft_c; //0 = white, 1 == brown, 2 == red;

boolean parse = false;
int[] command;
String error; 

void setup() {
  println("setup");

  //REPLACE THIS WITH A LARGER OR SMALLER WINDOW AS YOU NEED
  //the best way to calculate is to input the value of warps multiplied by the value of dim_cell
  size(3920, 350);
  background(255);
  
  error = "";

  command = new int[2];

  
  pattern_code = new int[width];
  pattern_width = new int[width];
  shaft_c = new int[6][2];

  shaft_c[0][0] = 0;
  shaft_c[0][1] = 1;

  shaft_c[1][0] = 0;
  shaft_c[1][1] = 1;

  shaft_c[2][0] = 2;
  shaft_c[2][1] = 1;

  shaft_c[3][0] = 2;
  shaft_c[3][1] = 0;

  shaft_c[4][0] = 2;
  shaft_c[4][1] = 1;

  shaft_c[5][0] = 2;
  shaft_c[5][1] = 0;

  stitches = new int[8][2];
  //A
  stitches[0][0] = 0;
  stitches[0][1] = 1;

 //B
  stitches[1][0] = 2;
  stitches[1][1] = 3;

//C
  stitches[2][0] = 1;
  stitches[2][1] = 0;

//D
  stitches[3][0] = 4;
  stitches[3][1] = 5;

//E
  stitches[4][0] = 5;
  stitches[4][1] = 3;

//F
  stitches[5][0] = 2;
  stitches[5][1] = 1;
  
//G
  stitches[6][0] = 3;
  stitches[6][1] = 5;

//H
  stitches[7][0] = 4;
  stitches[7][1] = 0;
}



void draw() {
 
 background(255);
  
  int x = dim_cell;
  int count = 0;

  for (int i = 0; i < ndx; i++) {
    int code = pattern_code[i];
    int pw = pattern_width[i];
    
   // println(code+" "+pw);
    fill(0);
    noStroke();
    textSize(12);
    char c = (char) (code + 'a');
    text(c+""+pw, x, dim_cell*2); 
    
    
    for (int j = 0; j < pw; j++) {   
     count++;
    //cycle through the pattern
    int pw_ndx = j % 2;
    int active_shaft = stitches[code][pw_ndx];
             
      //draw the shaft array
      for(int k = 5; k >= 0; k--){
            
          stroke(0);
          if(k == active_shaft) fill(0);
          else fill(255);
          int y = dim_cell*2+(dim_cell*6 -dim_cell*k);
          rect(x, y, dim_cell, dim_cell);
      }
      
            //draw the color mapping
      for(int k = 5; k >= 0; k--){
      
          //draw top color
          noStroke();
          fill(getColor(shaft_c[active_shaft][0]));
          rect(x, dim_cell*10+dim_cell*k, dim_cell, dim_cell*3);
          
          //draw bottom color
          noStroke();
          fill(getColor(shaft_c[active_shaft][1]));
          rect(x, (dim_cell*19+dim_cell*k), dim_cell, dim_cell*3);
      }

      
        
      x += dim_cell;
    }
  }
  
  noFill();
  stroke(0);
  rect(dim_cell, dim_cell*10, 780*dim_cell, dim_cell*18);
  
  
       // println(code+" "+pw);
    fill(0);
    noStroke();
    textSize(12);
    text("count: "+count, x, dim_cell*30); 
    
     // println(code+" "+pw);
    fill(255, 0, 0);
    noStroke();
    textSize(12);
    text(error, x, dim_cell*31); 
}

color getColor(int x){
  if(x == 0) return color(255);
  if(x == 1) return color(161, 139, 127);
  return color(255, 0, 0);
}

boolean isPlainSet(int c){
  if(c == 0 || c == 1 || c==4 || c== 5) return true;
  return false;
}


//this compares against the last value for width
boolean commandValid(){
  
  if(ndx == 0) return true;
  
  int c = command[0];
  int lc = pattern_code[ndx-1];
  int lw = pattern_width[ndx-1];
    
  int e = lw % 2;
  if(e == 0 ){
    if(isPlainSet(lc) && isPlainSet(c)) return true;
    if(!isPlainSet(lc) && !isPlainSet(c)) return true;
  }else{
    if(isPlainSet(lc) && !isPlainSet(c)) return true;
    if(!isPlainSet(lc) && isPlainSet(c)) return true;
  }
  
  return false;
  
}

void printStats(){
  int[] counts;
  counts = new int[6];
  for(int i = 0; i< 6; i++){
    counts[i] = 0;
  }
  
  for(int i = 0; i < ndx; i++){
       int code = pattern_code[i];
       int pw = pattern_width[i];
       
       for (int j = 0; j < pw; j++) {   
         
          //cycle through the pattern
          int pw_ndx = j % 2;
          int active_shaft = stitches[code][pw_ndx];
           counts[active_shaft]++;
       }
          char c = (char) (code + 'a');
          println(c+""+pw);
    }
    
    for(int i = 0; i<6; i++){
      println("shaft "+(i+1)+": "+counts[i]);
    }
}

void keyPressed() {
  
  if(key == ENTER){ 
    save("canvas.jpg");
    printStats();

  }
  
  if(key == BACKSPACE){
    println("DELETE");
    if(ndx > 0) ndx--;
  }
    
  if (key >= 'a' && key <= 'z') {
    
    command[0] = (int) (key - 'a');
    if(commandValid()){
      error = "";
    }else{
      error = "Invalid Code Entered 1";
    }
      
  }
  
  if(key >= '1' && key <= '9'){
    command[1] = (int) (key - '0');
    
    
    if(commandValid()){
      error = "";
      pattern_code[ndx] = command[0];
      pattern_width[ndx] = command[1];
      ndx++;
    }else{
      error = "Invalid Code Entered 2";
    }
    
  }
  
  
 
}
