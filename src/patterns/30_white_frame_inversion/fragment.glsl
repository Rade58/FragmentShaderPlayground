precision mediump float;


// receiving uv coordinates from vertex shader because we sent them
varying vec2 vUv;


void main() {

  // based on previous example
  // we just substract final result from one


  float edge = 0.2; // I also lowered this value (maxixmu should be 0.5 as I said in previous example)
  
  vec2 center = vec2(0.5);


  float strengthX = abs(vUv.x - center.x);
  float strengthY = abs(vUv.y - center.y);

 
  float strength = step(edge, max(strengthX, strengthY));

  strength = 1.0 - strength;

  // at the end we get small white rectangle
  // or if we look from other mental perspective, we can
  // say that we have black frame

  gl_FragColor = vec4(vec3(strength), 1.0);

}