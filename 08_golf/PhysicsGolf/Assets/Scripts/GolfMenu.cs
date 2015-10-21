using UnityEngine;
using System.Collections;

public class GolfMenu : MonoBehaviour {

	// Use this for initialization
	void Start () 
	{

	}
	
	// Update is called once per frame
	void Update () 
	{
	
	}

	public void HandleButton(string button_name)
	{
		switch(button_name)
		{
			case "Level_1":
				Player.level = 1;
				Player.shotsTaken = 0;

				//TODO: MAKE L1 and load that instead
				Application.LoadLevel("golf_00");
				break;

			default:
				Debug.Log("TODO: WIRE UP BUTTON " + button_name);
				break;
		}

	}
}
