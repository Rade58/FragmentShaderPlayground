// already defined with ShaderMaterial
// precision mediump float;

// we did receive this from vertex shader, because we did send it (not done by ShaderMaterial)
varying vec2 vUv;



void main() {

  vec2 center = vec2(0.5);

  // I just used step to create black circle
  // on the white background

  float strength = step(0.25, length(vUv - center)); 


  gl_FragColor = vec4(vec3(strength, strength, strength), 1.0);

}