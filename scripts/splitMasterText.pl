$master_text_file = "tmo/tmo.txt";
$chapter_nr = 1;


open(IN,$master_text_file) || die "Can't open file $master_text_file: $!";

$chapter_text_file = sprintf "tmo/txt/tmo_%02d.txt", $chapter_nr;
print STDERR "Writing to $chapter_text_file\n";
$chapter_nr++;
open(OUT,">$chapter_text_file") || die "Can't open file $chapter_text_file: $!";

while (<IN>) {
    chomp;
    $line = $_;
    #print STDERR "$line\n";
    if ( $line =~ /^\s*Kapitel $chapter_nr\.\s*$/ ) {
	close(OUT);
	$chapter_text_file = sprintf "tmo/txt/tmo_%02d.txt", $chapter_nr;
	print STDERR "Writing to $chapter_text_file\n";
	$chapter_nr++;
	open(OUT,">$chapter_text_file") || die "Can't open file $chapter_text_file: $!";	
    }
    print OUT "$line\n";    
} 

close(OUT);
close(IN);
