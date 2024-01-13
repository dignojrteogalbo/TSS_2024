FROM gcc:latest

RUN apt-get install -y git

WORKDIR ~/TSS_2024

COPY . .

RUN chmod +x ./build.bat && ./build.bat

EXPOSE 14141

# to run the file compiled from build.dat
ENTRYPOINT ./server.exe

# to run with --local
# ENTRYPOINT ./server.exe --local
