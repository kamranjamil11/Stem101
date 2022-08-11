using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using DG.Tweening;

public class GameScene : MonoBehaviour
{
    [SerializeField]
    private Camera bike_Camera;
    [SerializeField]
    public GameObject start_Popup,info_Popup;
    public GameObject arraow;
    public Text startPopup_Text, infoPopup_Text;
    bool isTrue;
    public GameObject player, complete_Popup;
    public Levels[] levels;
    public static GameScene instance;
    public GameObject cube;
    public GameObject[] game_Levels;
    // Start is called before the first frame update
    void Start()
    {
        foreach (var item in game_Levels)
        {
            item.SetActive(false);
        }
        game_Levels[GameManager.level_Num].SetActive(true);
        levels[GameManager.level_Num].Cutscene_Camera.enabled = true;
        if (levels[GameManager.level_Num].isStart_Popup)
        {
            start_Popup.SetActive(true);
            if (GameManager.level_Num > 0)
                startPopup_Text.text = levels[GameManager.level_Num].info_Text[levels[GameManager.level_Num].cutscene_Num];
        }
        else 
        {
            levels[GameManager.level_Num].cut_Scene1.SetActive(true);
        }
    }
    private void FixedUpdate()
    {
        if (isTrue)
            arraow.transform.LookAt(levels[GameManager.level_Num].target_Obj.transform);
       
    }
    //...............................CutScene is called before the task start and after complete the task
    public void CutSceneComplete()
    {
       StartCoroutine(PopupOpen());
    }
    //...............................CutScene popup opened
    IEnumerator PopupOpen()
    {
        yield return new WaitForSeconds(3f);
        if (levels[GameManager.level_Num].cutscene_Num != 5)
        {         
            infoPopup_Text.text = levels[GameManager.level_Num].info_Text[levels[GameManager.level_Num].cutscene_Num];
            info_Popup.SetActive(true);
        }
        else 
        {
            levels[GameManager.level_Num].eng_Connect_Popup.SetActive(true);
        }
    }
    //...............................Accept method is called to accept the task 
    public void AcceptBtn()
    {
        switch (GameManager.level_Num)
        {
            case 0:
                switch (levels[GameManager.level_Num].cutscene_Num)
                {
                    case 0:
                        player.SetActive(true);
                        info_Popup.SetActive(false);
                        levels[GameManager.level_Num].cut_Scene1.SetActive(false);
                        levels[GameManager.level_Num].target_Obj.SetActive(true);
                        isTrue = true;
                        break;
                    case 1:
                        levels[GameManager.level_Num].circuit1.SetActive(true);
                        info_Popup.SetActive(false);
                        break;
                    case 2:
                        levels[GameManager.level_Num].circuit2.SetActive(false);
                        levels[GameManager.level_Num].cut_Scene2.SetActive(false);
                        levels[GameManager.level_Num].cut_Scene3.SetActive(true);
                        info_Popup.SetActive(false);
                        levels[GameManager.level_Num].cutscene_Num = 3;
                        break;
                    case 3:                              
                        levels[GameManager.level_Num].circuit2.SetActive(true);
                        info_Popup.SetActive(false);
                        levels[GameManager.level_Num].cutscene_Num = 4;
                        break;
                    case 4:
                        levels[GameManager.level_Num].cut_Scene3.SetActive(false);
                        levels[GameManager.level_Num].cut_Scene4.SetActive(false);
                        levels[GameManager.level_Num].cut_Scene2.SetActive(true);
                        levels[GameManager.level_Num].circuit3.SetActive(true);
                        info_Popup.SetActive(false);
                        levels[GameManager.level_Num].cutscene_Num = 5;
                        break;

                }
                break;
            case 1:
                switch (levels[GameManager.level_Num].cutscene_Num)
                {
                    case 0:                      
                        info_Popup.SetActive(false);
                        levels[GameManager.level_Num].circuit1.SetActive(true);                      
                        break;
                    case 1:
                        levels[GameManager.level_Num].circuit1.SetActive(true);
                        info_Popup.SetActive(false);
                        break;
                    case 2:
                        levels[GameManager.level_Num].circuit2.SetActive(false);
                        levels[GameManager.level_Num].cut_Scene2.SetActive(false);
                        levels[GameManager.level_Num].cut_Scene3.SetActive(true);
                        info_Popup.SetActive(false);
                        levels[GameManager.level_Num].cutscene_Num = 3;
                        break;                   
                }
                break;
            case 2:
                switch (levels[GameManager.level_Num].cutscene_Num)
                {
                    case 0:
                        info_Popup.SetActive(false);
                        levels[GameManager.level_Num].circuit1.SetActive(true);
                        break;
                }
                break;
        }
       
        print("cutscene_Num"+ levels[GameManager.level_Num].cutscene_Num);
    }
    //...............................StartPopup method is called in the start of the game
    public void StartPopup()
    {
        switch (GameManager.level_Num)
        {
            case 0:
                levels[GameManager.level_Num].cut_Scene1.SetActive(true);
                break;
            case 1:
                isTrue = true;
                player.SetActive(true);
                levels[GameManager.level_Num].target_Obj.SetActive(true);
                levels[GameManager.level_Num].cutscene_Num = 1;
                break;
            case 2:             
                levels[GameManager.level_Num].cut_Scene1.SetActive(true);            
                break;
        }
       
        start_Popup.SetActive(false);   
    }
    //...............................PushButton method is called when the task completed
    public void PushButtonClick()
    {
        levels[GameManager.level_Num].circuit3.SetActive(false);
        levels[GameManager.level_Num].cut_Scene2.SetActive(true);
        levels[GameManager.level_Num].target_Obj1.SetActive(true);
    }
    //...............................NextScene method is called to load the next level
    public void NextScene()
    {
        GameManager.level_Num++;
    }

}
[System.Serializable]
public class Levels 
{
    public Camera Cutscene_Camera;
    public GameObject circuit1, circuit2, circuit3;
    public GameObject cut_Scene1, cut_Scene2, cut_Scene3, cut_Scene4;
    public string[] info_Text;
    public GameObject target_Obj, target_Obj1;
     public GameObject eng_Connect_Popup;
    public int cutscene_Num;
    public bool isStart_Popup;
}
