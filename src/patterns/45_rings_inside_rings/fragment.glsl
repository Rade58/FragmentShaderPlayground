// already defined with ShaderMaterial
// precision mediump float;

// we did receive this from vertex shader, because we did send it (not done by ShaderMaterial)
varying vec2 vUv;



void main() {



  vec2 center = vec2(0.5);

  // this will be our starting point
  //        float strength = step(0.25, distance(vUv, center));
  //        gl_FragColor = vec4(vec3(strength), 1.0);
  // which is example 43
  // but we will parametarize things even more

  float d = mod(distance(vUv, center) * 5.0, 1.0);


  float mask = step(0.25, d);
  
  float strength = mask;

  // what we will get is bunch of black rings, one inside the other
  // over the white background, and only the central part is 
  // black circle

  // and if you want to invert it you can do this as you know
  strength = 1.0 - strength;


  gl_FragColor = vec4(vec3(strength), 1.0);

}