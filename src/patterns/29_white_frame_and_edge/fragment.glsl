precision mediump float;


// receiving uv coordinates from vertex shader because we sent them
varying vec2 vUv;


void main() {

  // nased on previous example but we parametarized
  // edge value of the step call
  float edge = 0.4; // change edge to see what will be effect
  // but maximum should be 0.5 because there white would
  // disapear
  edge = 0.5;
  edge = 0.1;
  
  vec2 center = vec2(0.5);


  float strengthX = abs(vUv.x - center.x);
  float strengthY = abs(vUv.y - center.y);

 
  float strength = step(edge, max(strengthX, strengthY));

  

  gl_FragColor = vec4(vec3(strength), 1.0);

}