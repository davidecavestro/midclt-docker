# midclt

A container image based on [midclt](https://github.com/truenas/api_client/) TrueNAS api client command line interface.

See [official docs](https://www.truenas.com/docs/api/scale_websocket_api.html#websocket_protocol) for available actions.

## Example usage

### Get system info

```bash
docker run --rm -it \
  davidecavestro/midclt \
  --uri 'ws://my.truenas/websocket' \
  --api-key 'THEAPIKEY' call system.info 
```


## Image project home

https://github.com/davidecavestro/midclt-docker


