FROM archlinux/base

RUN pacman -Syu --noconfirm && pacman -Scc --noconfirm
RUN pacman -S grep --noconfirm && pacman -S texlive-most texlive-lang ttf-linux-libertine biber --noconfirm && pacman -Scc --noconfirm
RUN groupadd -g 11987 latex && useradd -u 11987 -g latex latex
RUN mkdir /home/latex && chown latex:latex /home/latex
USER latex

WORKDIR /data
COPY .latexmkrc /home/latex/
COPY latexmk_recursive.sh /usr/local/bin/
ENTRYPOINT ["latexmk_recursive.sh"]
CMD ["-help"]
