[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string]$PbxAddress,

    [Parameter(Mandatory = $true)]
    [ValidateRange(1, 65535)]
    [int]$SipPort,

    [Parameter(Mandatory = $true)]
    [ValidateSet('UDP', 'TCP', 'TLS')]
    [string]$Transport
)

$ErrorActionPreference = 'Stop'

Write-Host 'Bohio Voice client laboratory reachability check'
Write-Host "PBX address: $PbxAddress"
Write-Host "Transport:   $Transport"
Write-Host "SIP port:    $SipPort"

$parsedAddress = $null
if (-not [System.Net.IPAddress]::TryParse($PbxAddress, [ref]$parsedAddress)) {
    $resolved = Resolve-DnsName -Name $PbxAddress -Type A -ErrorAction Stop |
        Where-Object { $_.IPAddress } |
        Select-Object -ExpandProperty IPAddress -Unique

    if (-not $resolved) {
        throw 'The PBX name did not resolve to an IPv4 address.'
    }

    Write-Host "Resolved:     $($resolved -join ', ')"
}

$pingSucceeded = Test-Connection -ComputerName $PbxAddress -Count 1 -Quiet
Write-Host "ICMP reply:   $pingSucceeded"

if ($Transport -eq 'UDP') {
    Write-Host 'UDP_STATUS=APPLICATION_TEST_REQUIRED'
    Write-Host 'UDP has no reliable generic open-port handshake.'
    Write-Host 'Successful authenticated SIP registration is the authoritative check.'
}
else {
    $connection = Test-NetConnection `
        -ComputerName $PbxAddress `
        -Port $SipPort `
        -InformationLevel Detailed

    Write-Host "TCP reachable: $($connection.TcpTestSucceeded)"
    if (-not $connection.TcpTestSucceeded) {
        throw 'The configured SIP TCP/TLS port was not reachable.'
    }

    if ($Transport -eq 'TLS') {
        Write-Host 'TLS_STATUS=TCP_ONLY'
        Write-Host 'This script does not validate the server certificate or SIP TLS handshake.'
        Write-Host 'The softphone must validate both during registration.'
    }
}

Write-Host 'LAB_REACHABILITY_CHECK=PASS'
