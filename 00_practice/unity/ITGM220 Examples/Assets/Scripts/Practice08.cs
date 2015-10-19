using UnityEngine;
using System.Collections;
using System.Collections.Generic;  //this is required for list

//CLASSES THAT GET ADDED TO GAMEOBJECTS SHOULD DERIVE FROM MonoBehaviour
//the : means "extends" 
public class Practice08 : MonoBehaviour 
{

	//This is comparable to our setup function in Processing
	void Start () 
	{

		int[] my_array = new int[10];
		for(int i = 0; i < 10; i++)
		{
		    my_array[i] = i;
		}

		//note that c# doesn't have a pretty array print so this doesn't actually
		//confirm our array values
		Debug.Log(my_array);


		List<int> my_list = new List<int>();
		for(int j = 0; j < 10; j++)
		{
		    my_list.Add(j);
		}
		Debug.Log(my_list);

	}
	
	//This is comparable to our draw function in Processing
	void Update () 
	{
		
	}
}
