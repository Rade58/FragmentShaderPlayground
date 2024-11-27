// already defined with ShaderMaterial
// precision mediump float;

// we did receive this from vertex shader, because we did send it (not done by ShaderMaterial)
varying vec2 vUv;


// #define PI 3.1415926535897932384626433832795



void main() {

  vec2 center = vec2(0.5);

  // like the previous example but we add step

  float strength = step(0.01, abs(distance(vUv, center) - 0.25));

  strength = 1.0 - strength;

  gl_FragColor = vec4(vec3(strength), 1.0);

}