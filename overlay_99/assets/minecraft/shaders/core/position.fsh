// Created by and for modrinth.com/user/Hxndrik
#version 150

uniform vec4 u_ColorModulator;
uniform float u_FogStart;
uniform float u_FogEnd;
uniform vec4 u_FogColor;

in float in_VertexDistance;
in vec4 in_Position;

out vec4 out_FragColor;

// Calculates linear fog based on distance
vec4 calculate_linear_fog(vec4 inputColor, float distance, float start, float end, vec4 color) {
    if (distance <= start) {
        return inputColor;
    }

    float fogFactor = distance < end ? smoothstep(start, end, distance) : 1.0;
    return vec4(mix(inputColor.rgb, color.rgb, fogFactor * color.a), inputColor.a);
}

void main() {
    vec4 color = u_ColorModulator;
    
    // Modify alpha based on game time and position
    if (color.a < 1.0) { 
        color.a += sin((u_GameTime * 2000.0) + in_Position.x + in_Position.z);
    }
    
    out_FragColor = calculate_linear_fog(color, in_VertexDistance, u_FogStart, u_FogEnd, u_FogColor);
}