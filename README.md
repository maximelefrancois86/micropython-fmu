# Micropython FMU

Ship and run a FMU with Micropython.


## How to use

1. Open your terminal.

2. Clone the MicroPython repository to a directory of your choice, and build [MicroPython cross-compiler](https://github.com/micropython/micropython/blob/master/mpy-cross)

```bash
git clone -b v1.21.0 --depth 1 --recurse-submodules --shallow-submodules https://github.com/micropython/micropython.git
cd micropython
cd mpy-cross
make
cd ..
```

## Step 2: Add this project as a submodule

```bash
git submodule init
git submodule update
git submodule add --name lib/micropython-fmu https://github.com/maximelefrancois86/micropython-fmu lib/micropython-fmu
```

## Step 3: Add some FMU in folder `fmu`

```
micropython/fmu/MyModel.fmu
```

## Step 4: Build and Run MicroPython with `ufmpy`

### UNIX port

To build on UNIX port

```bash
cd ../ports/unix
make submodules
sed -i '/CWARN = -Wall -Werror/cCWARN = -Wall #CWARN = -Wall -Werror' Makefile
make USER_C_MODULES=../../lib/micropython-fmu
```

After build, you can run it by:
    
```bash
./build-standard/micropython
```
