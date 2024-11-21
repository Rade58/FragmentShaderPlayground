precision mediump float;


// receiving uv coordinates from vertex shader because we sent them
varying vec2 vUv;


void main() {

  // using modulo to get some interesting patterns

  // 10 vertical fragments because we are using x
  float strength = mod(vUv.x * 10.0, 1.0);

  // 10 horizontal fragments because we are using y
  strength = mod(vUv.y * 10.0, 1.0);

  // same number of fragments but darker gray is prevalent
  strength = mod(vUv.x, 0.1);

  // interesting
  strength = mod(vUv.y, vUv.x);

  // interesting
  strength = mod(vUv.x, vUv.y);

  // this one will give you something that
  // resembles old catode tv look, a bit unpleasing for the eyes
  // when you move the camera
  strength = mod(vUv.x, vUv.x);
  strength = mod(vUv.y, vUv.y);

  // more segments
  strength = mod(vUv.x * 20.0, 1.0);

  // this will just create mirror
  // you won't notice anything changed in terms of color
  // but direction will be changed (try it few times and pay attention
  // how direction changes)
  strength = 1.0 - strength;
  
  gl_FragColor = vec4(vec3(strength), 1.0);

}