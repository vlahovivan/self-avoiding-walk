/*

Created by Ivan Vlahov
u/spiritcs

If you want to share anything made using this program,
please give me credit by linking my Youtube channel
and the video link below:

https://www.youtube.com/user/ivanvlahov922
https://youtu.be/Zdb6RkWjohk

*/

class DotData {
	public PVector coord;

	public ArrayList<PVector> directions;

	DotData(int x, int y, ArrayList<PVector> directions){
		coord = new PVector(x, y);
		this.directions = directions;
	}

	boolean removeDirection(PVector direction){
		return directions.remove(direction);
	}

	PVector removeDirectionAt(int index){
		return directions.remove(index);
	}

	boolean addDirection(PVector direction){
		return directions.add(direction);
	}

	PVector getDirElement(int i){
		if(i<0) return directions.get(0);
		if(i>=directions.size()) return directions.get(directions.size()-1);
		return directions.get(i);
	}

	@Override
	public boolean equals(Object o){
		if(o == this) return true;

		if(!(o instanceof DotData)) return false;

		DotData d = (DotData) o;

		return d.coord.x == this.coord.x && d.coord.y == this.coord.y;
	}
}