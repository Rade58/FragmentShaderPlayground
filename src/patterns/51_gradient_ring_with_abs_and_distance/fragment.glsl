// already defined with ShaderMaterial
// precision mediump float;

// we did receive this from vertex shader, because we did send it (not done by ShaderMaterial)
varying vec2 vUv;


// #define PI 3.1415926535897932384626433832795






void main() {

  vec2 center = vec2(0.5);

  // we start by using distance again, but we substract 0.25 
  // we made dark circle gradient inside gray frame
  // and we use    abs    to create small gradient circle inside  


  float strength = abs(distance(vUv, center) - 0.25);

  // strength = 1.0 - strength;

  gl_FragColor = vec4(vec3(strength), 1.0);

}