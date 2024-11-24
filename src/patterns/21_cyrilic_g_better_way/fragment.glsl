precision mediump float;


// receiving uv coordinates from vertex shader because we sent them
varying vec2 vUv;


void main() {

  // this is the modification of 17
  // better way of accomplishinfg what I wanted than example 19

  // we just substracted one coordinate from 1.0 
  
  float edgeX = 0.5;
  float edgeY = 0.5;

  edgeX = 0.8;
  edgeY = edgeX / 2.0;


  float grid_items = 10.0;

  float strengthY = mod(
    vUv.y * grid_items,
    1.0
  );
  // here I substracted from 1.0, instead using just x
  float strengthX = mod(
    (1.0 - vUv.x) * grid_items,
    1.0
  );



  float maskX = step(edgeY, strengthY);
  float maskY = step(edgeX, strengthY);

  maskX *= step(edgeX, strengthX);
  maskY *= step(edgeY, strengthX);



  // and here we doo addition operation
  float strength = maskX + maskY;


  gl_FragColor = vec4(vec3(strength), 1.0);


}