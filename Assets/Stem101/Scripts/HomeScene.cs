using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class HomeScene : MonoBehaviour
{
    public string scene_Name;
    public GameObject lvl_Selection,bike_Cutomization;
    // Start is called before the first frame update
    void Start()
    {
    }
    public void LevelSelection(int lvl_Id)
    {
        lvl_Selection.SetActive(false);
        bike_Cutomization.SetActive(true);
        GameManager.level_Num = lvl_Id;
    }
    public void NextScene()
    {
        SceneManager.LoadScene(scene_Name);
    }
}

