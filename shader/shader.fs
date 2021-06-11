#version 330 core
out vec4 FragColor;

// in vec3 ourColor;

in vec3 vPos;
in vec2 TexCoord;

uniform float ourColor;
uniform sampler2D ourTexture;

void main()
{
    // FragColor = vec4(0,ourColor,0, 1.0);
    FragColor = texture(ourTexture, TexCoord);
}