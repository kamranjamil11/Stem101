using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class GameScene : MonoBehaviour
{
    [SerializeField]
    private Camera bike_Camera;
    [SerializeField]
    public GameObject start_Popup,info_Popup;
    public GameObject arraow;
    public Text startPopup_Text, infoPopup_Text;
    bool isTrue;
    //public GameObject indicator_Obj;
    public GameObject player, complete_Popup;
    public Levels[] levels;
    public static GameScene instance;
    // Start is called before the first frame update
    void Start()
    {
        // bike_Camera.enabled=true;
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
    public void CutSceneComplete()
    {
       StartCoroutine(PopupOpen());
    }
    IEnumerator PopupOpen()
    {
        yield return new WaitForSeconds(3f);
        if (levels[GameManager.level_Num].cutscene_Num != 5)
        {
            //if (levels[GameManager.level_Num].cutscene_Num < 5)
            infoPopup_Text.text = levels[GameManager.level_Num].info_Text[levels[GameManager.level_Num].cutscene_Num];
            info_Popup.SetActive(true);
        }
        else 
        {
            levels[GameManager.level_Num].eng_Connect_Popup.SetActive(true);
        }
    }
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
                        // levels[GameManager.level_Num].cut_Scene3.SetActive(false);            
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
                       // player.SetActive(true);
                        info_Popup.SetActive(false);
                        levels[GameManager.level_Num].circuit1.SetActive(true);
                       // levels[GameManager.level_Num].target_Obj.SetActive(true);
                       // isTrue = true;
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
               // isTrue = true;
               // player.SetActive(true);
                levels[GameManager.level_Num].cut_Scene1.SetActive(true);
               // levels[GameManager.level_Num].cutscene_Num = 1;
                break;
        }
       
        start_Popup.SetActive(false);   
    }
    public void PushButtonClick()
    {
        levels[GameManager.level_Num].circuit3.SetActive(false);
        levels[GameManager.level_Num].cut_Scene2.SetActive(true);
        levels[GameManager.level_Num].target_Obj1.SetActive(true);
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
