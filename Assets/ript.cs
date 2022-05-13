using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class ript : MonoBehaviour
{
    // Start is called before the first frame update
    public GameObject target;
    void Start()
    {
        this.GetComponent<NavMeshAgent>().SetDestination(target.transform.position);
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
