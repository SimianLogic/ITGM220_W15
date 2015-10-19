using UnityEngine;
using System.Collections;

//CLASSES THAT GET ADDED TO GAMEOBJECTS SHOULD DERIVE FROM MonoBehaviour
//the : means "extends" 
public class Practice06 : MonoBehaviour 
{

	//This is comparable to our setup function in Processing
	void Start () 
	{
		for(int i = 1; i <= 10; i++)
		{
		    Debug.Log(i);
		}
	}
	
	//This is comparable to our draw function in Processing
	void Update () 
	{
		
	}
}
