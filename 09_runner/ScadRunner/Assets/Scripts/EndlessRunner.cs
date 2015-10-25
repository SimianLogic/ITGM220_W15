using UnityEngine;
using System.Collections;

public class EndlessRunner : MonoBehaviour {

	public Dude mainCharacter;  		//EDITOR
	public int numPlatforms; 			//EDITOR
	public float platformSpacingX;		//EDITOR  -- how wide apart should platforms be?
	public float platformSpacingY;		//EDITOR  -- how high can platforms vary?
	


	//this is our respawn point
	private Vector2 startPosition;
	private GameObject goal;



	// Use this for initialization
	void Start () 
	{
		startPosition = mainCharacter.transform.position;

		for(int i = 0; i < numPlatforms-1; i++)
		{
			GameObject obj = Instantiate(Resources.Load("Platform")) as GameObject;	
			obj.transform.Translate(Vector3.right * platformSpacingX*i);
			
			//we always want the first platform to be in the respawn point
			if(i > 0)
			{
				obj.transform.Translate(Vector3.up * Random.Range(-platformSpacingY, platformSpacingY));	
			}
			
		}

		goal = Instantiate(Resources.Load("Goal")) as GameObject;	
		goal.transform.Translate(Vector3.right * platformSpacingX*(numPlatforms-1));

		//to subscribe to a Signal, we use += and the name of the function
		mainCharacter.OnTrigger += OnDudeTrigger;
	}

	void OnDudeTrigger(Collider2D collider)
	{
		if(collider.gameObject == goal)
		{
			Debug.Log("GOOOOOAL");
		}
	}
	
	// Update is called once per frame
	void Update () 
	{
		
		if(mainCharacter.transform.position.y < -2)
		{
			mainCharacter.transform.position = startPosition;
			mainCharacter.GetComponent<Rigidbody2D>().velocity = new Vector2(0,0);
		}

	}
}
