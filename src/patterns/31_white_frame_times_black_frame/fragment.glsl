precision mediump float;


// receiving uv coordinates from vertex shader because we sent them
varying vec2 vUv;


void main() {

  // this example is combination of two previous ones
  // 29 and 30
  // to be precise, a multiplication
  // of results from previous two examples

  // we need two of these edge value to be in between the 0.0 andd 0.5
  // and one needs to be bigger than the other
  float edgeOne = 0.1;
  float edgeTwo = 0.2;
  
  vec2 center = vec2(0.5);


  float strengthX = abs(vUv.x - center.x);
  float strengthY = abs(vUv.y - center.y);

 
  float whiteFrame = step(edgeOne, max(strengthX, strengthY));
  float blackFrame = 1.0 - step(edgeTwo, max(strengthX, strengthY));

  float strength = blackFrame * whiteFrame;

  // the result this will give us is black frame around white frame
  // around black rectangle

  
  gl_FragColor = vec4(vec3(strength), 1.0);

}