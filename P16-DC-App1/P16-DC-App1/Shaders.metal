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

[[ stitchable ]] half4 circleLoader(
    float2 position,
    half4 color,
    float4 bounds,
    float secs
) {
    float cols = 6;
    float PI2 = 6.2831853071795864769252867665590;
    float timeScale = 0.04;

    vector_float2 uv = position/bounds.zw;

    float circle_rows = (cols * bounds.w) / bounds.z;
    float scaledTime = secs * timeScale;

    float circle = -cos((uv.x - scaledTime) * PI2 * cols) * cos((uv.y + scaledTime) * PI2 * circle_rows);
    float stepCircle = step(circle, -sin(secs + uv.x - uv.y));

    // Blue Colors
    vector_float4 background = vector_float4(0.196, 0.051, 0.706, 1.0);
    vector_float4 circles = vector_float4(0.357, 0.525, 0.969, 1.0);

    return half4(mix(background, circles, stepCircle));
}
