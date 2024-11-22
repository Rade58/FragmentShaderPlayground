precision mediump float;


// receiving uv coordinates from vertex shader because we sent them
varying vec2 vUv;


void main() {

  // to create better looking grid I parametarized some things
  float grid_items_by_row_or_column = 10.0;
  // to better center a grid
  float grid_offset = 0.11;

  float strengthX = mod(
    vUv.x * grid_items_by_row_or_column,
    1.0
  );
  float strengthY = mod(
    vUv.y * grid_items_by_row_or_column,
    1.0
  );

  float strength = step(0.5, strengthX) + step(0.5, strengthY);


  // strength = 1.0 - strength;


  gl_FragColor = vec4(vec3(strength), 1.0);


}