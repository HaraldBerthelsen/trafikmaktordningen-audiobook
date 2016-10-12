
$audio_dir = "original_data/Trafikmaktordningen\ ljudbok";

$txt_dir = "tmo/txt";
$syncmaps_dir = "tmo/syncmaps";
unless (-e $syncmaps_dir) {
    mkdir $syncmaps_dir || die "Can't make dir $syncmaps_dir: $!";
}

#MODIFY AENEAS CONFIG HERE IF NEEDED
#Boundary offset -0.200 seems to be the best setting, it moves every boundary back 200 ms. Without it, many sentences start too late. With it, there are a few cases where they instead start too early.
#No I now disagree with myself here.. It seems to go the wrong way. Switching back to running without any modification

#$aeneas_config = "task_language=swe|os_task_file_format=json|is_text_type=plain|task_adjust_boundary_algorithm=offset|task_adjust_boundary_offset_value=-0.200";

$aeneas_config = "task_language=swe|os_task_file_format=json|is_text_type=plain";
    
for ($i = 1; $i < 10; $i++) {

    $audio_file = sprintf "%s/Trafikmaktordningen - Kapitel %d.mp3", $audio_dir, $i;
    unless (-e $audio_file) { die "Can't find file $audio_file: $!"; }

    $txt_file = sprintf "%s/tmo_%02d.txt", $txt_dir, $i;
    unless (-e $txt_file) { die "Can't find file $txt_file: $!";}

    $syncmaps_file = sprintf "%s/tmo_%02d_syncmap.json", $syncmaps_dir, $i;
    
    
    $align_cmd = sprintf 'python -m aeneas.tools.execute_task "%s" %s "%s" %s', $audio_file, $txt_file, $aeneas_config, $syncmaps_file;

    print STDERR "$align_cmd\n";
    `$align_cmd`;

    $html_file = sprintf "%s/tmo_%02d_syncmap.html", $syncmaps_dir, $i;

    $html_cmd = sprintf 'aeneas_convert_syncmap %s %s "%s" --output-html', $syncmaps_file, $html_file, $audio_file;
    print STDERR "$html_cmd\n\n";
    `$html_cmd`;
    
}
