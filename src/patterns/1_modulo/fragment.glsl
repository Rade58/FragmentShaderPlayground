precision mediump float;


// receiving uv coordinates from vertex shader because we sent them
varying vec2 vUv;


void main() {

  // we all know what modulo is
  // we know that we need to pass a dividend and a divisor
  // we know that modulo produces    -reminder-

  float strength = mod(vUv.x, vUv.y);

  gl_FragColor = vec4(vec3(strength), 1.0);

}