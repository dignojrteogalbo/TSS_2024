FROM gcc:latest

RUN apt-get install -y git

WORKDIR ~/TSS_2024

COPY . .

RUN chmod +x ./build.bat && ./build.bat

EXPOSE 14141

ENTRYPOINT ./server.exe --local