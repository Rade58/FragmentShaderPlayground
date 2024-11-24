precision mediump float;


// receiving uv coordinates from vertex shader because we sent them
varying vec2 vUv;


void main() {

  // We want to accomplish to have squashed rectangles in our pattern
 
  float edgeX = 0.5;
  float edgeY = edgeX;

  // we will decrease Y value to be half from X value 
  edgeX = 0.8;
  edgeY = edgeX / 2.0;
  // so edgeX is 0.8, and edgeY is 0.4



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