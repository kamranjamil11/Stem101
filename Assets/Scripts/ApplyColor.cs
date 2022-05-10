using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ApplyColor : MonoBehaviour
{
    // Start is called before the first frame update
    public FlexibleColorPicker fcp;
    public Material[] mat;
    Material[] tempMat;
    public GameObject[] matObj;
    int index;
    void Start()
    {
        
    }
    public void Forward()
    {
        if (index == 2)
            index = -1;
        index++;
        for (int i = 0; i < matObj.Length; i++)
        {
            tempMat= matObj[i].GetComponent<Renderer>().materials;
            tempMat[0] = mat[index];
            matObj[i].GetComponent<Renderer>().materials = tempMat;
        }


    }
    public void Backward()
    {
        if (index == 0)
            index = 3;
          index--;
       
        for (int i = 0; i < matObj.Length; i++)
        {
            tempMat = matObj[i].GetComponent<Renderer>().materials;
            tempMat[0] = mat[index];
            matObj[i].GetComponent<Renderer>().materials = tempMat;
        }
    }


    // Update is called once per frame
    void Update()
    {
        //mat.color = fcp.color;
    }
}
