using UnityEngine;
using System.Collections;

 
public class Practice18 : MonoBehaviour 
{
	//BY MAKING THIS PUBLIC, IT SHOWS UP IN EDITOR
	//DRAG THE SPRITE ONTO THIS FIELD
	public SpriteRenderer sprite;

	private float clickX;
	private float clickY;
	private bool isDragging = false;

	//This is comparable to our setup function in Processing
	void Start () 
	{
		//add a circle SpriteRenderer to this GameObject in the Unity Editor
		//and add it to our sprite property


		//hide the circle until we draw
		sprite.enabled = false;
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

	     
	     if(isDragging == false && Input.GetMouseButton(0))
	     {
	     	sprite.enabled = true;

	     	isDragging = true;
	     	clickX = local.x;
	     	clickY = local.y;
	     }else if(isDragging && !Input.GetMouseButton(0)){
	     	isDragging = false;
	     }else if(isDragging){

	     	//adjust our circle
	     	float dx = local.x - clickX;
	     	float dy = local.y - clickY;

	     	sprite.transform.position = new Vector3(clickX + dx/2, clickY + dy/2, 0);

	     	//100 pixels per unit means our sprite is 5x5
	     	float diameter = Mathf.Sqrt(dx*dx + dy*dy)/5;
	     	sprite.transform.localScale = new Vector3(diameter,diameter,1f);
	     }

	 }
}
