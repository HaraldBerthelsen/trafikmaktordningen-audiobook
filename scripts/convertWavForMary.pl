$indir = "corpus/wav";
$outdir = "mary_build/wav";

@infiles = glob("$indir/*.wav");

foreach $infile (@infiles) {
    #print STDERR "INFILE: $infile\n";

    $infile =~ /\/([^\/]+.wav)$/;
    $filename = $1;

    $outfile = "$outdir/$filename";

    $cmd = "sox $infile -r 16000 -c 1 $outfile";
    
    print STDERR "$cmd\n";
    `$cmd`;
    
}
