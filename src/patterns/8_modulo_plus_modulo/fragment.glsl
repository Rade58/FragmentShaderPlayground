precision mediump float;


// receiving uv coordinates from vertex shader because we sent them
varying vec2 vUv;


void main() {

  // we have two strenghts here
  // one uses vUv.x, and other vUv.y
  float strengthX = mod(vUv.x * 10.0, 1.0);
  float strengthY = mod(vUv.y * 10.0, 1.0);

  // if we add them like this
  float strength = strengthX + strengthY;

  // we will have repeting segments over x axis
  // and repeating segments over y axis
  // which will look like they are crossing each other

  // to be honest we will have 10 x 10 patterns
  // which means we will have 100 patterns

  // and every of the pattern will be gradiet with diafonal change

  // we can try to invert them
  strength = 1.0 - strength;
  // this one will be the same as the upper
  // just gradient will change direction (I think)
  strength = strengthX - strengthY;
  // which is interesting

  gl_FragColor = vec4(vec3(strength), 1.0);

  

}