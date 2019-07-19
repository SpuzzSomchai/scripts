from extendes.linux import Linux, os


class Youtube:

    @staticmethod
    def dowloards():
        folder = "~/Music/youtube/"
        videosFile = "$(<~/Downloads/vd.txt)"
        os.system("for i in " + videosFile + "; do youtube-dl -x --audio-format mp3  -o '"+folder+"%(title)s.%(ext)s' $i; done")
