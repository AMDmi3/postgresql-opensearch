all: opensearch-postgresql.xml

opensearch-postgresql.xml: opensearch-postgresql.xml.in favicon.txt
	sed -e "s|%ICON%|$$(cat favicon.txt)|" < opensearch-postgresql.xml.in > opensearch-postgresql.xml

favicon.txt: favicon.png
	openssl enc -base64 < favicon.png | tr -d '\n' > favicon.txt

favicon.png: favicon.ico
	convert 'favicon.ico[0]' favicon.png
	-optipng -o99 favicon.png

favicon.ico:
	wget https://www.postgresql.org/favicon.ico

clean:
	rm -f opensearch-postgresql.xml favicon.txt favicon.png favicon.ico
