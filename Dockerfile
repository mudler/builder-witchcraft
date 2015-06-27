FROM sabayon/builder-amd64

# installing witchcraft
RUN equo i sudo dev-perl/Class-Load dev-perl/Class-Load-XS dev-perl/List-MoreUtils dev-perl/DateTime-Local dev-perl/libwww-perl App-cpanminus && wget 'https://codeload.github.com/Spike-Pentesting/App-witchcraft/tar.gz/master' -O witchcraft.tar.gz && tar xvf witchcraft.tar.gz && cd App-witchcraft-master && cpanm --installdeps -n . && cpanm .

# configuring witchcraft
RUN mkdir -p /root/.witchcraft && cp -rfv /App-witchcraft-master/witchcraft.conf /root/.witchcraft/witchcraft.conf && sed -i s:pushbullet::g /root/.witchcraft/witchcraft.conf && sed -i s:Sabayon::g /root/.witchcraft/witchcraft.conf && rm -rfv /App-witchcraft-master
