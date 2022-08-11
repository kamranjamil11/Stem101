using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class HomeScene : MonoBehaviour
{
    public string scene_Name;
    public GameObject lvl_Selection,bike_Cutomization;
    //...............................LevelSelection method is called to select the level.
    public void LevelSelection(int lvl_Id)
    {
        lvl_Selection.SetActive(false);
        bike_Cutomization.SetActive(true);
        GameManager.level_Num = lvl_Id;
    }
    //...............................NextScene method is called to load the gameplay level.
    public void NextScene()
    {
        SceneManager.LoadScene(scene_Name);
    }
}

