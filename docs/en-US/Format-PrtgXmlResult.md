---
external help file: SimplePrtg-help.xml
Module Name: SimplePrtg
online version:
schema: 2.0.0
---

# Format-PrtgXmlResult

## SYNOPSIS
Generate an XML result for a single channel to include in the result for a PRTG custom XML sensor

## SYNTAX

```
Format-PrtgXmlResult [-Channel] <String> [-Value] <String> [[-Unit] <String>] [[-CustomUnit] <String>]
 [[-ShowChart] <Int32>] [[-MaxError] <String>] [[-MinError] <String>] [[-MaxWarn] <String>]
 [[-MinWarn] <String>] [-Warning] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Generate a \<result\>...\</result\> XML channel for a PRTG custom XML sensor

## EXAMPLES

### EXAMPLE 1
```
New-PrtgXmlResult -Channel 'Channel123' -Value 'Value123' -CustomUnit 'Miles Per Hour'
<result>
<channel>Channel123</channel>
<value>Value123</value>
<unit>Custom</unit>
<customUnit>Miles Per Hour</customUnit>
<showchart>0</showchart>
</result>
```

Generate XML output for a PRTG sensor that will put it in an OK state

## PARAMETERS

### -Channel
PRTG sensor channel of the result

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CustomUnit
Custom unit label to apply to the value

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MaxError
If the value goes above this the channel will be in an alarm state in PRTG

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MaxWarn
If the value goes above this the channel will be in a warning state in PRTG

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MinError
If the value goes below this the channel will be in an alarm state in PRTG

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MinWarn
If the value goes below this the channel will be in a warning state in PRTG

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: 9
Default value: None
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

### -ShowChart
Show the channel on charts in PRTG

```yaml
Type: System.Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Unit
Reccomend leaving this as 'Custom' but see PRTG docs for other options

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: Custom
Accept pipeline input: False
Accept wildcard characters: False
```

### -Value
Value to return

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Warning
Force the channel into a warning state in PRTG

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### [System.String]$Channel
## OUTPUTS

### [System.String] A single XML channel to include in the output for a PRTG XML sensor
## NOTES

## RELATED LINKS
