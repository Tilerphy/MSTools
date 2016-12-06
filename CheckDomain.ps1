function Get-DomainInfo
{
	param([Parameter(Mandatory)]$Domain)
	process
	{
		$user = Get-Credential;
		$bstr = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($user.Password)
		$p = [System.Runtime.InteropServices.Marshal]::PtrToStringBSTR($bstr)
		$domainPath = "LDAP://"+ $Domain;
		echo $domainPath;
		$d = new-object System.DirectoryServices.DirectoryEntry($domainPath, $user.Username, $p);
		echo $d;
	}
	
}

Get-DomainInfo
Read-Host
