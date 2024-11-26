// already defined with ShaderMaterial
// precision mediump float;

// we did receive this from vertex shader, because we did send it (not done by ShaderMaterial)
varying vec2 vUv;



void main() {

  // length function
  // get length of vectors like vec2 vec3 vec4
  
  // what is length of vUv coordinates for example
  // length = √(x² + y²)

  // so basically it will be the distance from (0.0 , 0.0) to the
  // actual current vUv coordinate (vUv.x, Vuv.y)

  float distanceFromZero = length(vUv);

  // which will create circular gradient with center in (0.0, 0.0)
  // and most black will be in that center

  float strength = distanceFromZero;


  gl_FragColor = vec4(vec3(strength, strength, strength), 1.0);

}