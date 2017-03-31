[void][reflection.assembly]::Load("System.DirectoryServices.AccountManagement, Version=3.5.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089")

function Get-Users
{
	param([Parameter(Mandatory)]$Domain,[Parameter(Mandatory)]$Group)
	process
	{
		$user = Get-Credential;
		$bstr = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($user.Password)
		$p = [System.Runtime.InteropServices.Marshal]::PtrToStringBSTR($bstr)
		$ctx= new-object System.DirectoryServices.AccountManagement.PrincipalContext([System.DirectoryServices.AccountManagement.ContextType]::Domain, $Domain,$user.Username,$p);
		$gp=[System.DirectoryServices.AccountManagement.GroupPrincipal]::FindByIdentity($ctx, $Group);
		$gp.Members | foreach-object{$_.Name}

	}
}

Get-Users
