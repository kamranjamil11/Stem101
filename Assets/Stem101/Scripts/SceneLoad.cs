using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class SceneLoad : MonoBehaviour
{
    public string scene_Name;
    //...............................SceneTransition method is called to load the gameplay scene.
    public void SceneTransition()
    {
        SceneManager.LoadScene(scene_Name);
    }
}
