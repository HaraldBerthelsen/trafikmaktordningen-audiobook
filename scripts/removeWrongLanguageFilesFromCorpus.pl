
$removed_txt_dir = "corpus/removed_txt";
unless (-e $removed_txt_dir) {
    mkdir $removed_txt_dir || die "Can't make dir $removed_txt_dir: $!";
}

$removed_wav_dir = "corpus/removed_wav";
unless (-e $removed_wav_dir) {
    mkdir $removed_wav_dir || die "Can't make dir $removed_wav_dir: $!";
}


while (<>) {
    $line = $_;
    @info = split("\t", $line);
    $file = $info[0];

    $file =~ /\/([^\/]+).txt$/;
    $base = $1;

    $mv_txt_cmd = sprintf "mv corpus/txt/%s.txt %s/%s.txt", $base, $removed_txt_dir, $base; 
    print "$mv_txt_cmd\n";
    `$mv_txt_cmd`;

    $mv_wav_cmd = sprintf "mv corpus/wav/%s.wav %s/%s.wav", $base, $removed_wav_dir, $base; 
    print "$mv_wav_cmd\n";
    `$mv_wav_cmd`;

    #$rm_mary_cmd = sprintf "rm mary_build/*/%s.*", $base;
    #print "$rm_mary_cmd\n";
    #`$rm_mary_cmd`;

    
	

}
