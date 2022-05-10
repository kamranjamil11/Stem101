using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PenTool : MonoBehaviour
{
    [Header("LINES")]
    [SerializeField] Transform lineParent;
    [SerializeField] GameObject linePrefab;

    [Header("DOTS")]
    [SerializeField] Transform dotParent; 
    [SerializeField] GameObject dotPrefab;

    LineController currentLine;
    void Update()
    {
        if (Input.GetMouseButtonDown(0))
        {
            if ( currentLine == null)
            {
                currentLine = Instantiate(linePrefab, Vector3.zero, Quaternion.identity, lineParent).GetComponent<LineController>();
            }
            GameObject dot = Instantiate(dotPrefab, GetMousePosition(), Quaternion.identity, dotParent);
            currentLine.AddPoint(dot.transform);
        }
    }
    Vector3 GetMousePosition()
    {
       
        Vector3 worldMousePosition = Camera.main.ScreenToWorldPoint(Input.mousePosition);
        worldMousePosition.z = 0;
        return worldMousePosition;
    }
}