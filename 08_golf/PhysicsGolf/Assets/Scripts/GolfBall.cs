using UnityEngine;
using System.Collections;
using UnityEngine.UI;  //needed for text

public class GolfBall : MonoBehaviour 
{
	[Header("My Config")]
	public SpriteRenderer arrow; 	//UNITY EDITOR -- our arrow sprite for visual feedback
	public float throwMultiplier; 	//UNITY EDITOR -- how hard should we multiply our pullback strength?
	public Text shotsTakenLabel;	//UNITY EDITOR -- pointer to our score text
	public Text levelLabel;			//UNITY EDITOR -- pointer to our level text
	public Text instructions;		//UNITY EDITOR -- pointer to our instructions

	private float clickX;
	private float clickY;
	private bool isDragging = false;

	private Rigidbody2D rigidBody;

	private const float MIN_ARROW_SCALE = 4.0f;
	private const float MAX_ARROW_SCALE = 20.0f;

	//just to cache how far we've pulled back so we don't have to re-compute it after we release the mouse
	private float pullbackStrength;
	private float pullbackAngle;

	private int shots = 0;
	private bool isInGoal = false;

	private const float WIN_COOLDOWN = 0.5f;
	private float winCooldown = WIN_COOLDOWN;

	// Use this for initialization
	void Start () 
	{
		rigidBody = GetComponent<Rigidbody2D>();

		levelLabel.text = "LEVEL " + Player.level;

		//turn off our arrow!
		arrow.enabled = false;
	}

	//this fires every time we enter a trigger... in our golf game we only have one trigger!
	void OnTriggerEnter2D(Collider2D other)
	{
		SpriteRenderer sprite = other.gameObject.GetComponent<SpriteRenderer>();
		sprite.color = Color.green;

		isInGoal = true;
	}

	//this fires every time we enter a trigger... in our golf game we only have one trigger!
	void OnTriggerExit2D(Collider2D other)
	{
		SpriteRenderer sprite = other.gameObject.GetComponent<SpriteRenderer>();
		sprite.color = Color.red;

		isInGoal = false;
	}

	
	// Update is called once per frame
	void Update () 
	{
		//are we still moving? don't let us fire another shot!
		if(rigidBody.IsAwake())
		{
			return;
		}else{
			//asleep measn we've stopped moving!
			if(!isDragging)
			{
				instructions.enabled = true;	
			}
			


			//if we're asleep AND we're in the goal... VICTORY
			if(isInGoal)
			{
				winCooldown -= Time.deltaTime;

				if(winCooldown <= 0)
				{
					Debug.Log("YOU WIN!");	
					//set our static shotsTaken, we'll need this for the game over screen
					Player.shotsTaken = shots;

					Application.LoadLevel("golf_menu");
					//TODO: CREATE A GAME OVER SCENE AND TRANSITION TO THAT SCENE INSTEAD
				}
				
				return;
				
			}
		}



		Vector3 mouse_pos = Input.mousePosition;
	    mouse_pos.z = -Camera.main.transform.position.z;
     	Vector3 local = Camera.main.ScreenToWorldPoint(mouse_pos);

     	if(isDragging == false && Input.GetMouseButton(0))
	     {
	     	Debug.Log("START DRAG");
	     	//turn on our arrow!
	     	arrow.enabled = true;
	     	arrow.transform.localScale = new Vector3(MIN_ARROW_SCALE,MIN_ARROW_SCALE,1f);

	     	isDragging = true;
	     	clickX = local.x;
	     	clickY = local.y;

	     	instructions.enabled = false;

	     }else if(isDragging && !Input.GetMouseButton(0)){
	     	Debug.Log("STOP DRAG -- MOVE THE BALL");

	     	isDragging = false;
	     	arrow.enabled = false;

	     	float angle_in_rads = Mathf.Deg2Rad * pullbackAngle;
	     	float force_x = Mathf.Cos(angle_in_rads) * pullbackStrength * throwMultiplier;
	     	float force_y = Mathf.Sin(angle_in_rads)*pullbackStrength * throwMultiplier;
	     	Vector2 force = new Vector2(force_x, force_y);

	     	rigidBody.AddForce(force);

	     	shots += 1;
	     	shotsTakenLabel.text = "SHOTS TAKEN: " + shots;

	     }else if(isDragging){

	     	// Debug.Log("DRAGGING");

	     	//adjust our circle
	     	float dx = local.x - clickX;
	     	float dy = local.y - clickY;

	     	float diameter = Mathf.Sqrt(dx*dx + dy*dy)*10f;

	     	pullbackStrength = Mathf.Clamp(diameter, MIN_ARROW_SCALE, MAX_ARROW_SCALE);
	     	arrow.transform.localScale = new Vector3(pullbackStrength,pullbackStrength,1f);

	     	pullbackAngle = -Mathf.Atan2(dx, dy) * Mathf.Rad2Deg - 90f;;
	     	arrow.transform.localEulerAngles = new Vector3(0f,0f,pullbackAngle);

	     }
	}
}
