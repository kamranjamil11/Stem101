using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using DG.Tweening;

public class GameManager : MonoBehaviour
{
    public static int level_Num;
    // Start is called before the first frame update

    /*0 - Loading
        
    0  Loading
    1  MainMenu
    2  LevelSelection
    3  SimpleSeriesCircuit
    4  LED's
    5  BikeCustomization
    6  Your Turn
    7  Connect
    8  Congratulations
    9  Wire a switch
    10 Connect with three pics
    11 Parallel Circuit
    12 Connect with erica and pat
    13 CONNECTIONS PROGRAM

    */
    public GameObject[] panels;
    public GameObject faderPanel;
   
    void OnEnable()
    {
        for (int i = 0; i < panels.Length; i++)
        {
            panels[i].SetActive(false);
        }
        panels[0].SetActive(true);
        Invoke("LoadingComplete", 1f);
    }
    void LoadingComplete()
    {
        for (int i = 0; i < panels.Length; i++)
        {
            panels[i].SetActive(false);
        }
        panels[13].SetActive(true);
        //faderPanel.SetActive(true);
        //faderPanel.GetComponent<Image>().DOFade(0, 2.5f).OnComplete(FadeOut);

    }
    public void PanelSwitch(int index)
    {

        for (int i = 0; i < panels.Length; i++)
        {
            panels[i].SetActive(false);
        }
        panels[index].SetActive(true);
        //faderPanel.SetActive(true);
        //faderPanel.GetComponent<Image>().DOFade(0, 2.5f).OnComplete(FadeOut);
    }
   void FadeOut()
    {
        faderPanel.SetActive(false);
        faderPanel.GetComponent<Image>().DOFade(255, 3f);
    }
}
