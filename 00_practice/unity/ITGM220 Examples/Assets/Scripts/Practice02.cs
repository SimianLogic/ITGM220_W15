using UnityEngine;
using System.Collections;

//CLASSES THAT GET ADDED TO GAMEOBJECTS SHOULD DERIVE FROM MonoBehaviour
//the : means "extends" 
public class Practice02 : MonoBehaviour 
{

	//This is comparable to our setup function in Processing
	void Start () 
	{
		int x = 7;
		Debug.Log("Hello World " + x);
	}
	
	//This is comparable to our draw function in Processing
	void Update () {
		
	}
}
