// already defined with ShaderMaterial
// precision mediump float;

// we did receive this from vertex shader, because we did send it (not done by ShaderMaterial)
varying vec2 vUv;



void main() {



  vec2 center = vec2(0.5);

  // we use multiplication here
  // the bigger multiplicand on the right
  // the smaller circle you will get
  float strength = distance(vUv, center) * 10.0;

  // and if you want white circle on black background
  // we can do this
  strength = 1.0 - strength;

  gl_FragColor = vec4(vec3(strength), 1.0);

}