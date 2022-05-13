using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class CircuitController : MonoBehaviour
{
    public GameScene game_Scene;
    public ItemSot[] connectionCheck;
    public Sprite bulbOn, bulbOFF;
    public Image Bulb;
    public bool allConnectionEstablish;
    public GameObject switchOff,switchON;
    public static int counter;
    public GameObject bikeHeadLight,target,bikeLED_light;
    
    // Start is called before the first frame update
    void Start()
    {
       // StartCoroutine(ConnectionCheck());
    }

    IEnumerator ConnectionCheck()
    {
        yield return new WaitForSeconds(0.1f);
       // Debug.Log("Counter loop" + counter);      
        if (allConnectionEstablish)
        {
            Bulb.sprite = bulbOn;
            bikeHeadLight.SetActive(true);
        }
        else
        {

            Bulb.sprite = bulbOFF;
            //bikeHeadLight.SetActive(false);
        }

        StartCoroutine(ConnectionCheck());
    }
    public void SwitchOn(bool check)
    {
        Debug.Log("Counter" + counter);
        if (counter >= 4 && check)
        {
            allConnectionEstablish = true;           
            StartCoroutine(GarageOpen());
        }
        switchOff.SetActive(true);
        switchON.SetActive(false);
        bikeLED_light.SetActive(true);
        bikeHeadLight.SetActive(true);
        counter = 0;
    }
    public void SwitchOFF(bool check)
    {
        allConnectionEstablish = check;
        switchOff.SetActive(false);
        switchON.SetActive(true);       
    }
    IEnumerator GarageOpen()
    {             
        switch (GameManager.level_Num)
        {
            case 1:
                yield return new WaitForSeconds(2f);
                target.SetActive(false);
                yield return new WaitForSeconds(2f);
                game_Scene.levels[GameManager.level_Num].eng_Connect_Popup.SetActive(true);
                gameObject.SetActive(false);
                break;
            case 2:
                StartCoroutine(Level3Circuit());              
                //target.SetActive(false);
                break;
        }
             
        
    }
    IEnumerator Level3Circuit()
    {
        yield return new WaitForSeconds(3f);
        game_Scene.levels[GameManager.level_Num].circuit1.SetActive(false);
        game_Scene.levels[GameManager.level_Num].circuit2.SetActive(true);
        //gameObject.SetActive(false);
        //target.SetActive(false);
    }
}
