# Reliable Data Transfer Protocol

Reliable Data Transfer Protocol (RDT) is a protocol that provides reliable data transfer between two devices. It is a simple protocol that uses a sliding window mechanism to ensure that data is transferred reliably between the sender and the receiver. The protocol uses a combination of acknowledgements and timeouts to ensure that data is transferred correctly and in the correct order.

## Checksum

the checksum algorithm is a simple algorithm that calculates the checksum of a packet by summing the values of all the bytes in the packet and then taking the one's complement of the result. The checksum is then added to the packet as a header field. When the packet is received, the receiver calculates the checksum of the packet and compares it to the checksum in the packet header. If the two checksums match, the packet is considered to be error-free. If the checksums do not match, the packet is considered to be corrupt and is discarded.
