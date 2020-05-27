/*

Created by Ivan Vlahov
u/spiritcs

If you want to share anything made using this program,
please give me credit by linking my Youtube channel
and the video link below:

https://www.youtube.com/user/ivanvlahov922
https://youtu.be/Zdb6RkWjohk

*/

public class SAWClass {

	int cols;
	int rows;
	float verDotDist;
	float horDotDist;
	color c;

	ArrayList<DotData> walk;

	SAWClass(int cols, int rows){
		this.cols = cols;
		this.rows = rows;

		horDotDist = width/this.cols;
		verDotDist = height/this.rows;

		walk = new ArrayList<DotData>();
		ArrayList<PVector> dir = new ArrayList<PVector>();

		dir.add(new PVector(0, 1));
		dir.add(new PVector(1, 0));
		
		walk.add(new DotData(0, 0, dir));

		c = #fe7f9c;
	}

	public void setColor(color c){
		this.c = c;
	}

	public void displaySAW(){
		float circleRadius = verDotDist/5;
		fill(c);
		stroke(c);
		strokeWeight(circleRadius/2);

		for(float i=0; i<cols; i++){
			for(float j=0; j<rows; j++){
				ellipse(horDotDist*(i+0.5), verDotDist*(j+0.5), circleRadius, circleRadius);
			}
		}

		for(int i = 1; i < walk.size(); i++){
			PVector v1 = walk.get(i-1).coord;
			PVector v2 = walk.get(i).coord;
			line((v1.x+0.5)*horDotDist, (v1.y+0.5)*verDotDist, (v2.x+0.5)*horDotDist, (v2.y+0.5)*verDotDist);
		}
	}

	public boolean iterateSAW(){
		if(walk.size()!=rows*cols){
			int dirSize = walk.get(walk.size()-1).directions.size();

			if(dirSize==0){
				walk.remove(walk.size()-1);
			}else{
				int randDir = floor(random(dirSize));
		
				ArrayList<PVector> dir = new ArrayList<PVector>();

				PVector newPV = walk.get(walk.size()-1).getDirElement(randDir);
				
				if(newPV.x != cols-1 && !walk.contains(new DotData((int)newPV.x+1, (int)newPV.y, dir))) dir.add(new PVector(newPV.x+1, newPV.y));
				if(newPV.x != 0	     && !walk.contains(new DotData((int)newPV.x-1, (int)newPV.y, dir))) dir.add(new PVector(newPV.x-1, newPV.y));
				if(newPV.y != rows-1 && !walk.contains(new DotData((int)newPV.x, (int)newPV.y+1, dir))) dir.add(new PVector(newPV.x, newPV.y+1));
				if(newPV.y != 0		 && !walk.contains(new DotData((int)newPV.x, (int)newPV.y-1, dir))) dir.add(new PVector(newPV.x, newPV.y-1));

				walk.get(walk.size()-1).removeDirectionAt(randDir);
				walk.add(new DotData((int)newPV.x, (int)newPV.y, dir));
			}

			return false;
		}else{
			return true;
		}
	}


}