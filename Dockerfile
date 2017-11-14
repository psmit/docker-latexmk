FROM archlinux/base

RUN pacman -Syu --noconfirm && pacman -Scc --noconfirm
RUN pacman -S grep --noconfirm && pacman -S texlive-most texlive-lang biber --noconfirm && pacman -Scc --noconfirm
RUN groupadd -g 11987 latex && useradd -u 11987 -g latex latex
RUN mkdir /home/latex && chown latex:latex /home/latex
USER latex


WORKDIR /data
ENTRYPOINT ["latexmk"]
CMD ["-help"]
