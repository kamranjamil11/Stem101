using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;

public class DragDrop : MonoBehaviour,IPointerDownHandler,IPointerUpHandler,IBeginDragHandler,IDragHandler,IDropHandler,IEndDragHandler
{
    private RectTransform rectTransform;
    public Canvas canvas;
    public CanvasGroup canvasGroup;
    public Vector3 posImage;
    Vector3 star_Pos;

    public void OnBeginDrag(PointerEventData eventData)
    {
        //Debug.Log("On begin Drag");
        canvasGroup.alpha = 0.5f;
        canvasGroup.blocksRaycasts = false;

    }
    public void OnEndDrag(PointerEventData eventData)
    {
       // Debug.Log("On end Drag");
        canvasGroup.alpha = 1f;
        canvasGroup.blocksRaycasts = true;

    }

    public void OnDrag(PointerEventData eventData)
    {
        //Debug.Log("On Drag");
       rectTransform.anchoredPosition += eventData.delta / canvas.scaleFactor;
    }

    public void OnDrop(PointerEventData eventData)
    {
       // Debug.Log("On Drop");       
    }

    public void OnPointerDown(PointerEventData eventData)
    {
        star_Pos = transform.position;
       // Debug.Log("On Pointer Down");
    }
    
    public void OnPointerUp(PointerEventData eventData)
    {
         transform.position= star_Pos;
       // Debug.Log("On Pointer Up");
    }
    // Start is called before the first frame update
    void Start()
    {
        rectTransform = GetComponent<RectTransform>();
        posImage = rectTransform.position;
        //Debug.Log("PosImage:"+ posImage);
        //posImage.GetComponent<RectTransform>().anchoredPosition = GetComponent<RectTransform>().anchoredPosition;
    }

   
}
