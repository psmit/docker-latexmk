FROM base/archlinux

RUN pacman -Syu --noconfirm && pacman -S texlive-most texlive-lang biber --noconfirm
RUN groupadd -g 11987 latex && useradd -u 11987 -g latex latex
USER latex

WORKDIR /data
ENTRYPOINT ["latexmk"]
CMD ["-help"]
