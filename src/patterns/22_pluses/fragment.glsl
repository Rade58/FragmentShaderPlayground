precision mediump float;


// receiving uv coordinates from vertex shader because we sent them
varying vec2 vUv;


void main() {

  
  float edgeOne = 0.5;
  float edgeTwo = 0.5;

  edgeOne = 0.8;
  edgeTwo = edgeOne / 2.0;


  float grid_items = 10.0;

  float strengthOneY = mod(
    vUv.y * grid_items,
    1.0
  );
  float strengthOneX = mod(
    vUv.x * grid_items,
    1.0
  );

  // we created additional modulos
  // where we are adding offset to dividend

  float strengthTwoY = mod(
    vUv.y * grid_items + edgeTwo / 2.0, // this has plus offset 2.0
    1.0
  );
  float strengthTwoX = mod(
    vUv.x * grid_items - edgeTwo / 2.0, // this has minus offset 2.0
    1.0
  );


  // here we added modulo value made with offset
  float maskX = step(edgeTwo, strengthTwoX);
  
  float maskY = step(edgeOne, strengthOneX);

  // here we added other modulo value made with offset
  maskX *= step(edgeOne, strengthTwoY);
  
  maskY *= step(edgeTwo, strengthOneY);



  // and here we doo addition operation
  float strength = maskX + maskY;


  gl_FragColor = vec4(vec3(strength), 1.0);


}