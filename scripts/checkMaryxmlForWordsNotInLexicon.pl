#<t accent="L+H*" g2p_method="rules" ph="' t r a - f i: - k m a k - t u: - rd I - N e n" pos="content">
#TRAFIKMAKTORDNINGEN

$mary_build_dir = "mary_build";
@xmlfiles = glob("$mary_build_dir/prompt_allophones/*xml");

for $xmlfile (@xmlfiles) {
    open(XML, $xmlfile);
    while (<XML>) {
	if ( /^<t .*g2p_method=\"rules\" ph=\"([^\"]+)\"/ ) {
	    $trans = $1;
	    $word = <XML>;
	    chomp($word);
	    print "$word\t$trans\n";
	}
    }
}
    
