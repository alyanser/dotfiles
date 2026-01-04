#version 300 es
precision highp float;

in vec2 v_texcoord;
out vec4 FragColor;
uniform sampler2D tex;

const vec3 VIB_RGB_BALANCE = vec3(1.0, 1.0, 1.0);
const float VIB_VIBRANCE = 0.40;
const vec3 VIB_coeffVibrance = VIB_RGB_BALANCE * -VIB_VIBRANCE;

void main() {
    vec4 pixColor = texture(tex, v_texcoord);
    vec3 color = pixColor.rgb;

    vec3 VIB_coefLuma = vec3(0.212656, 0.715158, 0.072186);
    float luma = dot(VIB_coefLuma, color);

    float max_color = max(color.r, max(color.g, color.b));
    float min_color = min(color.r, min(color.g, color.b));
    float color_saturation = max_color - min_color;

    vec3 p_col = vec3(sign(VIB_coeffVibrance) * color_saturation - 1.0) * VIB_coeffVibrance + 1.0;

    pixColor.r = mix(luma, color.r, p_col.r);
    pixColor.g = mix(luma, color.g, p_col.g);
    pixColor.b = mix(luma, color.b, p_col.b);

    FragColor = pixColor;
}
