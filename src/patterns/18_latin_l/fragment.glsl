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

  // instead of X, we will make Y value two times bigger (differnt from previous example)
  edgeY = 0.8;
  edgeX = edgeX / 2.0;


  float grid_items = 10.0;


  float strengthY = mod(
    vUv.y * grid_items,
    1.0
  );
  float strengthX = mod(
    vUv.x * grid_items,
    1.0
  );


  // here for strength we use both X values (diffrence from previous example)
  float maskX = step(edgeX, strengthX);
  float maskY = step(edgeY, strengthX);

  // instead of both X strenghths we use Y strenghts
  // and we are incrementing
  // (differnt from previous example)
  maskX += step(edgeY, strengthY);
  maskY += step(edgeX, strengthY);


  // and here we do multiplication, and we are doing substraction from 1.0
  // (differnt from previous example)
  float strength = 1.0 - maskY * maskX;


  gl_FragColor = vec4(vec3(strength), 1.0);

}