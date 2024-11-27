// already defined with ShaderMaterial
// precision mediump float;

// we did receive this from vertex shader, because we did send it (not done by ShaderMaterial)
varying vec2 vUv;


#define PI 3.1415926535897932384626433832795



void main() {

  vec2 center = vec2(0.5); // we will need center to use with distance

  
  float angle = atan(vUv.x - 0.5, vUv.y - 0.5);


  angle /= PI * 2.0;

  angle += 0.5;


  
  float sinusoid = sin(angle * 100.0);
  
  // we will define radius
  float radius = 0.25 + sinusoid * 0.02; 

  // instead of this
  // float strength = sinusoid;
  // we write this
  float strength = step(0.01, abs(distance(vUv, center) - radius));
  
  strength = 1.0 - strength;


  gl_FragColor = vec4(vec3(strength), 1.0);

}