precision mediump float;


// receiving uv coordinates from vertex shader because we sent them
varying vec2 vUv;


void main() {


  
  float edgeX = 0.5;
  float edgeY = 0.5;

  // we will increase one of these to be double size from the other
  edgeX = 0.8;
  edgeY = edgeX / 2.0;


  float grid_items = 10.0;


  // pay attention on these
  // these both will use y coordinate
  float strengthX = mod(
    vUv.y * grid_items,
    1.0
  );
  float strengthY = mod(
    vUv.y * grid_items,
    1.0
  );


  // here instead of this we will have two
  // float strength = step(edgeX, strengthX) * step(edgeY, strengthY);
  // and pay attention, we use strengthY for both
  float byX = step(edgeX, strengthY);
  float byY = step(edgeY, strengthY);

  // here we are doing some mixing
  // pay attention on modulo, we used only x coordinate
  byX *= step(edgeY, mod(vUv.x * grid_items, 1.0));
  byY *= step(edgeX, mod(vUv.x * grid_items, 1.0));



  
  float strength = byX + byY;


  gl_FragColor = vec4(vec3(strength), 1.0);


}