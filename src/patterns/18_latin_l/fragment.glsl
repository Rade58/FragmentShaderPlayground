precision mediump float;


// receiving uv coordinates from vertex shader because we sent them
varying vec2 vUv;


void main() {

  // To get desired result I modified previous example
  // on few places
  // again, this was pretty brutish; changing math operations, places
  // till I got the desired result

  // this is not perfect "inversion" of previous example
  // but it would look like it

  

  float edgeX = 0.5;
  float edgeY = 0.5;

  // well, first we know that one of the edge values needs to be
  // smaller than the other
  edgeY = 0.8;
  edgeX = edgeX / 2.0;


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
  float byX = step(edgeX, strengthX);
  float byY = step(edgeY, strengthX);

  // here we do mentioned multiplication I talked about
  // but as you can see, we are only passing y value of strength
  // a+d for the edge, we are mixing it as you can see x to y, and y to x
  byX += step(edgeY, strengthY);
  byY += step(edgeX, strengthY);


  // and here we doo addition operation
  float strength = 1.0 - byY * byX;



  gl_FragColor = vec4(vec3(strength), 1.0);


}