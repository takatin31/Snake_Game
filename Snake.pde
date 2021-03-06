import processing.sound.*;
  
SoundFile file;
String music = "music.mp3";
String path;
SoundFile file2;
String music2 = "eat.mp3";
String path2;

static int widthB = 1000;
static int heightB = 600;
static int widthS = 25;
static int heightS = 25;
int nbrLines, nbrCols;
int score = 0;
Player player1;
int speed = 10;
boolean died = false;
int xD, yD;

void setup()
{
	path = sketchPath(music);
    file = new SoundFile(this, path);
    file.play();
    path2 = sketchPath(music2);
    file2 = new SoundFile(this, path2);
	nbrLines = widthB/widthS;
	nbrCols = heightB/heightS;
	player1 = new Player();
	generateFood();
	size(1200, 600);
}

void generateFood()
{
	xD = floor(random(25, 1000)/widthS)*widthS - 10;
	yD = floor(random(25, heightB)/heightS)*heightS - 10;
}

void drawFood()
{
	fill(228, 0, 0);
	noStroke();
	ellipse(xD - 2, yD - 2, 20, 20);
}

void verif()
{
	boolean so = false;
	switch(player1.dir)
	{
		case 0: //up
			if (player1.pos.get(0).x < xD && player1.pos.get(0).x + widthS > xD && player1.pos.get(0).y < yD && player1.pos.get(0).y + heightS > yD)
			{
				so = true;
			}
			break;
		case 1: //down
			if (player1.pos.get(0).x < xD && player1.pos.get(0).x + widthS > xD && player1.pos.get(0).y > yD && player1.pos.get(0).y - heightS < yD)
			{
				so = true;
			}
			break;
		case 2: //right
			if (player1.pos.get(0).x > xD && player1.pos.get(0).x - widthS < xD && player1.pos.get(0).y < yD && player1.pos.get(0).y + heightS > yD)
			{
				so = true;
			}
			break;
		case 3: //left
			if (player1.pos.get(0).x < xD && player1.pos.get(0).x + widthS > xD && player1.pos.get(0).y < yD && player1.pos.get(0).y + heightS > yD)
			{
				so = true;
			}
			break;
	}
	if (so)
	{
		score ++;
		player1.addPart();
		generateFood();
		file2.play();
	}
}

void draw()
{
	died = player1.verif();
	verif();
	if (!died)
	{
		frameRate(speed);
		background(54, 54, 54);
		drawFood();
		player1.show();
		noFill();
		stroke(225);
		strokeWeight(2);
		for (int i = 0 ; i < nbrLines ; i++)
		{
			for (int j = 0 ; j < nbrCols ; j++)
			{
				rect(i*widthS, j*heightS, widthS, heightS);
			}
		}
		noStroke();
		fill(0);
		rect(widthB, 0, 1200 - widthB, heightB);
		fill(255);
		textSize(25);
		text("Score : "+ score, widthB + 10 , 30);
	}
	else
	{
		fill(0);
		textSize(70);
		text("YOU DIED", 100, 100);
	}
}

void keyPressed()
{
	switch (keyCode) 
	{
		case UP:
			player1.dir = 0;
			break;
		case DOWN:
			player1.dir = 1;
			break;
		case RIGHT:
			player1.dir = 2;
			break;
		case LEFT:
			player1.dir = 3;
			break;
	}
}
