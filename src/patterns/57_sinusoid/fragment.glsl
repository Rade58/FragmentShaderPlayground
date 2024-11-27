// already defined with ShaderMaterial
// precision mediump float;

// we did receive this from vertex shader, because we did send it (not done by ShaderMaterial)
varying vec2 vUv;


#define PI 3.1415926535897932384626433832795



void main() {

  
  float angle = atan(vUv.x - 0.5, vUv.y - 0.5);


  angle /= PI * 2.0;

  angle += 0.5;

  // instead of this which we used in previous example
  // float strength = mod(angle * 20.0, 1.0);
  // we use sinus with large frequency
  float sinusoid = sin(angle * 100.0);

  float strength = sinusoid;
  
  // strength = 1.0 - strength;


  gl_FragColor = vec4(vec3(strength), 1.0);

}