// already defined with ShaderMaterial
// precision mediump float;

// we did receive this from vertex shader, because we did send it (not done by ShaderMaterial)
varying vec2 vUv;


// #define PI 3.1415926535897932384626433832795






void main() {

  
  float amplitude = 0.1;
  float frequency = 30.0; // play around with frequency
  //                       try incresing it to 120.0
  // frequency = 120.0;

  vec2 center = vec2(0.5);

  // same as previus lesson (53) but we use sinus offset for
  // x coordinate too

  vec2 wavedUv = vec2(
    vUv.x + sin(vUv.y * frequency) * amplitude,
    vUv.y + sin(vUv.x * frequency) * amplitude
  );

  float strength = step(0.01, abs(distance(wavedUv, center) - 0.25));

  strength = 1.0 - strength;

  gl_FragColor = vec4(vec3(strength), 1.0);

}