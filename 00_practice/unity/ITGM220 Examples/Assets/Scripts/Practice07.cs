using UnityEngine;
using System.Collections;
using System.Collections.Generic;  //this is required for list

//CLASSES THAT GET ADDED TO GAMEOBJECTS SHOULD DERIVE FROM MonoBehaviour
//the : means "extends" 
public class Practice07 : MonoBehaviour 
{

	//This is comparable to our setup function in Processing
	void Start () 
	{
		int[] my_array = {0,1,2,3,4,5,6,7,8,9};
		Debug.Log(my_array);

		List<int> my_list = new List<int>() {0,1,2,3,4,5,6,7,8,9};
		Debug.Log(my_list); 
	}
	
	//This is comparable to our draw function in Processing
	void Update () 
	{
		
	}
}
