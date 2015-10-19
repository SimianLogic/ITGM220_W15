using UnityEngine;
using System.Collections;

//CLASSES THAT GET ADDED TO GAMEOBJECTS SHOULD DERIVE FROM MonoBehaviour
//the : means "extends" 
public class Practice09 : MonoBehaviour 
{

	//This is comparable to our setup function in Processing
	void Start () 
	{
		//setting the size doesn't make as much in unity -- by default
		//your game will run in "Free Aspect" -- which means any 
		//resolution. Depending on your platform, you can go to 
		// File -> Build Settings -> Player Settings and restrict
		//to specific aspect ratios

		Debug.Log("SCREEN IS " + Screen.width + "x" + Screen.height);
	}
	
	//This is comparable to our draw function in Processing
	void Update () {
		
	}
}
