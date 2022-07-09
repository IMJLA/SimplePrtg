---
external help file: PsPrtg-help.xml
Module Name: PsPrtg
online version:
schema: 2.0.0
---

# New-PrtgXmlResult

## SYNOPSIS
Generate an XML result for a single channel to include in the result for a PRTG custom XML sensor

## SYNTAX

```
New-PrtgXmlResult [-Channel] <String> [-Value] <String> [[-Unit] <String>] [[-CustomUnit] <String>]
 [[-ShowChart] <Int32>] [[-MaxError] <String>] [[-MinError] <String>] [[-MaxWarn] <String>]
 [[-MinWarn] <String>] [-Warning] [<CommonParameters>]
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
{{ Fill CustomUnit Description }}

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
{{ Fill MaxError Description }}

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
{{ Fill MaxWarn Description }}

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
{{ Fill MinError Description }}

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
{{ Fill MinWarn Description }}

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

### -ShowChart
{{ Fill ShowChart Description }}

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
{{ Fill Unit Description }}

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
{{ Fill Warning Description }}

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
