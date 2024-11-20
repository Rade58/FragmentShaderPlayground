precision mediump float;


// receiving uv coordinates from vertex shader because we sent them
varying vec2 vUv;


void main() {

  // - all 3 coords are the same which means it will be gray
  // - but since we use uv coords, we will have gradient
  float strength = vUv.x;  // over x (from left to right, black to white)

  strength = vUv.y; // over y (from bottom to top, black to white)

  gl_FragColor = vec4(vec3(strength), 1.0);
}