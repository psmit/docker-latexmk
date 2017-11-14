FROM archlinux/base

RUN pacman -Syu --noconfirm && pacman -Scc --noconfirm
RUN pacman -S grep --noconfirm && pacman -S texlive-most texlive-lang biber --noconfirm && pacman -Scc --noconfirm
RUN groupadd -g 11987 latex && useradd -u 11987 -g latex latex
USER latex

WORKDIR /data
ENTRYPOINT ["latexmk"]
CMD ["-help"]
