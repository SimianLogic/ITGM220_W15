using UnityEngine;
using System.Collections;

//CLASSES THAT GET ADDED TO GAMEOBJECTS SHOULD DERIVE FROM MonoBehaviour
//the : means "extends" 
public class Practice11 : MonoBehaviour 
{    
    void Start() 
    {
    	//NOTE: WE PUT THIS SCRIPT ON THE CAMERA AND NOT AN EMPTY GAME OBJECT	
    	Debug.Log("HELLO FROM SETUP");
    }
    
    void Update() 
    {
		Debug.Log("HELLO FROM DRAW");    
    }
}
