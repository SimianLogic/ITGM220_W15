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
		Player.shotsTaken = 0;

		switch(button_name)
		{
			case "Level_1":
				Player.level = 1;

				//TODO: MAKE L1 and load that instead
				Application.LoadLevel("golf_01");
				break;

			case "Level_2":
				Player.level = 2;
				
				//TODO: MAKE L1 and load that instead
				Application.LoadLevel("golf_02");
				break;

			case "Level_3":
				Player.level = 3;
				
				//TODO: MAKE L1 and load that instead
				Application.LoadLevel("golf_03");
				break;

			default:
				Debug.Log("TODO: WIRE UP BUTTON " + button_name);
				break;
		}

	}
}
