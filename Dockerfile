FROM seafileltd/seafile-mc:11.0.6

RUN apt-get update \
	&& apt-get install -y sqlite3 \
	&& apt-get autoremove -y \
	&& apt-get clean

RUN sed -i 's/setup-seafile-mysql\.sh/setup-seafile.sh/g' /scripts/bootstrap.py \
    && sed -i '/def wait_for_mysql()/a\\    return' /scripts/utils.py \
    && touch /opt/seafile/seahub.db
