#!/bin/sh
rake assets:precompile
exec "$@"