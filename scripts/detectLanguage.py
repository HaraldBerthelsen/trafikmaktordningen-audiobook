import sys, glob
#import langdetect
from langdetect import detect_langs, detect

from langdetect import DetectorFactory
DetectorFactory.seed = 0

expected_lang = "sv"


txtdir = "corpus/txt"
txtfiles = glob.glob(txtdir+"/*.txt")
txtfiles.sort()

for txtfile in txtfiles:
    #print(txtfile)
    fh = open(txtfile)
    text = fh.read().strip()
    fh.close()
    lang = detect(text)
    #print(lang)
    if lang != expected_lang:
        langs = detect_langs(text)
        print("%s\t%s\t%s\t%s" % (txtfile, lang, langs, text))

