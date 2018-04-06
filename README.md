# Running Hub Detect as part of a Docker multi-stage build

When leveraging Docker as a primary build tool for applications/microservices it becomes necessary to understand open source dependencies at the application layer and the image layer.

## Hub Detect

Natively, Hub Detect and Hub Docker inspector are able to abstract the two, but not when the focus is on scanning a Docker image.

* Hub Docker Inspector: Uncovers packages/libraries installed via standard linux package managers.
* Hub Detect: Uncovers packages/libraries installed via package managers specific to programming languages. May potentially run a signature scan as well.

## Docker multi-stage

With multi-stage builds, we can use multiple `FROM` statements in a Dockerfile, and copy artifacts from one stage to another, leaving behind everything that is not required in the final built image. 

More specifically, we will create an intermediary 'black duck' build stage to accomplish the identification of application dependencies. 

## Inside the Dockerfile

* Stage 1: Conduct a Black Duck scan on current application directory structure.
* Stage 2: Build final release image. 

### Docker build will fail if any policy violations occur. 

Adding the first initial stage to the Dockerfile will offer insight into the application dependencies. After, a scan can be run on the release image to understand the base/os layer linux dependencies.

