# esx_gccard
################


CREDITS TO :


GC Gannon for main script

Chubbs for editing it for ESX
Chubbs for editing it for ESX_gcIdentity


################


FXserver ESX GCCard

Credit to GC Gannon for "GCIdentity"

Edited by Chubbs

[INSTALLATION]

1) CD in your resources/[esx] folder
2) Clone the repository


3) Add this in your server.cfg :

```
start esx_gccard
```
To open the identity card just use

```
TriggerEvent("gcl:showItentity", str:Type, ...)
```


```
TriggerEvent("gcl:showItentity", "identity", {
    "firstname": "John",
    "lastname": "Doe",
    "bithday": "XX/XX/XXXX",
    "sex": "M",
    "size": "XXX",
})
```


```
TriggerEvent("gcl:showItentity", "job", {
    "firstname": "John",
    "lastname": "Doe",
    "job_name": "police",
    "job_grade": "Patron"
})
```


```
TriggerEvent("gcl:showItentity", "weaponlicence", {
    "firstname": "John",
    "lastname": "Doe",
    "bithday": "XX/XX/XXXX",
    "sex": "F"
})
```


```
TriggerEvent("gcl:showItentity", "driverlicence", {
    "firstname": "John",
    "lastname": "Doe",
    "bithday": "XX/XX/XXXX",
    "sex": "M"
})
```

![alt text](https://image.prntscr.com/image/CiKwlfZSQSWdhHcnw1x2EQ.png)
