function Get-UserInfo
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
        $searcher= new-object System.DirectoryServices.DirectorySearcher($d);
        $searcher.Filter = "(|(cn="+$user.Username+")(samAccountName="+$user.Username+"))";
        $searcher.SearchScope = [System.DirectoryServices.SearchScope]::Subtree;
        $results = $searcher.FindAll();
        foreach($result in $results)
        {
            $tmp = new-object System.DirectoryServices.DirectoryEntry($result.Path, $user.Username, $p);
            echo $tmp.Path;
            $tokenGroupName = ,"tokenGroups";
            $tmp.RefreshCache($tokenGroupName);
            $allGroupsSids= $tmp.Properties["tokenGroups"];
            foreach($gSid in $allGroupsSids)
            {
                $gSidStr  = new-object System.Security.Principal.SecurityIdentifier($gSid,0);
                $gSidPath = $domainPath+"/<SID="+$gSidStr.ToString()+">";
                $gEntry = new-object System.DirectoryServices.DirectoryEntry($gSidPath,
                 $user.Username, $p);
                echo $gEntry;
            }
            echo "Finished".
        }
		
	}
	
}

Get-UserInfo
Read-Host
