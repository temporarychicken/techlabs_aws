$currentsubdomain = Read-Host -Prompt 'Input the current subdomain for your techlab if already customised. The default is techlab0001. Hit enter for default'
if ( $currentsubdomain -eq '' )
{
    $currentsubdomain = 'techlab0001'
}

echo $currentsubdomain

echo 'Input the subdomain name for your techlab. The resultant domain name for your techlab will be <<yourinput>>.axwaydemo.net'
echo 'This should be lower-case letters and numbers only and should not be left blank'
$newsubdomain = ""
Do {$newsubdomain = Read-Host -Prompt 'Please enter the new subdomain name for your techlab. '}
until  ($newsubdomain -ne "")
echo ""
echo "Rewriting old subdomain: " $currentsubdomain
echo "Using new subdomain: " $newsubdomain
echo "..."

# CONFIGURE CHAPTER 1 TERRAFORM FILES

Get-ChildItem ".\1_terraform-create-or-refresh-certs\" -Filter *.tf | 
Foreach-Object {

    ((Get-Content -path .\1_terraform-create-or-refresh-certs\$_ -raw) -replace $currentsubdomain,$newsubdomain ) | Set-Content -path .\1_terraform-create-or-refresh-certs\$_

}


#Get-ChildItem ".\2_packer-build-aws-ami-images\" -Filter *.json | 
#Foreach-Object {
#
#    ((Get-Content -path .\2_packer-build-aws-ami-images\$_ -raw) -replace $currentsubdomain,$newsubdomain ) | Set-Content -path .\2_packer-build-aws-ami-images\$_
#
#}


# CONFIGURE NGINX CONFIG FILE WITH CORRECT SUBDOMAIN NAMES

((Get-Content -path .\2_packer-build-aws-ami-images\resources\default -raw) -replace $currentsubdomain,$newsubdomain ) | Set-Content -path .\2_packer-build-aws-ami-images\resources\default

# CONFIGURE CHAPTER 3 TERRAFORM FILES

Get-ChildItem ".\3_terraform-deploy-platform\" -Filter *.tf | 
Foreach-Object {

    ((Get-Content -path .\3_terraform-deploy-platform\$_ -raw) -replace $currentsubdomain,$newsubdomain ) | Set-Content -path .\3_terraform-deploy-platform\$_

}


# CONFIGURE CHAPTER 3 HTML FILES

Get-ChildItem ".\3_terraform-deploy-platform\" -Filter *.html | 
Foreach-Object {

    ((Get-Content -path .\3_terraform-deploy-platform\$_ -raw) -replace $currentsubdomain,$newsubdomain ) | Set-Content -path .\3_terraform-deploy-platform\$_

}


# CONFIGURE CHAPTER 3 START TECHLAB SCRIPT

Get-ChildItem ".\3_terraform-deploy-platform\" -Filter start_techlab.ps1 | 
Foreach-Object {

    ((Get-Content -path .\3_terraform-deploy-platform\$_ -raw) -replace $currentsubdomain,$newsubdomain ) | Set-Content -path .\3_terraform-deploy-platform\$_

}