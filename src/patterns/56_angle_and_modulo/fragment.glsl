// already defined with ShaderMaterial
// precision mediump float;

// we did receive this from vertex shader, because we did send it (not done by ShaderMaterial)
varying vec2 vUv;


#define PI 3.1415926535897932384626433832795



void main() {

  
  float angle = atan(vUv.x - 0.5, vUv.y - 0.5);


  angle /= PI * 2.0;

  angle += 0.5;

  // instead of this
  // float strength = angle;

  // we define this
  // we will have 20 segments
  float strength = mod(angle * 20.0, 1.0);




  gl_FragColor = vec4(vec3(strength), 1.0);

}