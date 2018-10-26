class Player
{	
	ArrayList<PVector> pos;
	int length;
	int dir;
	/*
	* dir == 0 --> up
	* dir == 1 --> down
	* dir == 2 --> right
	* dir == 3 --> left
	*/

	Player()
	{
		length = 1;
		dir = 2;
		pos = new ArrayList<PVector>();
		pos.add(new PVector(75, 75));
	}

	boolean verif()
	{
		if (pos.get(0).x < 0 || pos.get(0).x > 1000 || pos.get(0).y < 0 || pos.get(0).y > Snake.heightB)
		{
			return true;
		}
		else {
			for (int i = 1 ; i < length ; i++)
			{
				if (pos.get(0).x == pos.get(i).x && pos.get(0).y == pos.get(i).y)
					return true;
			}
			
		}
		return false;
	}
	void addPart()
	{
		pos.add(new PVector(pos.get(length-1).x, pos.get(length-1).y));
		length++;
	}

	void show()
	{
		fill(0, 0, 225);
		noStroke();
		for (PVector v : pos)
		{
			rect(v.x, v.y, Snake.widthS - 2, Snake.heightS - 2);
		}

		for (int i = length - 1 ; i > 0 ; i--)
		{
			pos.get(i).x = pos.get(i-1).x;
			pos.get(i).y = pos.get(i-1).y;
		}

		switch (dir) 
		{
			case 0:
				pos.get(0).y -= Snake.heightS;
				break;
			case 1:
				pos.get(0).y += Snake.heightS;
				break;
			case 2:
				pos.get(0).x += Snake.widthS;
				break;
			case 3:
				pos.get(0).x -= Snake.widthS;
				break;

		}
	}
}
