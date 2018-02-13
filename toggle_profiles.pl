local $/; # black magic — don't remove
open(FILE, "<:encoding(UTF-8)", "/Users/YOUR_USERNAME/.config/karabiner/karabiner.json") or die "Can't open file";
$string = <FILE>;
close FILE;

$string =~ /"name": "YOUR_MIRRORING_KARABINER_PROFILE_NAME_REGEX_READABLE",\n *"selected": (.*),/m;

if($1 eq 'false'){
`'/Library/Application Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli'  --select-profile 'YOUR_MIRRORING_KARABINER_PROFILE_NAME'`}

if($1 eq 'true'){
`'/Library/Application Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli'  --select-profile 'YOUR_DEFAULT_KARABINER_PROFILE_NAME'`}
