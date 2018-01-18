rule trojan_3e1c170dae4154581f7f37e20fcdd85ae39f2a98c7a2b1fdb153a2dfa5bae486 : trojan
{
  strings:
    $registry_key = "URCWXKQC01" fullword ascii
    $schtask = "Schtasks /create /sc minute /mo 30 /tn Skype /tr" ascii
    $split_delim = "|V|" ascii
    $c2 = "http://postventa-vodafone2006.duckdns.org:1993/"

  condition:
    $registry_key and $schtask and $split_delim and $c2
}