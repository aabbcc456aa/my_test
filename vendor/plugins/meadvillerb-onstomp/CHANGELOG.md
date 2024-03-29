# Changes

## 1.0.4
* fixed major oversight when using ruby 1.8.7 / jruby with an SSL connection.
  it will use blocking read/write methods if nonblocking methods are unavailable
* added write and read block timeouts. if there is no write activity for a period
  of time (default of 120 seconds), the connection is assumed to be dead. read
  activity is handled similarly, but only when performing the CONNECT/CONNECTED
  exchange, after that we have no way of knowing if the broker just doesn't
  have any data for us (unless using a STOMP 1.1 connection with heartbeating)
* refactored common failover buffer code into lib/onstomp/failover/buffers/base

## 1.0.3
* change how failover spawns new connections when failing over.

## 1.0.2
* allow failover clients to be constructed from regular OnStomp::Client
  instances, allowing fully configured SSL connections.

## 1.0.1
* improved failover buffer handling
* added RECEIPT driven failover buffer handling - more reliable, but slower
  as it requests receipts for nearly all frames.

## 1.0.0
* initial release
* support for STOMP 1.0 and STOMP 1.1 protocols
* fully featured client with event bindings and non-blocking IO
* experimental support for open-uri STOMP interface
* experimental support for failover/reliable connection handling

## 1.0pre - 2011-03-30
* initial pre-release
