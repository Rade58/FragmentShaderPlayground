// already defined with ShaderMaterial
// precision mediump float;

// we did receive this from vertex shader, because we did send it (not done by ShaderMaterial)
varying vec2 vUv;



void main() {

  // pattern 39 but the other way


  vec2 center = vec2(0.5);

  // to create circular gradient in center
  // instead of this
  // float distanceFromZero = length(vUv - center);
  // we ca njust use this
  float distanceFromZero = distance(vUv, center);


  float strength = distanceFromZero;


  gl_FragColor = vec4(vec3(strength, strength, strength), 1.0);

}