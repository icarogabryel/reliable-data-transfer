module checksum;

alias word = short;  // 16-bit word

word checksum(byte[] data) {
    long sum = 0;  // 32-bit sum
    word currentWord;

    while (data.length > 1) {  // Loops until one or zero bytes are left
        currentWord = (data[0] << 8) + data[1];  // byte 1 is concatenated with byte 2 by this operation
        sum += word;
        data = data[2 .. $];  // Removes the first two bytes from the data
    }

    if (data.length) {  // If there is one byte left
        sum += data[0] << 8;  // Use the byte as the high byte of the word and adds it to the sum
    }

    while (sum >> 16) {
        sum = (sum & 0xFFFF) + (sum >> 16);  // Add the carry to the lower 16 bits
    }

    return cast(word) ~sum;
}

void main() {
    byte[] data = [1,2,3];
    word result = checksum(data);
    assert(result == 0xB861);
}
