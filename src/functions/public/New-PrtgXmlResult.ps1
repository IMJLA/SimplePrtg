

function New-PrtgXmlResult {

    <#
        .SYNOPSIS
        Generate an XML result for a single channel to include in the result for a PRTG custom XML sensor
        .DESCRIPTION
        Generate a <result>...</result> XML channel for a PRTG custom XML sensor
        .INPUTS
        [System.String]$Channel
        .OUTPUTS
        [System.String] A single XML channel to include in the output for a PRTG XML sensor
        .EXAMPLE
        New-PrtgXmlResult -Channel 'Channel123' -Value 'Value123' -CustomUnit 'Miles Per Hour'
        <result>
        <channel>Channel123</channel>
        <value>Value123</value>
        <unit>Custom</unit>
        <customUnit>Miles Per Hour</customUnit>
        <showchart>0</showchart>
        </result>

        Generate XML output for a PRTG sensor that will put it in an OK state
    #>

    param (

        # PRTG sensor channel of the result
        [parameter(Mandatory)]
        [string]$Channel,

        # Value to return
        [parameter(Mandatory)]
        [string]$Value,

        [string]$Unit = 'Custom',
        [string]$CustomUnit,
        [int]$ShowChart = 0,
        [string]$MaxError,
        [string]$MinError,
        [string]$MaxWarn,
        [string]$MinWarn,
        [switch]$Warning

    )

    $Xml = [System.Collections.Generic.List[string]]::new()

    $null = $Xml.Add('<result>')
    $null = $Xml.Add("  <channel>$Channel</channel>")
    $null = $Xml.Add("  <value>$Value</value>")
    $null = $Xml.Add("  <unit>$Unit</unit>")
    $null = $Xml.Add("  <showchart>$ShowChart</showchart>")

    if ($CustomUnit) {
        $null = $Xml.Add("  <customUnit>$CustomUnit</customUnit>")
    }

    if ($MaxError -or $MinError -or $MaxWarn -or $MinWarn) {

        $null = $Xml.Add("  <limitmode>1</limitmode>")

        if ($MaxError) {
            $null = $Xml.Add("  <limitmaxerror>$MaxError</limitmaxerror>")
        }

        if ($MinError) {
            $null = $Xml.Add("  <limitminerror>$MinError</limitminerror>")
        }

        if ($MaxWarn) {
            $null = $Xml.Add("  <limitmaxwarn>$MaxWarn</limitmaxwarn>")
        }

        if ($MinWarn) {
            $null = $Xml.Add("  <limitminwarn>$MinWarn</limitminwarn>")
        }

    }

    if ($Warning) {
        $null = $Xml.Add('  <Warning>1</Warning>')
    } else {
        $null = $Xml.Add('  <Warning>0</Warning>')
    }

    $null = $Xml.Add('</result>')
    $Xml

}
