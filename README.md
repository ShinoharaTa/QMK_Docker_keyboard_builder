# QMK_Docker_keyboard_builder

Install QMK Firmware in your computer and use Keymap files from Your QMK Repository .

## Hou to Use

```txt
. :your_directory
├─ qmk_firmware : Your QMK firmware directory.
├─ qmk_docker : This directory
    ├─ docker-compose.yml
    └─ Dockerfile
```

## Use Command

Up docker compose

```bash
cd [your_directory]
docker compose build --no-cache
docker compose up -d
```

Down docker compose

```bash
cd [your_directory]
docker compose down
```

Use QMK Command

```bash
docker compose exec qmk qmk compile -kb shiro -km default
```

Compiled file your QMK Firmware Dir.  
`~/your_directory/qmk_firmware/.build/`  
Let's write generated firmware .hex file.

## Change mount QMK firmware directory

ex.

```txt
. :your_directory
├─ qmk_firmware : Your QMK firmware directory (current).
├─ qmk_firmware_other_user : Other clone QMK Repository. <-
├─ qmk_docker : This directory
    ├─ docker-compose.yml
    └─ Dockerfile
```

### exit Docker container

```bash
docker compose down
```

### switch mount directory

Please open `docker-compose.yml`.  
Change mount directory

```diff
    volumes:
-     - ../qmk_firmware/keyboards:/root/qmk_firmware/keyboards
-     - ../qmk_firmware/.build:/root/qmk_firmware/.build
+     - ../qmk_firmware_other_user/keyboards:/root/qmk_firmware/keyboards
+     - ../qmk_firmware_other_user/.build:/root/qmk_firmware/.build
```

### restart docker container

```bash
docker compose up -d
```
