---
external help file: PsPrtg-help.xml
Module Name: PsPrtg
online version:
schema: 2.0.0
---

# New-PrtgXmlSensorOutput

## SYNOPSIS
Assemble the complete output for a PRTG XML sensor

## SYNTAX

```
New-PrtgXmlSensorOutput [[-PrtgXmlResult] <String[]>] [-IssueDetected] [<CommonParameters>]
```

## DESCRIPTION
Combine multiple channels into a single PRTG XML sensor result

## EXAMPLES

### EXAMPLE 1
```
@"
<result>
<channel>Channel123</channel>
<value>Value123</value>
<unit>Custom</unit>
<customUnit>Miles Per Hour</customUnit>
<showchart>$ShowChart</showchart>
</result>
@" |
New-PrtgXmlSensorOutput
```

Generate XML output for a PRTG sensor that will put it in an OK state

### EXAMPLE 2
```
@"
<result>
<channel>Channel123</channel>
<value>Value123</value>
<unit>Custom</unit>
<customUnit>Miles Per Hour</customUnit>
<showchart>0</showchart>
</result>
@" |
New-PrtgXmlSensorOutput -IssueDetected
```

Generate XML output for a PRTG sensor that will put it in an alarm state

## PARAMETERS

### -IssueDetected
{{ Fill IssueDetected Description }}

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -PrtgXmlResult
{{ Fill PrtgXmlResult Description }}

```yaml
Type: System.String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### [System.String]$PrtgXmlResult
## OUTPUTS

### [System.String] Complete XML output for a PRTG custom XML sensor
## NOTES

## RELATED LINKS
