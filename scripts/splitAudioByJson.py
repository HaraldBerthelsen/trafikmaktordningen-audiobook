import sys, json, os


def split(nr, i):

    jsonfile = "tmo/syncmaps/tmo_%02d_syncmap.json" % nr
    #wavfile = "tmo/wav/tmo_kap%d.wav" % nr
    wavfile = "original_data/Trafikmaktordningen ljudbok/Trafikmaktordningen - Kapitel %d.mp3" % nr
    outdir = "corpus"

    timings = json.loads(open(jsonfile).read())

    for fragment in timings["fragments"]:
        print fragment["begin"]
        print fragment["end"]
        text = "".join(fragment["lines"])
        print text

        txtoutfile = outdir+"/txt/tmo_%04d.txt" % i
        wavoutfile = outdir+"/wav/tmo_%04d.wav" % i
        i += 1
        print txtoutfile

        fh = open(txtoutfile, "w")
        fh.write(text.encode("utf-8"))
        fh.write("\n")
        fh.close()


        starttime = float(fragment["begin"])
        duration = float(fragment["end"])-float(fragment["begin"])

        start_m = starttime/60.0
        start_s = starttime%60.0
        dur_m = duration/60.0
        dur_s = duration%60.0

        soxcommand = 'sox "%s" %s trim %d:%f %d:%f' % (wavfile, wavoutfile, start_m, start_s, dur_m, dur_s)
        print soxcommand

        os.system(soxcommand)

    return i

i = 1
for nr in range(1,10):
    print nr
    i = split(nr, i)
    
