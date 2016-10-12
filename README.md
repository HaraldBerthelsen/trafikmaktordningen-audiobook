# trafikmaktordningen-audiobook
Original data, derived files, scripts and notes related to building Swedish tts from the audiobook.


original_data contains the audiobook and a pdf with the text, from http://planka.nu/2012/06/26/trafikmaktordningen-som-ljudbok/
The license of this material is "copyme": http://www.kopimi.com, equivalent to Creative Commoncs CC0 "No Rights Reserved" license.

tmo contains files derived from the original data.

---------
Extract text
pdftotext original_data/manus_för_inläsning.pdf tmo/tmo_original.txt

Text that was read but not in the original text file was added manually.
This includes chapter headings, that can be used to split the main text into nine parts corresponding to the nine soundfiles.

So all text corrections should be made in this file: tmo/tmo.txt

Run split script: 'perl scripts/splitMasterText.pl'. Output: tmo/txt/tmo_0{1-9}.txt

---------

Corrections
tmo/tmo.txt has been corrected manually in many ways to match spoken audio. Midsentence newlines have been removed, and sentence-final newlines have been added. There should be one sentence on each line.

----------

Split audio and text into sentences.


