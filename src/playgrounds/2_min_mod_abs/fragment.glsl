precision mediump float;


// receiving uv coordinates from vertex shader because we sent them
varying vec2 vUv;


void main() {

  
  vec2 center = vec2(0.5);


  float strengthX = mod(abs(vUv.x - center.x) * 10.0, 1.0);
  float strengthY = mod(abs(vUv.y - center.y) * 10.0, 1.0);

  
  float strength = min(strengthX, strengthY);
  strength = max(strengthX, strengthY);


  gl_FragColor = vec4(vec3(strength - 0.1, strength - 0.6, strength), 1.0);

}