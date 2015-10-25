using UnityEngine;
using System.Collections;

public class Dude : MonoBehaviour 
{
	public delegate void CollisionSignalDelegate(Collider2D collision);
	public event CollisionSignalDelegate OnTrigger;

	public Camera camera;

	public Sprite[] walk;
	
	public Sprite idle;
	public Sprite jump;
	public Sprite fall;

	private const float STEP_RATE = 0.20f;
	private float stepTime = 0f;
	private int currentStep = 0;
	
	private SpriteRenderer renderer;

	// Use this for initialization
	void Start () 
	{
		renderer = GetComponent<SpriteRenderer>();
	}

	//when our Dude collies with a trigger, we fire a Signal to anyone listening
	void OnTriggerEnter2D(Collider2D coll)
	{
		if(OnTrigger != null)
		{
			OnTrigger(coll);
		}
	}
	
	// Update is called once per frame
	void Update () 
	{
		camera.transform.position = new Vector3(gameObject.transform.position.x, camera.transform.position.y, camera.transform.position.z);
		bool is_moving = false;

		//get our physics body
		Rigidbody2D body = GetComponent<Rigidbody2D>();
		
		//respond to jump event ONLY if we're not mid-air
		if(body.velocity.y == 0)
		{
			if(Input.GetKeyDown("w") || Input.GetKeyDown("up") || Input.GetKeyDown("space"))
			{
				body.AddForce(new Vector2(0,150f));
			}
		}

		if(Input.GetKey("left") || Input.GetKey("a"))
		{
			gameObject.transform.Translate(Vector3.left * 0.025f);
			gameObject.transform.localScale = new Vector2(-1f,1f);
			is_moving = true;
		}

		if(Input.GetKey("right") || Input.GetKey("d"))
		{
			gameObject.transform.Translate(Vector3.right * 0.025f);
			gameObject.transform.localScale = new Vector2(1f,1f);
			is_moving = true;
		}
		

		//our x/y movement is just applied to the sprite, but our jump movement
		//comes from the physics simulation... so we need to figure out if we're
		//idling, walking, jumping, or falling!
		if(body.velocity.y > 0)
		{
			renderer.sprite = jump;
		}else if(body.velocity.y < 0){
			renderer.sprite = fall;
		}else if(is_moving){
			UpdateWalk();
		}else{
			renderer.sprite = idle;
		}
	}


	void UpdateWalk()
	{
		stepTime += Time.deltaTime;
		if(stepTime > STEP_RATE)
		{
			stepTime -= STEP_RATE;
			currentStep = (currentStep + 1) % walk.Length;
			renderer.sprite = walk[currentStep];
		}
	}
}
