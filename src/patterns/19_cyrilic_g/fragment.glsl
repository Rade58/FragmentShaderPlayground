precision mediump float;


// receiving uv coordinates from vertex shader because we sent them
varying vec2 vUv;


void main() {

  // we are modifying example 17, to get cyrilic g pattern (I named it like this)

  // proportions won't be the same like in example 17

  // I just change some math operations

  float edgeX = 0.5;
  float edgeY = 0.5;


  edgeX = 0.8;
  edgeY = edgeX / 2.0;


  float grid_items = 10.0;


  float strengthY = mod(
    vUv.y * grid_items,
    1.0
  );
  float strengthX = mod(
    vUv.x * grid_items,
    1.0
  );


  float maskX = step(edgeX, strengthY);
  float maskY = step(edgeY, strengthY);

  // here instead of *= I wrote -=
  maskX -= step(edgeY, strengthX);
  maskY -= step(edgeX, strengthX);


  float strength = maskX + maskY;


  gl_FragColor = vec4(vec3(strength), 1.0);


}