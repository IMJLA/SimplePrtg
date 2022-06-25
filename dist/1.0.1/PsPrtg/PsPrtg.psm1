


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

function New-PrtgXmlSensorOutput {

    param (
        [Parameter(ValueFromPipeline)]
        [string[]]$PrtgXmlResult,

        [bool]$IssueDetected
    )

    begin {
        $Strings = [System.Collections.Generic.List[string]]

        $null = $Strings.add("<prtg>")
    }
    process {

        foreach ($XmlResult in $PrtgXmlResult) {

            $null = $Strings.add($XmlResult)

        }
    }
    end {
        if ($IssueDetected) {
            $null = $Strings.add("<text>Issue detected, see sensor channels for details</text>")
        } else {
            $null = $Strings.add("<text>OK</text>")
        }
        $null = $Strings.add("</prtg>")
        $Strings
    }
}
function Send-PrtgXmlSensorOutput {

    param(

        [string]$XmlOutput,

        # If all four of the PRTG parameters are specified, then the results will be XML-formatted and pushed to the specified PRTG probe for a push sensor
        [string]$PrtgProbe,

        # If all four of the PRTG parameters are specified, then the results will be XML-formatted and pushed to the specified PRTG probe for a push sensor
        [string]$PrtgSensorProtocol,

        # If all four of the PRTG parameters are specified, then the results will be XML-formatted and pushed to the specified PRTG probe for a push sensor
        [int]$PrtgSensorPort,

        # If all four of the PRTG parameters are specified, then the results will be XML-formatted and pushed to the specified PRTG probe for a push sensor
        [string]$PrtgSensorToken
    )

    $ResultToPost = @{
        Body            = $XMLOutput
        ContentType     = 'application/xml'
        Method          = 'Post'
        Uri             = "$PrtgSensorProtocol`://$PrtgProbe`:$PrtgSensorPort/$PrtgSensorToken"
        UseBasicParsing = $true
    }

    if ($PrtgSensorToken) {
        Write-Verbose "URI: $PrtgSensorProtocol`://$PrtgProbe`:$PrtgSensorPort/$PrtgSensorToken"

        Invoke-WebRequest @ResultToPost
    }

}
$ScriptFiles = Get-ChildItem -Path "$PSScriptRoot\*.ps1" -Recurse

# Dot source any functions
ForEach ($ThisScript in $ScriptFiles) {
    # Dot source the function
    . $($ThisScript.FullName)
}

# Add any custom C# classes as usable (exported) types
$CSharpFiles = Get-ChildItem -Path "$PSScriptRoot\*.cs"
ForEach ($ThisFile in $CSharpFiles) {
    Add-Type -Path $ThisFile.FullName -ErrorAction Stop
}

# Export any public functions
$PublicScriptFiles = $ScriptFiles | Where-Object -FilterScript {
    ($_.PSParentPath | Split-Path -Leaf) -eq 'public'
}
$publicFunctions = $PublicScriptFiles.BaseName
Export-ModuleMember -Function @('New-PrtgXmlResult','New-PrtgXmlSensorOutput','Send-PrtgXmlSensorOutput')


