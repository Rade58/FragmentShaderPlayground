precision mediump float;


// receiving uv coordinates from vertex shader because we sent them
varying vec2 vUv;


void main() {

  // this example should be a combination of previous two examples
  // in some way, but not really
  // but how to accomplish this
  
  // we want a combination of squashed and narrowed rectangle pattern
  //      where to start:    we need different values for edge arguments  
  // and we want white "objects" on black surface pattern
  //      where to start:    we need to multiply results of step calls
  


  float edgeX = 0.5;
  float edgeY = 0.5;

  // well, first we know that one of the edge values needs to be
  // smaller than the other
  edgeX = 0.8;
  edgeY = edgeX / 2.0;


  float grid_items = 10.0;


  // we did this modulo the same in mentioned previous examples  
  float strengthY = mod(
    vUv.y * grid_items,
    1.0
  );
  float strengthX = mod(
    vUv.x * grid_items,
    1.0
  );


  // and pay attention, we use strengthY for both
  // but we use different edge values
  float maskX = step(edgeX, strengthY);
  float maskY = step(edgeY, strengthY);

  // here we do mentioned multiplication I talked about
  // but as you can see, we are only passing y value of strength
  // and for the edge, we are mixing it as you can see x to y, and y to x
  maskX *= step(edgeY, strengthX);
  maskY *= step(edgeX, strengthX);



  // and here we doo addition operation
  float strength = maskX + maskY;


  gl_FragColor = vec4(vec3(strength), 1.0);


}