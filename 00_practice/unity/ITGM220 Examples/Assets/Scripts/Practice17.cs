using UnityEngine;
using System.Collections;


//Unity doesn't have draw functions, so we take our generic sprite, tint it blue
//and stretch its y-value to be super tall

 
public class Practice17 : MonoBehaviour 
{

	private SpriteRenderer sprite;

	//This is comparable to our setup function in Processing
	void Start () 
	{
		//add a SpriteRenderer to this GameObject in the Unity Editor
		sprite = GetComponent<SpriteRenderer>();
		sprite.color = Color.blue;


		this.transform.localScale = new Vector3(0.2f,1000f,1f);
		Debug.Log("SPRITE: " + sprite.bounds);
	}
	
	//This is comparable to our draw function in Processing
	void Update () 
	{
		//We can get the mouse's location on screen with this function
	     Vector3 mouse_pos = Input.mousePosition;
	     //but converting that to "world" space depends on how far our camera is from the z=0 plane
	     mouse_pos.z = -Camera.main.transform.position.z;

	     // Convert the point from 2D screen space into scene space
	     Vector3 local = Camera.main.ScreenToWorldPoint(mouse_pos);

	     DrawColumn( Mathf.Floor(local.x) );
	 }

	 public void DrawColumn(float x)
	 {
	 	//use traces to figure out how big your scene is

	 	Debug.Log("X = " + x);
	    Vector3 new_loc = new Vector3(x, this.transform.position.y, this.transform.position.z);

	    //you have to set the whole transform at once, not just an x/y value
	    this.transform.position = new_loc;

	    if(x > -1 && x < 1)
	    {
	    	sprite.color = Color.red;
	    }else{
	    	sprite.color = Color.blue;
	    }
	}
}
