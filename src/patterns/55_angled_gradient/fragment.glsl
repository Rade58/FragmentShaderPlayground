// already defined with ShaderMaterial
// precision mediump float;

// we did receive this from vertex shader, because we did send it (not done by ShaderMaterial)
varying vec2 vUv;


#define PI 3.1415926535897932384626433832795



void main() {

  
  float angle = atan(vUv.x - 0.5, vUv.y - 0.5);

  // a but complicated, we add these offset so gradient
  // would "flow" to the end of the plane

  angle /= PI * 2.0;

  angle += 0.5;

  float strength = angle;

  gl_FragColor = vec4(vec3(strength), 1.0);

}