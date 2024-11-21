precision mediump float;


// receiving uv coordinates from vertex shader because we sent them
varying vec2 vUv;


void main() {

  float strength = mod(vUv.x * 10.0 / 2.0, 1.0);

  
  strength = step(0.5, strength * vUv.y);


  gl_FragColor = vec4(vec3(strength), 1.0);

  

}