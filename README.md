# UUID Server

A simple FastAPI app with only a few endpoints:.
- The root: `/` - Say hi.
- Health check: `/health` - Tell the hostname so we can check which replica answers the request.
- Get new UUID: `/uuids/new` - Generate a new UUID.

To get up and running:

```
$ export VERSION=240901  # Check version format in Makefile
$ make build
$ make run
```

Go to `http://localhost:8080/docs` in your internet browser to see API docs.

Run `$ make` to see available actions and some instructions.