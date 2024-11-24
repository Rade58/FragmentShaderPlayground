precision mediump float;


// receiving uv coordinates from vertex shader because we sent them
varying vec2 vUv;


void main() {

  // We want to accomplish to have narrowed rectangles in our pattern
  // this will be the pattern with black rectangles on white background
 

  float edgeX = 0.5;
  float edgeY = edgeX;

  // we will decrease X value to be half from Y value 
  edgeX = 0.4;
  edgeY = edgeX * 2.0;
  // so edgeX is 0.4, and edgeY is 0.8



  float grid_items = 10.0;


  float strengthX = mod(
    vUv.x * grid_items,
    1.0
  );
  float strengthY = mod(
    vUv.y * grid_items,
    1.0
  );


  float byX = step(edgeX, strengthX);
  float byY = step(edgeY, strengthY);
  

  float strength = byX + byY;


  gl_FragColor = vec4(vec3(strength), 1.0);


}