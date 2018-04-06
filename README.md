# Running Hub Detect as part of a Docker multi-stage build

When leveraging Docker as a primary build tool for applications/microservices it becomes necessary to understand open source dependencies at the application layer and the image layer.

Natively, Hub Detect and Hub Docker inspector are able to abstract the two, but not when the focus is on scanning a Docker image.

* Hub Docker Inspector: Uncovers packages/libraries installed via standard linux package managers.
* Hub Detect: Uncovers packages/libraries installed via package managers specific to programming languages. May potentially run a signature scan as well.


