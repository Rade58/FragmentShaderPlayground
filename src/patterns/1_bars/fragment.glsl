precision mediump float;


// receiving uv coordinates from vertex shader because we sent them
varying vec2 vUv;


void main() {

  // using modulo to get some interesting patterns

  float strength = mod(vUv.x * 10.0, 1.0);

  // same number of fragments but darker gray is prevalent
  strength = mod(vUv.x, 0.1);

  strength = mod(vUv.y, vUv.x);

  // interesting
  strength = mod(vUv.x, vUv.y);

  // this one will give you something that
  // resembles old catode tv look, a bit unpleasing for the eyes
  // when you move the camera
  strength = mod(vUv.x, vUv.x);
  strength = mod(vUv.y, vUv.y);

  // back to the first one
  strength = mod(vUv.x * 10.0, 1.0);

  // this will just create mirror
  // you won;t notice anything changed
  strength = 1.0 - mod(vUv.x * 20.0, 1.0);
  
  gl_FragColor = vec4(vec3(strength), 1.0);

}