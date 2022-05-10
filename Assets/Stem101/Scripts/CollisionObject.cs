using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CollisionObject : MonoBehaviour
{
    [SerializeField]
    private GameScene game_Scene;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.tag.Contains("TargetObj"))
        {
            
            switch (GameManager.level_Num)
            {
                case 0:
                    game_Scene.levels[GameManager.level_Num].cutscene_Num = 1;
                    game_Scene.levels[GameManager.level_Num].cut_Scene2.SetActive(true);
                    break;
                case 1:                 
                    game_Scene.levels[GameManager.level_Num].cut_Scene1.SetActive(true);
                    break;
            }
            game_Scene.player.SetActive(false);            
            game_Scene.levels[GameManager.level_Num].target_Obj.SetActive(false);
        }
    }

    //IEnumerator IndicatorActive()
    //{
    //    yield return new WaitForSeconds(3f);
    //   // game_Scene.indicator_Obj.SetActive(true);
    //}
}
