#!/bin/bash

function add_p_to_things() {
	# sed -i '' 's/width/p.width/' *.java
	#sed -i '' 's/height/p.height/' *.java
	#sed -i '' 's/TWO_PI/p.height/' *.java
	#sed -i '' 's/random/p.random/' *.java
	#sed -i '' 's/[^p.]random/p.random/' *.java
	#sed -i '' 's/[^p.]pushMatrix/p.pushMatrix/' *.java
	#sed -i '' 's/[^p.]popMatrix/p.popMatrix/' *.java
	#sed -i '' 's/[^p.]translate/p.translate/' *.java
	#sed -i '' 's/[^p.]fill/p.fill/' *.java
	#sed -i '' 's/[^p.]noStroke/p.noStroke/' *.java
	#sed -i '' 's/[^p.]map/p.map/' *.java
	#sed -i '' 's/[^p.]ellipse/p.ellipse/' *.java
	#sed -i '' 's/[^p.]rect/p.rect/' *.java
	#sed -i '' 's/[^p.]stroke/p.stroke/' *.java
	#sed -i '' 's/[^p.]line/p.line/' *.java
	#sed -i '' 's/[^p.]ambientLight/p.ambientLight/' *.java
	#sed -i '' 's/[^p.]sphere/p.sphere/' *.java
	#sed -i '' 's/[^p.]text/p.text/' *.java
	#sed -i '' 's/[^p.]pointLight/p.pointLight/' *.java
	#sed -i '' 's/[^p.]cos/p.cos/' *.java
	#sed -i '' 's/[^p.]sin/p.sin/' *.java
	#sed -i '' 's/procep.sing/processing/' *.java
	#sed -i '' 's/[^p.]background/p.background/' *.java
	#sed -i '' 's/[^p.]rotateX/p.rotateX/' *.java
	#sed -i '' 's/[^p.]camera/p.camera/' *.java
	#sed -i '' 's/[^p.]radians/p.radians/' *.java
	#sed -i '' 's/[^p.]tan(/p.tan(/' *.java
	#sed -i '' 's/[^p.]mouseX/p.mouseX/' *.java
	#sed -i '' 's/[^p.]mouseY/p.mouseY/' *.java
	#sed -i '' 's/[^p.]loadImage/p.loadImage/' *.java
	sed -i '' 's/[^p.]beginShape/p.beginShape/' *.java
	sed -i '' 's/[^p.]endShape/p.endShape/' *.java
	sed -i '' 's/[^p.]vertex/p.vertex/' *.java

}

add_p_to_things
