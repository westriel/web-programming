let x, y;
let x2,y2

function setup() {
    createCanvas(720, 400);
    x = width / 2;
    y = height;
    x2 = x;
    y2 = y;
}

function draw() {
    background(200);

    stroke(50);
    fill(100);
    ellipse(x, y, 24, 24);
    ellipse(x2, y2, 24, 24);

    x = x + random(-1, 1);
    x2 = x2 + random(-1, 1);

    y = y - 1;
    y2 = y2 - 1/2

    if(y < 0) {
        y = height
    }
    if(y2 < 0) {
        y2 = height
    }
}