all: http_conn.o httpserver

log.o: log.cpp log.h
	g++ -c log.cpp -o log.o
http_conn.o: http_conn.cpp http_conn.h
	g++ -c http_conn.cpp -o http_conn.o
httpserver: http_conn.o locker.h threadpool.h
	g++ http_conn.o locker.h threadpool.h http_server.cpp -o httpserver

clean:
	rm *.o httpserver
