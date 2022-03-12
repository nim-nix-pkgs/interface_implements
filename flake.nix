{
  description = ''implements macro creates toInterface proc.'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs."interface_implements-main".url = "path:./main";
  inputs."interface_implements-main".inputs.nixpkgs.follows = "nixpkgs";
  inputs."interface_implements-main".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."interface_implements-0_1_0".url = "path:./0_1_0";
  inputs."interface_implements-0_1_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."interface_implements-0_1_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."interface_implements-0_2_0".url = "path:./0_2_0";
  inputs."interface_implements-0_2_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."interface_implements-0_2_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."interface_implements-0_2_1".url = "path:./0_2_1";
  inputs."interface_implements-0_2_1".inputs.nixpkgs.follows = "nixpkgs";
  inputs."interface_implements-0_2_1".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."interface_implements-v0_2_2".url = "path:./v0_2_2";
  inputs."interface_implements-v0_2_2".inputs.nixpkgs.follows = "nixpkgs";
  inputs."interface_implements-v0_2_2".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib"];
  in lib.mkProjectOutput {
    inherit self nixpkgs;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
    refs = builtins.removeAttrs inputs args;
  };
}