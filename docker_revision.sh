#!/bin/bash

sed -i -E "s/Revision: .+/Revision: $(git rev-list -n 1 HEAD)\"/" Dockerfile
