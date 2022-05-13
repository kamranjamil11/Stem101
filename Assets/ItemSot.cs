using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;
using DG.Tweening;


public class ItemSot : MonoBehaviour,IDropHandler
{
    public bool connected=false;
    CircuitController ciruit_Controller;
    private void Start()
    {
        ciruit_Controller = FindObjectOfType<CircuitController>();
    }
    public void OnDrop(PointerEventData eventData)
    {
        if (eventData.pointerDrag != null)
        {
            if (eventData.pointerDrag.gameObject.name==gameObject.name)
            {
                eventData.pointerDrag.GetComponent<RectTransform>().position = eventData.pointerDrag.GetComponent<DragDrop>().posImage;              
                connected = true;
                GetComponent<RectTransform>().GetComponent<Image>().DOFade(1, 0.1f);
                CircuitController.counter++;
                Debug.Log("CircuitController.counter:" + CircuitController.counter);
               
                switch (transform.parent.gameObject.name)
                {
                    case "Level1_Circuit1":
                        if (CircuitController.counter == 6) 
                        {
                            ciruit_Controller.game_Scene.levels[GameManager.level_Num].circuit1.SetActive(false);
                            ciruit_Controller.target.SetActive(true);
                            ciruit_Controller.game_Scene.CutSceneComplete();                            
                            ciruit_Controller.game_Scene.levels[GameManager.level_Num].cutscene_Num = 2;
                            CircuitController.counter = 0;
                        }
                        break;
                    case "Level1_Circuit2":
                        if (CircuitController.counter == 2)
                        {
                            ciruit_Controller.game_Scene.levels[GameManager.level_Num].cut_Scene3.SetActive(false);
                            ciruit_Controller.game_Scene.levels[GameManager.level_Num].cut_Scene4.SetActive(true);
                            ciruit_Controller.game_Scene.levels[GameManager.level_Num].circuit2.SetActive(false);                           
                            ciruit_Controller.target.SetActive(true);                          
                        }
                        break;
                    case "Level2_Circuit1":
                        if (CircuitController.counter == 4)
                        {
                            ciruit_Controller.game_Scene.levels[GameManager.level_Num].circuit1.GetComponent<CircuitController>().switchON.GetComponent<Button>().enabled = true;                         
                        }
                        break;
                    case "Level3_Circuit1":
                        if (CircuitController.counter == 4)
                        {
                            ciruit_Controller.game_Scene.levels[GameManager.level_Num].circuit1.GetComponent<CircuitController>().switchON.GetComponent<Button>().enabled = true;                            
                        }
                        break;
                    case "Level3_Circuit2":
                        if (CircuitController.counter == 1)
                        {
                            StartCoroutine(Level3Complete());
                            ciruit_Controller.game_Scene.levels[GameManager.level_Num].circuit2.GetComponent<CircuitController>().bikeHeadLight.GetComponent<Animator>().enabled = true;
                        }
                        break;
                }
            }            
        }
    }
    IEnumerator Level3Complete()
    {
        yield return new WaitForSeconds(3f);      
        ciruit_Controller.game_Scene.levels[GameManager.level_Num].eng_Connect_Popup.SetActive(true);
        ciruit_Controller.target.SetActive(false);
    }
    IEnumerator GarageOpen()
    {
        yield return new WaitForSeconds(2f);
        ciruit_Controller.game_Scene.levels[GameManager.level_Num].circuit1.SetActive(true);
    }
    
}
