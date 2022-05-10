using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using DG.Tweening;

public class AutoMoveToNext : MonoBehaviour
{
    // Start is called before the first frame update
    public int index;
    public GameManager gameManager;
    public GameObject faderPanel;
    void OnEnable()
    {
        Invoke("Switch", 2f);
    }

    // Update is called once per frame
    void Update()
    {
        
    }
    void Switch()
    {
        this.gameObject.SetActive(false);
        gameManager.PanelSwitch(index);
        //faderPanel.SetActive(true);
        //faderPanel.GetComponent<Image>().DOFade(0, 2.5f).OnComplete(FadeOut);
    }
    void FadeOut()
    {
        faderPanel.SetActive(false);
        //faderPanel.GetComponent<Image>().DOFade(255, 0f);
    }
}
