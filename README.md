# midclt

Unofficial container image based on [midclt](https://github.com/truenas/api_client/) command line interface for TrueNAS Scale API.

See [official docs](https://www.truenas.com/docs/api/scale_websocket_api.html#websocket_protocol) for available actions.

## Example usage

### Get system info

```bash
docker run --rm -it \
  ghcr.io/davidecavestro/midclt \
  --uri 'ws://my.truenas/websocket' \
  --api-key 'THEAPIKEY' call system.info 
```

### Property format output on terminal

On my Linux box, I need to convert EOLs in order to format command output using `jq`

```bash
docker run --rm -it \
  ghcr.io/davidecavestro/midclt \
  --uri 'ws://my.truenas/websocket' \
  --api-key 'THEAPIKEY' call system.info \
  | dos2unix | jq .
```
![image](https://github.com/user-attachments/assets/1618ec2c-cf09-48a0-a4f9-20d7f16964e4)


## Image project home

https://github.com/davidecavestro/midclt-docker


