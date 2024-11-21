precision mediump float;


// receiving uv coordinates from vertex shader because we sent them
varying vec2 vUv;


void main() {


  // very interesting (try changing 0.2 to something else, and 1.5)
  float strength = mod(sin(vUv.x * 1.5), 0.2 * vUv.y);

  gl_FragColor = vec4(vec3(strength, strength, strength), 1.0);

}