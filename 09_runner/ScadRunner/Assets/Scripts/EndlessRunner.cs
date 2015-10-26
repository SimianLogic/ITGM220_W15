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

	private int totalPlatforms = 0;

	// Use this for initialization
	void Start () 
	{
		startPosition = mainCharacter.transform.position;

		//to subscribe to a Signal, we use += and the name of the function
		mainCharacter.OnTrigger += OnDudeTrigger;
		mainCharacter.OnCollide += OnDudeCollide;

		//add a sane first platform guaranteed
		GameObject obj = Instantiate(Resources.Load("Platform")) as GameObject;
		totalPlatforms = 1;

		AddPlatforms();
	}

	//each time this is called, we'll extend our level by numPlatforms new platforms
	void AddPlatforms()
	{
		for(int i = totalPlatforms; i < totalPlatforms + numPlatforms-1; i++)
		{
			//we're going to select one randomly from this list. to increase the probability of one
			//type over another, include it more than once!
			string[] platforms = {"Platform", "Platform", "Platform", "Blocky", "Gap"};
			int which_platform = Random.Range(0, platforms.Length);
			GameObject obj = Instantiate(Resources.Load(platforms[which_platform])) as GameObject;	
			obj.transform.Translate(Vector3.right * platformSpacingX*i);
			obj.transform.Translate(Vector3.up * Random.Range(-platformSpacingY, platformSpacingY));	
			
		}

		goal = Instantiate(Resources.Load("Goal")) as GameObject;	
		goal.transform.Translate(Vector3.right * platformSpacingX*(totalPlatforms + numPlatforms-1));


		totalPlatforms += numPlatforms;
	}

	void OnDudeCollide(Collision2D collision)
	{
		if(collision.collider is EdgeCollider2D)
		{
			Debug.Log("HIT A WALL");
			ResetCharacter();
		}
	}

	void OnDudeTrigger(Collider2D collider)
	{
		if(collider.gameObject == goal)
		{
			// Debug.Log("GOOOOOAL");
			AddPlatforms();
		}
	}
	
	// Update is called once per frame
	void Update () 
	{

		if(mainCharacter.transform.position.y < -2)
		{
			ResetCharacter();
		}

	}

	void ResetCharacter()
	{
		Debug.Log("YOU RAN " + mainCharacter.transform.position.x + " Meters");
		
		mainCharacter.transform.position = startPosition;
		mainCharacter.GetComponent<Rigidbody2D>().velocity = new Vector2(Dude.START_VELOCITY,0);
	}
}
