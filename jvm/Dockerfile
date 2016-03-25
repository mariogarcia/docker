FROM java:8

#
#   | | | |___ ___ _ _
#   | |_| (_-</ -_) '_|
#    \___//__/\___|_|
#
RUN echo 'root:devpassword123' | chpasswd
RUN useradd dev -d /home/dev -s /bin/bash && cp -r /etc/skel /home/dev && chown dev -R /home/dev

#    ___                        _             _
#   |   \ ___ _ __  ___ _ _  __| |___ _ _  __(_)___ ___
#   | |) / -_) '_ \/ -_) ' \/ _` / -_) ' \/ _| / -_|_-<
#   |___/\___| .__/\___|_||_\__,_\___|_||_\__|_\___/__/
#            |_|
#
RUN apt-get update && apt-get install -yq \
    tmux \
    vim \
	unzip \
    xz-utils \
    curl \
    rlwrap \
	postgresql-client

#    _____             _
#   |_   _| _ __ ___ _(_)___
#     | || '_/ _` \ V / (_-<
#     |_||_| \__,_|\_/|_/__/
#
RUN apt-get update && apt-get install -yq ruby ruby-dev make && \
    gem install travis -v 1.8.2 --no-rdoc --no-ri

USER root
RUN chown dev -R /home/dev/

#       ___   ____  __   _
#    _ | \ \ / /  \/  | | |   __ _ _ _  __ _ _  _ __ _ __ _ ___ ___
#   | || |\ V /| |\/| | | |__/ _` | ' \/ _` | || / _` / _` / -_|_-<
#    \__/  \_/ |_|  |_| |____\__,_|_||_\__, |\_,_\__,_\__, \___/__/
#                                      |___/          |___/
#
# Most of JVM languages can be found using sdk-man.org but some of
# them like Clojure can't
#
ENV LEIN_ROOT 1
RUN curl https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein -o /usr/local/bin/lein && chmod +x /usr/local/bin/lein && lein upgrade

# SDK-MAN
USER dev
RUN curl -s get.sdkman.io | bash
RUN bash -c "source /home/dev/.sdkman/bin/sdkman-init.sh"

#    ___           _      _                      _
#   | _ ) ___  ___| |_ __| |_ _ _ __ _ _ __ _ __(_)_ _  __ _
#   | _ \/ _ \/ _ \  _(_-<  _| '_/ _` | '_ \ '_ \ | ' \/ _` |
#   |___/\___/\___/\__/__/\__|_| \__,_| .__/ .__/_|_||_\__, |
#                                     |_|  |_|         |___/
#
# Setting default workdir, exposing most common ports and executing
# tmux
#
WORKDIR /home/dev

CMD tmux