//
//  Shaders.metal
//  P16-DC-App1
//
//  Created by Yuriy Gudimov on 31.01.25.
//

#include <metal_stdlib>
using namespace metal;

[[ stitchable ]] half4
angledFill(float2 position, float width, float angle, half4 color)
{
    float pMagnitude = sqrt(position.x * position.x + position.y * position.y);
    float pAngle = angle +
        (position.x == 0.0f ? (M_PI_F / 2.0f) : atan(position.y / position.x));
    float rotatedX = pMagnitude * cos(pAngle);
    float rotatedY = pMagnitude * sin(pAngle);
    return (color + color * fmod(abs(rotatedX + rotatedY), width) / width) / 2;
}

//[[ stitchable ]] float2 complexWave(float2 position, float time, float2 size, float speed, float strength, float frequency) {
//    float2 normalizedPosition = position / size;
//    float moveAmount = time * speed;
//
//    position.x += sin((normalizedPosition.x + moveAmount) * frequency) * strength;
//    position.y += cos((normalizedPosition.y + moveAmount) * frequency) * strength;
//
//    return position;
//}
