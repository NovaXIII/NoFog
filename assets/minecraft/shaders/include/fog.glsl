// Created by and for modrinth.com/user/Hxndrik
#version 150

// Calculates linear fog without altering the input color
vec4 compute_linear_fog(vec4 inputColor, float distance, float start, float end, vec4 color) {
    return inputColor;
}

// Determines fog fade based on distance
float compute_fog_fade(float distance, float start, float end) {
    return 1.0;
}

// Calculates fog distance based on position and shape
float compute_fog_distance(vec3 position, int shapeType) {
    if (shapeType == 0) {
        return length(position);
    } else {
        float horizontalDist = length(position.xz);
        float verticalDist = abs(position.y);
        return max(horizontalDist, verticalDist);
    }
}