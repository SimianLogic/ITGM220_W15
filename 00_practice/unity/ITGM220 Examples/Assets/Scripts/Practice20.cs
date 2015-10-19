using UnityEngine;
using System.Collections;

 
public class Practice20 : MonoBehaviour 
{
	public Sprite boxSprite; //EDITOR

	public int gridWidth;	//EDITOR
	public int gridHeight;	//EDITOR

	private SpriteRenderer[,] grid;

	private float updateTimer = 0f;
	private const float TIME_BETWEEN_SWITCHES = 0.25f;

	//This is comparable to our setup function in Processing
	void Start () 
	{

		grid = new SpriteRenderer[gridWidth,gridHeight];

		float start_x = -4;
		float start_y = -4;

		for(int i = 0; i < gridWidth; i++)
		{
			for(int j = 0; j < gridHeight; j++)
			{
				bool roll = getRandom();

				GameObject node = new GameObject();
				SpriteRenderer sprite = node.AddComponent<SpriteRenderer>();
				sprite.sprite = boxSprite;

				float goal_width = Mathf.Abs(start_x)*2;
				float goal_height = Mathf.Abs(start_y)*2;

				float tile_width = goal_width / gridWidth;
				float tile_height = goal_height / gridHeight;

				float w = tile_width / 5f;
				float h = tile_height / 5f;

				float x = start_x + i*w*5f;
				float y = start_y + j*h*5f;

				node.transform.localScale = new Vector2(w,h);
				node.transform.position = new Vector2(x,y);

				if(roll)
				{
					sprite.color = Color.white;
				}else{
					sprite.color = Color.black;
				}

				grid[i,j] = sprite;

				//add it to our display tree
				node.transform.parent = this.transform;
				
			}
		}
	}

	bool getRandom()
	{
		if(Random.Range(0,2) == 1)
		{
			return true;
		}
		return false;
	}
	
	//This is comparable to our draw function in Processing
	void Update () 
	{
		updateTimer += Time.deltaTime;
		if(updateTimer < TIME_BETWEEN_SWITCHES)
		{
			return;
		}

		updateTimer -= TIME_BETWEEN_SWITCHES;
		for(int i = 0; i < gridWidth; i++)
		{
			for(int j = 0; j < gridHeight; j++)
			{
				bool roll = getRandom();
				if(roll)
				{
					grid[i,j].color = Color.white;
				}else{
					grid[i,j].color = Color.black;
				}
			}
		}
		
	}
}
