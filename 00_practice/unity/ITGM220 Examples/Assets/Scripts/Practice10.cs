using UnityEngine;
using System.Collections;

//CLASSES THAT GET ADDED TO GAMEOBJECTS SHOULD DERIVE FROM MonoBehaviour
//the : means "extends" 
public class Practice10 : MonoBehaviour 
{

	//This is comparable to our setup function in Processing
	void Start () 
	{
    	//NOTE: WE PUT THIS SCRIPT ON THE CAMERA AND NOT AN EMPTY GAME OBJECT

    	//GetComponent gets another class attached to the same GameObject as this Script
    	Camera camera = GetComponent<Camera>();
    	//this tells the camera to do a solid fill (can also have a clear bg)
    	camera.clearFlags = CameraClearFlags.SolidColor;
    	//set the background color
    	camera.backgroundColor = Color.red;

    	//OTHER NOTE: this is just to show how to do this from script...
    	//it's MUCH easier to go edit the properties on the camera node
	}
	
	//This is comparable to our draw function in Processing
	void Update () {
		
	}
}
