class Cell {
  int i, j;
  boolean[] walls = {true, true, true, true};
  boolean visited = false;
  
  Cell(int i, int j) {
    this.i = i;
    this.j = j;
  }

  /* Check all the surrounding neighbours, and pick among random ones, which have not been visited as next destination. */
  Cell checkNeighbors() {
    ArrayList<Cell> neighbors = new ArrayList<Cell>();

    Cell top    = grid.get(index(i, j-1));
    Cell right  = grid.get(index(i+1, j));
    Cell bottom = grid.get(index(i, j+1));
    Cell left   = grid.get(index(i-1, j));

    if (top != null && !top.visited) {
      neighbors.add(top);
    }
    if (right != null && !right.visited) {
      neighbors.add(right);
    }
    if (bottom != null && !bottom.visited) {
      neighbors.add(bottom);
    }
    if (left != null && !left.visited) {
      neighbors.add(left);
    }

    if (neighbors.size() > 0) {
      int r = floor(random(0, neighbors.size()));
      return neighbors.get(r);
    } else {
      return null;
    }

  }
  
  void highlight() {
    int x = this.i*w;
    int y = this.j*w;
    noStroke();
    fill(0, 0, 255, 100);
    rect(x, y, w, w);

  }

  void show() {
    int x = this.i*w;
    int y = this.j*w;
    stroke(255);
    if (this.walls[0]) {
      line(x    , y    , x + w, y);
    }
    if (this.walls[1]) {
      line(x + w, y    , x + w, y + w);
    }
    if (this.walls[2]) {
      line(x + w, y + w, x    , y + w);
    }
    if (this.walls[3]) {
      line(x    , y + w, x    , y);
    }

    if (this.visited) {
      noStroke();
      fill(255, 55, 120, 100);
      rect(x, y, w, w);
    }
  }
}

void removeWalls(Cell currentWall, Cell nextWall) {
  int x = currentWall.i - nextWall.i;
   if(x == 1) {
     currentWall.walls[3] = false;
     nextWall.walls[1] = false;
   } else if(x == -1) {
      currentWall.walls[1] = false;
      nextWall.walls[3] = false;
   }
   
   int y = currentWall.j - nextWall.j;
   
   if(y == 1) {
     currentWall.walls[0] = false;
     nextWall.walls[2] = false;
   } else if(y == -1) {
      currentWall.walls[2] = false;
      nextWall.walls[0] = false;
   }
}