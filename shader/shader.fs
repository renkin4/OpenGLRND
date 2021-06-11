#version 330 core
out vec4 FragColor;

// in vec3 ourColor;

in vec3 vPos;
in vec2 TexCoord;

uniform float ourColor;
uniform sampler2D texture1;
uniform sampler2D texture2;

uniform float mixVal;

void main()
{
    // FragColor = vec4(0,ourColor,0, 1.0);
    FragColor = mix(texture(texture1, TexCoord), texture(texture2, vec2(-TexCoord.x, TexCoord.y)), 0.5);
}