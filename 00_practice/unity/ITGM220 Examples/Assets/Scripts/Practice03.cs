using UnityEngine;
using System.Collections;

//CLASSES THAT GET ADDED TO GAMEOBJECTS SHOULD DERIVE FROM MonoBehaviour
//the : means "extends" 
public class Practice03 : MonoBehaviour 
{

	//This is comparable to our setup function in Processing
	void Start () 
	{
		//in C# your float literals have to end with the letter 'f'
		float x = 7f;
		Debug.Log("Hello World Float " + x);
	}
	
	//This is comparable to our draw function in Processing
	void Update () {
		
	}
}
