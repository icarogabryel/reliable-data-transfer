import std.stdio;
import std.format;
import src.checksum;

void main() {
    ubyte[] data = [23, 45, 12, 67, 89, 255, 255, 7];
    word cs = makeChecksum(data);

    int csInInt = cast(int)cs;
    ubyte csInByte1 = cast(ubyte)(csInInt >> 8);
    ubyte csInByte2 = cast(ubyte)(csInInt & 0xFF);
    
    ubyte[] dataWithCs = [23, 45, 12, 67, 89, 255, 255, 7, csInByte1, csInByte2];

    writeln("Checksum:", cs);

    writeln("Data is valid:", verifyByChecksum(dataWithCs));
}
