<h1 align="center">
  :man_astronaut: S.U.I.T.S. Telemetry Stream Server C :woman_astronaut:
<br>
| CAPCOM |
</h1>
<h4 align="center">
  :telescope: CAPCOM Web Interface for the S.U.I.T.S. Telemetry Stream Server C :rocket:
</h4>

---

<h5 align="center">
  <a href="https://microgravityuniversity.jsc.nasa.gov/nasasuits">NASA SUITS Website</a> •
  <a href="#earth_americas-for-suits-teams">For SUITS Teams</a> •
  <a href="#computer-for-nasa-team">For NASA Team</a>
</h5>

---
<br>

## :earth_americas: Run TSS Server

1. Clone the repository...
```
git clone https://github.com/SUITS-Techteam/TSS_2024.git
```
2. Navigate into the root of the repository
```
cd TSS_2024
```

### To use Docker container:

This will require [Docker](https://www.docker.com/get-started/) to be installed and running.

3. To build the Docker image execute with `Dockerfile`.
   This creates an image with the `tss_2024` tag.
```
docker build -t tss_2024 .
```

4. To run the container.
   This creates a container named `tss_2024` from the image we created.
   The container runs in interactive mode with the port `14141` exposed.
```
docker run -it -p 14141:14141 --name tss_2024 tss_2024
```

Follow these instructions once the container is [running](#tss-is-running).

### To compile and run executable:

3. To build the TSS Server run the `build.bat` file.
```
./build.bat
```

4. To run the TSS Server, run ...
```
./server.exe
```

### TSS is running:
You should see the following lines appear...
```
Hello World

Launching Server at IP: 192.168.51.109:14141
Configuring Local Address...
Creating Socket...
Binding Socket...
Listening...
```

### TSS usage:
To run the server on local host (which might be useful if using WSL) run the following command
```
./server.exe --local
```
You should see the following lines appear...
```
Hello World

Launching Server at IP: 127.0.0.1:14141
Configuring Local Address...
Creating Socket...
Binding Socket...
Listening...
```

To gracefully shutdown the server, press the `ENTER` button in the prompt.

If using Docker, you must start your container in interactive mode.
```
docker start -i tss_2024
```

---

5. Type the IP address printed by the server into a web browser (Replace with your IP)\
Make sure you are on the same network as the server when connecting to it.
```
http://<SERVER IP ADDRESS>:14141
```
6. From this website, you can interact with the TSS.\
This is where you can monitor the state of the server, verify the display of your system, and virtually interact with the EVA devices like you will be doing in May.

![Image](Images/TSSMainPage.png)


## TSS EVA Devices
### UIA
| Sensor       | Value True | Value False | Description                        |
| ------------ | ---------- | ----------- | ---------------------------------- |
| EMU1 POWER   | ON         | OFF         | Remotely powers the suit for EVA 1 |
| EV1 SUPPLY   | OPEN       | CLOSED      | Fills EVA 1's liquid coolant       |
| EV1 WASTE    | OPEN       | CLOSED      | Flushes EVA 1's liquid coolant     |
| EV1 OXYGEN   | OPEN       | CLOSED      | Fills EVA 1's oxygen tanks         |
| EMU2 POWER   | ON         | OFF         | Remotely powers the suit for EVA 2 |
| EV2 SUPPLY   | OPEN       | CLOSED      | Fills EVA 1's liquid coolant       |
| EV2 WASTE    | OPEN       | CLOSED      | Flushes EVA 1's liquid coolant     |
| EV2 OXYGEN   | OPEN       | CLOSED      | Fills EVA 1's oxygen tanks         |
| O2 Vent      | OPEN       | CLOSED      | Flushes both EVAs oxygen tanks     |
| DEPRESS PUMP | ON         | OFF         | Pressurizes both EVA suits         |

### DCU
| Sensor  | Value True | Value False     | Description                                                                                           |
| ------- | ---------- | --------------- | ----------------------------------------------------------------------------------------------------- |
| BATTERY | SUIT BATT  | UMBILICAL POWER | Describes if the suit is running off its local battery or UIA power                                   |
| OXYGEN  | PRI TANK   | SEC TANK        | Describes if the suit is pulling from primary or secondary oxygen tanks                               |
| COMMS   | Channel A  | Channel B       | Describes if the suit is connected to Channel A or Channel B on comms                                 |
| FAN     | PRI FAN    | SEC FAN         | Describes if the suit is using the primary fan or secondary fan                                       |
| PUMP    | OPEN       | CLOSED          | Describes if the coolant pump for the suit is open or closed (allows water to be flushed or supplied) |
| CO2     | Scrubber A | Scrubber B      | Describes which scrubber is currently filling with CO2 (other is venting)                             |

### COMM TOWER
| Sensor  | Value True | Value False | Description                                   |
| ------- | ---------- | ----------- | --------------------------------------------- |
| COMM    | ON         | OFF         | Describes if the comm tower is powered or not |

### IMU
| Value   | Description               |
| ------- | ------------------------- |
| POSX    | Eastward UTM Coordinates  |
| POSY    | Northward UTM Coordinates |
| HEADING | Direction Facing          |

### ROVER
| Value   | Description               |
| ------- | ------------------------- |
| POSX    | Eastward UTM Coordinates  |
| POSY    | Northward UTM Coordinates |
| QR ID   | Last QR code read         |

### SPEC
| Value   | Description                             |
| ------- | --------------------------------------- |
| NAME    | Name of the rock sample                 |
| ID      | ID of the rock sample                   |
| DATA    | Chemical composition of the rock sample |


-----

## TSS Files

* Server.c: contains the main function with a loop that processes HTTP messages and simulates data in the backend.
* Network.c: contains helper functions for the server to communicate with other devices.
* Server_data.c: contains the data that the server maintains and how that data is updated.
* public folder: contains a frontend for testing your device with TSS, along with all the json files that you will need from the server.
* Dockerfile: contains commands needed to create a Docker image for the TSS.

This server is based on "Network Programming in C" and builds off of the HTTPs example.
