
function New-PrtgXmlSensorOutput {

    param (
        [Parameter(ValueFromPipeline)]
        [string[]]$PrtgXmlResult,

        [bool]$IssueDetected
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
