all : https_proxy

https_proxy: http_tools.o ssl_func.o https_proxy.o 
	g++ -o https_proxy https_proxy.o ssl_func.o http_tools.o -lpcap -lpthread -lssl -lcrypto

ssl_func.o:
	g++ -c -o ssl_func.o ssl_func.cpp -lssl -lcrypto

https_proxy.o:
	g++ -c -o https_proxy.o https_proxy.cpp -lpcap -lpthread -lssl -lcrypto

http_tools.o:
	g++ -c -o http_tools.o http_tools.cpp -lpcap -lpthread

clean:
	rm -f https_proxy *.o


