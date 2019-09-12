Start-Process msiexec.exe -Wait -ArgumentList '/qn /norestart /i https://downloads.puppetlabs.com/windows/puppet5/puppet-agent-x64-latest.msi PUPPET_MASTER_SERVER=puppet'
if (Test-Path "C:\Program Files\Puppet Labs\Puppet\bin\puppet.bat") {
    & "C:\Program Files\Puppet Labs\Puppet\bin\puppet.bat" module install puppetlabs/windows
    & "C:\Program Files\Puppet Labs\Puppet\bin\puppet.bat" module install puppet-archive --version 3.2.1
} else {
    Write-Error "Could not find the Puppet agent executable. Make sure the script was run from an administrative Powershell session."
}