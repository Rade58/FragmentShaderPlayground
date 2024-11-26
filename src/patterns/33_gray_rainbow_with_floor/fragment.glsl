// already defined with ShaderMaterial
// precision mediump float;

// we did receive this from vertex shader, because we did send it (not done by ShaderMaterial)
varying vec2 vUv;


void main() {

  
 
  // same as previous example, but instead of using
  // round, we are using floor 
  // float strength = round(vUv.x * 10.0) / 10.0;
  float strength = floor(vUv.x * 10.0) / 10.0;

  // what we acomplished, we have evenly distributed color segments
  
  // last segment, a white color segment was narrower than the rest
  // when we were using round

  gl_FragColor = vec4(vec3(strength, strength, strength), 1.0);

}