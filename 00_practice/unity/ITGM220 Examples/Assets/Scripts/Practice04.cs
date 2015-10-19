using UnityEngine;
using System.Collections;

//CLASSES THAT GET ADDED TO GAMEOBJECTS SHOULD DERIVE FROM MonoBehaviour
//the : means "extends" 
public class Practice04 : MonoBehaviour 
{

	//This is comparable to our setup function in Processing
	void Start () 
	{
		bool x = true;
		string test1 = "test1";
		string test2 = "test2";

		if(x)
		{
		  Debug.Log(test1);
		}else{
		  Debug.Log(test2);
		}
	}
	
	//This is comparable to our draw function in Processing
	void Update () {
		
	}
}
