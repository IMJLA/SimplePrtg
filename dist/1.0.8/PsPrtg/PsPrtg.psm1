


function Format-PrtgXmlResult {

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

        # Reccomend leaving this as 'Custom' but see PRTG docs for other options
        [string]$Unit = 'Custom',

        # Custom unit label to apply to the value
        [string]$CustomUnit,

        # Show the channel on charts in PRTG
        [int]$ShowChart = 0,

        # If the value goes above this the channel will be in an alarm state in PRTG
        [string]$MaxError,

        # If the value goes below this the channel will be in an alarm state in PRTG
        [string]$MinError,

        # If the value goes above this the channel will be in a warning state in PRTG
        [string]$MaxWarn,

        # If the value goes below this the channel will be in a warning state in PRTG
        [string]$MinWarn,

        # Force the channel into a warning state in PRTG
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

function Format-PrtgXmlSensorOutput {
    <#
        .SYNOPSIS
        Assemble the complete output for a PRTG XML sensor
        .DESCRIPTION
        Combine multiple channels into a single PRTG XML sensor result
        .INPUTS
        [System.String]$PrtgXmlResult
        .OUTPUTS
        [System.String] Complete XML output for a PRTG custom XML sensor
        .EXAMPLE
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

        Generate XML output for a PRTG sensor that will put it in an OK state
        .EXAMPLE
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

        Generate XML output for a PRTG sensor that will put it in an alarm state
    #>

    param (

        # Valid XML for a PRTG result for a single channel
        # Can be created by Format-PrtgXmlResult
        [Parameter(ValueFromPipeline)]
        [string[]]$PrtgXmlResult,

        # Force the PRTG sensor into an alarm state
        [switch]$IssueDetected

    )

    begin {
        $Strings = [System.Collections.Generic.List[string]]::new()
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

    <#
        .SYNOPSIS
        Wrapper for Invoke-WebRequest to make it easy to push results to PRTG XML push sensors
        .DESCRIPTION
        Use HTTP post to post results to PRTG XML push sensors
        .INPUTS
        [System.String]$XmlOutput
        .OUTPUTS
        Passes through the output of Invoke-WebRequest
        .EXAMPLE
        New-PrtgXmlSensorOutput ... |
        Send-PrtgXmlSensorOutput -PrtgSensorProtocol 'https' -PrtgProbe 'server1' -PrtgSensorPort 443 -PrtgSensorToken 'e3edd633-3018-4d8a-91b6-d2635b42b85b'

        Post sensor output to PRTG push sensor e3edd633-3018-4d8a-91b6-d2635b42b85b on server1 using HTTPS on TCP port 443
    #>

    param(

        # Valid XML for a PRTG custom XML sensor
        # Can be created by Format-PrtgXmlSensorOutput
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

Export-ModuleMember -Function @('Format-PrtgXmlResult','Format-PrtgXmlSensorOutput','Send-PrtgXmlSensorOutput')





