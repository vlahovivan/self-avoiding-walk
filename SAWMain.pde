/*

Created by Ivan Vlahov
u/spiritcs

If you want to share anything made using this program,
please give me credit by linking my Youtube channel
and the video link below:

https://www.youtube.com/user/ivanvlahov922
https://youtu.be/Zdb6RkWjohk

*/


int cols = 6;
int rows = 5;

SAWClass saw;

boolean walkFinished;

void setup() {
	size(960, 540);

	saw = new SAWClass(cols, rows);
}

void draw() {
	background(0);

	saw.displaySAW();
	walkFinished = saw.iterateSAW();

	if(walkFinished){
		noLoop();
	}
}