precision mediump float;


// receiving uv coordinates from vertex shader because we sent them
varying vec2 vUv;


void main() {

  // this is a modification of example 14
  // We want to accomplish to have narrowed rectangles in our pattern
  // which we already did previouslly
  // but we want a pattern with white rectangles on black background
  // which was other way around in example 14
  
  // for this we need to change our example 14 on two places

  float edgeX = 0.5;
  float edgeY = edgeX;

  // this is a first place where we are changing things
  // instead of this 
  edgeX = 0.4;
  edgeY = edgeX * 2.0;
  // we will invert it like this
  edgeY = 0.4;
  edgeX = edgeX * 2.0;



  float grid_items = 10.0;


  float strengthX = mod(
    vUv.x * grid_items,
    1.0
  );
  float strengthY = mod(
    vUv.y * grid_items,
    1.0
  );


  float maskX = step(edgeX, strengthX);
  float maskY = step(edgeY, strengthY);
  
  // this is the second place we are changing things
  // instead of addition
  float strength = maskX + maskY;
  // we will do multiplication
  strength = maskX * maskY;


  gl_FragColor = vec4(vec3(strength), 1.0);


}