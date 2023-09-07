import QtQuick 2.15

QtObject {
    enum Limit {
        None = 0,
        VerySlow = 30,
        Slow = 50,
        Medium = 70,
        Fast = 90,
        VeryFast = 140,
        LimitsCount = 6
    }
}
