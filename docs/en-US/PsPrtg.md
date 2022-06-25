---
Module Name: PsPrtg
Module Guid: 7a6956df-7136-48c4-a32e-5f2307ec9603
Download Help Link: {{ Update Download Link }}
Help Version: 1.0.3
Locale: en-US
---

# PsPrtg Module
## Description
Use Paessler PRTG Network Monitor

## PsPrtg Cmdlets
### [New-PrtgXmlResult](New-PrtgXmlResult.md)

New-PrtgXmlResult [-Channel] <string> [-Value] <string> [[-Unit] <string>] [[-CustomUnit] <string>] [[-ShowChart] <int>] [[-MaxError] <string>] [[-MinError] <string>] [[-MaxWarn] <string>] [[-MinWarn] <string>] [-Warning] [<CommonParameters>]


### [New-PrtgXmlSensorOutput](New-PrtgXmlSensorOutput.md)

New-PrtgXmlSensorOutput [[-PrtgXmlResult] <string[]>] [[-IssueDetected] <bool>] [<CommonParameters>]


### [Send-PrtgXmlSensorOutput](Send-PrtgXmlSensorOutput.md)

Send-PrtgXmlSensorOutput [[-XmlOutput] <string>] [[-PrtgProbe] <string>] [[-PrtgSensorProtocol] <string>] [[-PrtgSensorPort] <int>] [[-PrtgSensorToken] <string>]



