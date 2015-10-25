using UnityEngine;
using System.Collections;

public class PlatformDecorator : MonoBehaviour {

	public Sprite[] sprites;

	// Use this for initialization
	void Start () 
	{

		int sprite_count = sprites.Length;
		foreach (Transform child in transform) 
		{
			SpriteRenderer sprite = child.GetComponent<SpriteRenderer>();
			if(sprite != null)
			{
				//we want to MOSTLY use the first sprite and then have some random other guys 
				//mixed in.

				//we can change this number to change how often we get the "regular" sprite
				if(Random.Range(1,101) <= 70)
				{
					sprite.sprite = sprites[0];
				}else{
					int which_extra = Random.Range(1, sprites.Length);
					sprite.sprite = sprites[which_extra];
				}

				//we want the top row to be 100% filled in but the 2nd row to be looser
				//and the 3rd row to be even looser
				if(sprite.gameObject.name == "row2")
				{
					if(Random.Range(1,101) < 60)
					{
						sprite.enabled = false;	
					}
				}

				if(sprite.gameObject.name == "row3")
				{
					if(Random.Range(1,101) < 90)
					{
						sprite.enabled = false;	
					}
				}
				
			}
        }	
	}
	
	// Update is called once per frame
	void Update () 
	{
	
	}
}
