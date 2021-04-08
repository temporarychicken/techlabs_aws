$currentsubdomain = Read-Host -Prompt 'Input the current subdomain for your techlab if already customised. The default is techlab0001. Hit enter for default'
if ( $currentsubdomain -eq '' )
{
    $currentsubdomain = 'techlab0001'
}

echo $currentsubdomain


$newsubdomain = Read-Host -Prompt 'Input the subdomain name for your techlab. The resultant domain name for your techlab will be <<yourinput>>.axwaydemo.net'

Get-ChildItem ".\1_terraform-create-or-refresh-certs\" -Filter *.tf | 
Foreach-Object {

    ((Get-Content -path .\1_terraform-create-or-refresh-certs\$_ -raw) -replace $currentsubdomain,$newsubdomain ) | Set-Content -path .\1_terraform-create-or-refresh-certs\$_

}


Get-ChildItem ".\2_packer-build-aws-ami-images\" -Filter *.json | 
Foreach-Object {

    ((Get-Content -path .\2_packer-build-aws-ami-images\$_ -raw) -replace $currentsubdomain,$newsubdomain ) | Set-Content -path .\2_packer-build-aws-ami-images\$_

}


((Get-Content -path .\2_packer-build-aws-ami-images\resources\default -raw) -replace $currentsubdomain,$newsubdomain ) | Set-Content -path .\2_packer-build-aws-ami-images\resources\default


Get-ChildItem ".\3_terraform-deploy-platform\" -Filter *.tf | 
Foreach-Object {

    ((Get-Content -path .\3_terraform-deploy-platform\$_ -raw) -replace $currentsubdomain,$newsubdomain ) | Set-Content -path .\3_terraform-deploy-platform\$_

}
