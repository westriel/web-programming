let margin = 50;
let scaleDown = true;
let r = 255, g = 0, b = 0;
let vel;

class Rectangle {

    static LEFT = 0;
    static TOP = 1;
    static RIGHT = 2;
    static BOTTOM = 3;

    constructor(centerX, centerY, width, height, tl=0, tr=0, br=0, bl=0) {
        this.centerX = centerX;
        this.centerY = centerY;
        this.width = width;
        this.height = height;
        this.tl = tl;
        this.tr = tr;
        this.br = br;
        this.bl = bl;
    }
    draw() {
        rect(this.centerX-this.width/2, this.centerY-this.height/2,this.width, this.height, this.tl, this.tr, this.br, this.bl)
    }

    scaleWidth(scale) {
        this.width *= scale;
    }

    scaleHeight(scale) {
        this.height *= scale;
    }
    scale(scaleW, scaleH = scaleW) {
        this.scaleWidth(scaleW);
        this.scaleHeight(scaleH);
    }

    boundary() { // Returns left, top, right, bottom boundary in that order
        return [this.centerX-this.width/2, 
                this.centerY-this.height/2,
                this.centerX+this.width/2,
                this.centerY+this.height/2]
    }

    translate(dx, dy) {
        this.centerX += dx;
        this.centerY += dy;
    }

    update(centerX=this.centerX, centerY=this.centerY, width=this.width, height=this.height, tl=this.tl, tr=this.tr, br=this.br, bl=this.bl) {
        this.centerX = centerX;
        this.centerY = centerY;
        this.width = width;
        this.height = height;
        this.tl = tl;
        this.tr = tr;
        this.br = br;
        this.bl = bl;
    }
}

let myRect;

function setup() {
    createCanvas(window.innerWidth, window.innerHeight);
    myRect = new Rectangle(width/2, height/2, width - 2 * margin, height - 2 * margin, 20, 20, 20, 20);
    vel = [random(-5,5), random(-5,5)]
}

function draw() {
    background(51);

    noStroke();

    fill(r,g,b);

    myRect.draw();

    if(scaleDown) {
        myRect.scale(0.99);
        if(myRect.width < margin || myRect.height < margin) scaleDown = false;
    } else {
        myRect.scale(1.01);
        if(myRect.width > width-2*margin) myRect.width = width-2*margin
        if(myRect.height > height-2*margin) myRect.height = height-2*margin
        if(myRect.width >= width-2*margin && myRect.height >= height-2*margin) scaleDown = true;
    }

    myRect.translate(vel[0], vel[1])
    bounds = myRect.boundary()
    if(bounds[0] <= 0 || bounds[2] >= width){
        vel[0] *= -1;
        scaleDown = true;
    }
    if(bounds[1] <= 0 || bounds[3] >= height){
        vel[1] *= -1;
        scaleDown = true;
    }

    if(r > 0 && g < 255 && b == 0) {--r; ++g}
    else if(g > 0 && b < 255 && r == 0) {--g; ++b}
    else if(b > 0 && r < 255 && g == 0) {--b; ++r}

}

function windowResized() {
    let widthRatio = myRect.width / width
    let heightRatio = myRect.height / height
    resizeCanvas(window.innerWidth, window.innerHeight)
    
    // myRect
    myRect.update(width/2, height/2, width * widthRatio, height * heightRatio)
}