/**
 * Simulate: Diffusion-Limited Aggregation 
 * from Form+Code in Design, Art, and Architecture 
 * by Casey Reas, Chandler McWilliams, and LUST
 * Princeton Architectural Press, 2010
 * ISBN 9781568989372
 * 
 * This code was written for Processing 1.2+
 * Get Processing at http://www.processing.org/download
 */

int coloniasCantidad = 10;
Colonia[] colonias = new Colonia[ coloniasCantidad ];
int[] placa;
PVector centro;
PVector puntero;
int paso = 10;
int direction = 1;
void setup() {
  size( 1024, 700, P2D );
  centro = new PVector( width / 2 , height / 2 );
  puntero = centro;

  int cantidadPixeles = width * height;
  cantidadPixeles = width * height;
  // create an array that
  // stores the position of our particles
  placa = new int[ cantidadPixeles ];
  for(int i=0; i < cantidadPixeles; i++) {
    placa[i] = -1 ;
  }

  colonias[0] = new Colonia(0,color(255,0,0));
  colonias[1] = new Colonia(1,color(0,255,0));
  colonias[2] = new Colonia(2,color(0,0,255));
  colonias[3] = new Colonia(3,color(255,255,0));
  colonias[4] = new Colonia(4,color(255,0,255));
  colonias[5] = new Colonia(5,color(255,255,255));
  colonias[6] = new Colonia(6,color(255,0,255));
  colonias[7] = new Colonia(7,color(255,0,255));
  colonias[8] = new Colonia(8,color(255,0,255));
  colonias[9] = new Colonia(9,color(255,0,255));

}


void draw() {
  background(255);
  ellipse(puntero.x, puntero.y,5,5);
  if(keyPressed == true) {
    mira();
  }
  
  loadPixels();
  for(int i=0; i < coloniasCantidad; i++) {
    colonias[i].update();
  }
  updatePixels();

}

void keyPressed() {
  //int keyIndex = -1;
  //if (key >= 'A' && key <= 'Z') {
  //  keyIndex = key - 'A';
  //} else if (key >= 'a' && key <= 'z') {
  //  keyIndex = key - 'a';
  //}
  //if (keyIndex != -1) {
  //  colonias[keyIndex % coloniasCantidad ].deploy();
  //  print( keyIndex );
  //}

  colonias[ key % coloniasCantidad ].deploy(
    int(puntero.x),
    int(puntero.y)
  );
}
void mira() {
  if(key == CODED) {
    if( keyCode == LEFT ) {
      if ( puntero.x > paso ) puntero.x -= paso; 

    }
    if( keyCode == RIGHT ) {
      if ( puntero.x < width - paso ) puntero.x += paso; 
    }
    if( keyCode == UP ) {
      if ( puntero.y > paso ) puntero.y -= paso; 

    }
    if( keyCode ==  DOWN ) {
      if ( puntero.y < height - paso ) puntero.y += paso; 
    }
    print(puntero);
  }
}

