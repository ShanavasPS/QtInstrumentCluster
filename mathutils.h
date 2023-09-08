#ifndef MATHUTILS_H
#define MATHUTILS_H

#include <random>
#include <cmath>

template<typename T>
T randomize(T valMin, T valMax)
{
    return valMin + (T) (rand() * (valMax - valMin));
}

template<typename T>
T randomScale(T val, T scaleMin, T scaleMax)
{
    return val * randomize(scaleMin, scaleMax);
}

template<typename T>
T randomChoice(T maxVal, T minVal = 0)
{
    return (T) randomize((int) minVal, (int) maxVal + 1);
}

template<typename T>
T clamp(T val, T min, T max)
{
    return val < min ? min : val > max ? max : val;
}

template<typename T>
T linearPartitionSelect(T percent, T partBegin, T partEnd)
{
    return partBegin + percent * (partEnd - partBegin);
}

template<typename T>
T sqrtPartitionSelect(T percent, T partBegin, T partEnd)
{
    return partBegin + sqrt(percent) * (partEnd - partBegin);
}

#endif // MATHUTILS_H
