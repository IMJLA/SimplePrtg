

function New-PrtgXmlResult {

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

    $Xml = [System.Collections.Generic.List[string]]

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
    }
    else {
        $null = $Xml.Add('  <Warning>0</Warning>')
    }

    $null = $Xml.Add('</result>')
    $Xml

}
