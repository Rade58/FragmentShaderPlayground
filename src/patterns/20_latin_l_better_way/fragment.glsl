precision mediump float;


// receiving uv coordinates from vertex shader because we sent them
varying vec2 vUv;


void main() {

  // this is the modification of 17
  // better way of accomplishinfg what I wanted than example 18

  // we just substracted both coordinates from 1.0

  float edgeX = 0.5;
  float edgeY = 0.5;

  
  edgeX = 0.8;
  edgeY = edgeX / 2.0;


  float grid_items = 10.0;

  // here I substracted from 1.0, instead using just y
  float strengthY = mod(
    (1.0 - vUv.y) * grid_items,
    1.0
  );
  // here I substracted from 1.0, instead using just x
  float strengthX = mod(
    (1.0 - vUv.x) * grid_items,
    1.0
  );


  float maskX = step(edgeX, strengthY);
  float maskY = step(edgeY, strengthY);

  maskX *= step(edgeY, strengthX);
  maskY *= step(edgeX, strengthX);


  float strength = maskX + maskY;


  gl_FragColor = vec4(vec3(strength), 1.0);


}