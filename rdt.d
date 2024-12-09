import std.stdio;
import std.format;

// struct Word {
//     ubyte byte1;
//     ubyte byte2;
// }

void main() {
    byte b = 0xF;
    writeln(format("%0x", b)); // Output: 100
}
