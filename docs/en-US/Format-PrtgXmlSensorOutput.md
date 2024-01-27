---
external help file: SimplePrtg-help.xml
Module Name: SimplePrtg
online version:
schema: 2.0.0
---

# Format-PrtgXmlSensorOutput

## SYNOPSIS
Assemble the complete output for a PRTG XML sensor

## SYNTAX

```
Format-PrtgXmlSensorOutput [[-PrtgXmlResult] <String[]>] [-IssueDetected] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
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
Force the PRTG sensor into an alarm state

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

### -ProgressAction
{{ Fill ProgressAction Description }}

```yaml
Type: System.Management.Automation.ActionPreference
Parameter Sets: (All)
Aliases: proga

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PrtgXmlResult
Valid XML for a PRTG result for a single channel
Can be created by Format-PrtgXmlResult

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
