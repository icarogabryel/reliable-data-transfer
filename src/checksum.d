module src.checksum;

alias word = ushort;  // 16-bit word

word sumWithCarry(ubyte[] data) {
    long sum = 0;  // 32-bit sum
    word currentWord;

    while(data.length > 1) {  // Loops until one or zero bytes are left
        currentWord = cast(word)((data[0] << 8) + data[1]);  // Concatenates two bytes by this formula
        sum += currentWord;

        if(sum >> 16) { // If there is a carry
            sum = (sum & 0xFFFF) + 1;  // Remove the carry and add it to the sum
        }

        data = data[2 .. $];  // Removes the processed bytes from the data
    }

    if(data.length) {  // If there is one byte left
        sum += data[0] << 8;  // Use the byte as the high byte of the word and adds it to the sum

        while(sum >> 16) { // If there is a carry
            sum = (sum & 0xFFFF) + 1;  // Add the carry to the sum
        }
    }

    return cast(word) sum;  // Returns sum
}

word makeChecksum(ubyte[] data) {
    return cast(word) ~sumWithCarry(data);  // Returns the one's complement of the sum
}

bool verifyByChecksum(ubyte[] data) {
    return sumWithCarry(data) == cast(word)0xFFFF;  // Returns true if the sum is 0xFFFF
}
