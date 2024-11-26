precision mediump float;


// receiving uv coordinates from vertex shader because we sent them
varying vec2 vUv;


void main() {

  
  vec2 center = vec2(0.5);


  float strengthX = abs(vUv.x - center.x);
  float strengthY = abs(vUv.y - center.y);

  // based on previous example (27), but we are using step
  // to eliminate gradient
  
  // instead of this
  // float strength = max(strengthX, strengthY);
  
  // we write step call with desired edge argument 
  float strength = step(0.2, max(strengthX, strengthY));

  // we will have black rectangle on the white background
  // or if we mentaly look from another perspective
  // we can say that we have white frame
  

  gl_FragColor = vec4(vec3(strength), 1.0);

}