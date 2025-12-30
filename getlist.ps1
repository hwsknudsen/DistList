Import-Module ExchangeOnlineManagement -Force; Connect-ExchangeOnline
Get-DistributionGroup | ForEach-Object {
$group = $_
$members = Get-DistributionGroupMember -Identity $group.Name | Select-Object -ExpandProperty PrimarySmtpAddress
[PSCustomObject]@{
GroupName = $group.DisplayName
PrimarySmtpAddress = $group.PrimarySmtpAddress
Members = $members -join "; "
}
} | Export-Csv -Path "C:\temp\DistributionListReport.csv" -NoTypeInformation


Get-DynamicDistributionGroup | Format-List Name,PrimarySmtpAddress,RecipientFilter
