using UnityEngine;
using System.Collections;


//NOTE: SAME AS 13 -- Unity doesn't really have a concept of "clearing the screen" as
// there are no drawing commands (display tree only)
 
public class Practice14 : MonoBehaviour 
{

	private SpriteRenderer sprite;

	//This is comparable to our setup function in Processing
	void Start () 
	{
		//add a SpriteRenderer to this GameObject in the Unity Editor
		sprite = GetComponent<SpriteRenderer>();
		sprite.color = Color.blue;
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
	     Vector3 new_loc = new Vector3(local.x, local.y, this.transform.position.z);
	     
	     //you have to set the whole transform at once, not just an x/y value
	     this.transform.position = new_loc;


	     if(Input.GetMouseButton(0))
	     {
	     	sprite.color = Color.red;
	     }else{
	     	sprite.color = Color.blue;
	     }
            
	}
}
