
class Particle{
  int x, y;
  int cid;
  Colonia col;
  boolean stuck = false;

  Particle( Colonia c ) {
    col = c;
    cid = col.id;
    reset();
  }

  void reset() {
    // keep choosing random spots
    // until an empty one is found
    do {
      x = floor(random(width));
      y = floor(random(height));
    } while ( (placa[y * width + x] == cid));
  }

  void update() {
    // move around
    if (!stuck) {
      x += round(random(-1, 1));
      y += round(random(-1, 1));
      
      if (
	x < 0 ||
        y < 0 ||
        x >= width ||
	y >= height 
	|| ocupado()
      ) {
         reset();
         return; 
      }

      // convierte
      // if (
      //   ocupado()
      // ) {
      //   //stuck = true;
      //   placa[y * width + x] = cid;        
      // }

      if (
	!alone()
      ) {
        stuck = true;
        placa[y * width + x] = cid;        
      }
    }
  }

  // returns true if no neighboring pixels
  boolean alone() {
    int currentx = x;
    int currenty = y;

    // get positions
    int leftx   = currentx - 1;
    int rightx  = currentx + 1;
    int topy    = currenty - 1;
    int bottomy = currenty + 1;

    if (
      currentx <= 0 || currentx >= width || 
      leftx <= 0    || leftx >= width || 
      rightx <= 0   || rightx >= width || 
      currenty <= 0 || currenty >= height || 
      topy <= 0     || topy >= height || 
      bottomy <= 0  || bottomy >= height
    ) return true;

    // pre multiply the ys
    currenty *= width;
    bottomy  *= width;
    topy     *= width;
    
    // N, W, E, S
    if (
      ( placa[ currentx + topy ]    == cid ) || 
      ( placa[ leftx + currenty ]   == cid ) ||
      ( placa[ rightx + currenty ]  == cid ) ||
      ( placa[ currentx + bottomy ] == cid )
    ) return false;
    
    // NW, NE, SW, SE
    if (
      ( placa[ leftx + topy ]     == cid ) || 
      ( placa[ leftx + bottomy ]  == cid ) ||
      ( placa[ rightx + topy ]    == cid ) ||
      ( placa[ rightx + bottomy ] == cid )
    ) return false;
    
    return true;
  }  

  boolean ocupado() {
    int currentx = x;
    int currenty = y;

    // pre multiply the ys
    currenty *= width;
    if (
      placa[ currenty + currentx ] >= 0 
    ) return true;
    
    
    return false;
  }  

}
