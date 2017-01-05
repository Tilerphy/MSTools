function CreateSimple
{
	param([Parameter(Mandatory)]$CertificatePath,
        [Parameter(Mandatory)]$IdentityClaimType,
        [Parameter(Mandatory)]$ReplyPartyIdentifier,
        [Parameter(Mandatory)]$SignInUrl,
        [Parameter(Mandatory)]$ProviderName)
	process
	{
    		$cert = New-Object System.Security.Cryptography.X509Certificates.X509Certificate2($CertificatePath);
   		$map1 = New-SPClaimTypeMapping $IdentityClaimType -IncomingClaimTypeDisplayName "Name ID" -SameAsIncoming
    		$realm = $ReplyPartyIdentifier
    		$signinurl = $SignInUrl
    		$ap = New-SPTrustedIdentityTokenIssuer -Name $ProviderName -Description "ADFS 3.0 Federated Server" -Realm $realm -ImportTrustCertificate $cert -ClaimsMappings $map1 -SignInUrl $signinurl -IdentifierClaim $map1.InputClaimType
  	}
	
}

CreateSimple
Read-Host
