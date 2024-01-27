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
        Send-PrtgXmlSensorOutput -PrtgProtocol 'https' -PrtgProbe 'server1' -PrtgPort 443 -PrtgToken 'e3edd633-3018-4d8a-91b6-d2635b42b85b'

        Post sensor output to PRTG push sensor e3edd633-3018-4d8a-91b6-d2635b42b85b on server1 using HTTPS on TCP port 443
    #>

    param(

        # Valid XML for a PRTG custom XML sensor
        # Can be created by Format-PrtgXmlSensorOutput
        [string]$XmlOutput,

        # If all four of the PRTG parameters are specified, then the results will be XML-formatted and pushed to the specified PRTG probe for a push sensor
        [string]$PrtgProbe,

        # If all four of the PRTG parameters are specified, then the results will be XML-formatted and pushed to the specified PRTG probe for a push sensor
        [string]$PrtgProtocol,

        # If all four of the PRTG parameters are specified, then the results will be XML-formatted and pushed to the specified PRTG probe for a push sensor
        [int]$PrtgPort,

        # If all four of the PRTG parameters are specified, then the results will be XML-formatted and pushed to the specified PRTG probe for a push sensor
        [string]$PrtgToken
    )

    $ResultToPost = @{
        Body            = $XMLOutput
        ContentType     = 'application/xml'
        Method          = 'Post'
        Uri             = "$PrtgProtocol`://$PrtgProbe`:$PrtgPort/$PrtgToken"
        UseBasicParsing = $true
    }

    if ($PrtgToken) {
        Write-Verbose "URI: $PrtgProtocol`://$PrtgProbe`:$PrtgPort/$PrtgToken"

        Invoke-WebRequest @ResultToPost
    }

}
