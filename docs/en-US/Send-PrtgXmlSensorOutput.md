---
external help file: SimplePrtg-help.xml
Module Name: SimplePrtg
online version:
schema: 2.0.0
---

# Send-PrtgXmlSensorOutput

## SYNOPSIS
Wrapper for Invoke-WebRequest to make it easy to push results to PRTG XML push sensors

## SYNTAX

```
Send-PrtgXmlSensorOutput [[-XmlOutput] <String>] [[-PrtgProbe] <String>] [[-PrtgProtocol] <String>]
 [[-PrtgPort] <Int32>] [[-PrtgToken] <String>]
```

## DESCRIPTION
Use HTTP post to post results to PRTG XML push sensors

## EXAMPLES

### EXAMPLE 1
```
New-PrtgXmlSensorOutput ... |
Send-PrtgXmlSensorOutput -PrtgProtocol 'https' -PrtgProbe 'server1' -PrtgPort 443 -PrtgToken 'e3edd633-3018-4d8a-91b6-d2635b42b85b'
```

Post sensor output to PRTG push sensor e3edd633-3018-4d8a-91b6-d2635b42b85b on server1 using HTTPS on TCP port 443

## PARAMETERS

### -PrtgPort
If all four of the PRTG parameters are specified, then the results will be XML-formatted and pushed to the specified PRTG probe for a push sensor

```yaml
Type: System.Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -PrtgProbe
If all four of the PRTG parameters are specified, then the results will be XML-formatted and pushed to the specified PRTG probe for a push sensor

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PrtgProtocol
If all four of the PRTG parameters are specified, then the results will be XML-formatted and pushed to the specified PRTG probe for a push sensor

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PrtgToken
If all four of the PRTG parameters are specified, then the results will be XML-formatted and pushed to the specified PRTG probe for a push sensor

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -XmlOutput
Valid XML for a PRTG custom XML sensor
Can be created by Format-PrtgXmlSensorOutput

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

### [System.String]$XmlOutput
## OUTPUTS

### Passes through the output of Invoke-WebRequest
## NOTES

## RELATED LINKS
