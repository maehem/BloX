/*
 * tetris_stubs.c - Notify and event callback function stubs.
 * This file was generated by `gxv' from `tetris.G'.
 * DO NOT EDIT BY HAND.
 */

#include <stdio.h>
#include <sys/param.h>
#include <sys/types.h>
#include <xview/xview.h>
#include <xview/panel.h>
#include <xview/textsw.h>
#include <xview/xv_xrect.h>
#include <xview/notify.h>
#include <gdd.h>
#include "tetris_ui.h"

#define SPACE		32

#define BLOCK		0
#define SUN		1

#define SMALL		0
#define BIG		1

#define COLOR		0
#define MONO		1

#define BLOX		0
#define TETRIS		1

#define COLORS		8

#define SMALL_BLOCK_SIZE	16
#define BIG_BLOCK_SIZE		32

#define SMALL_WINDOW_WIDTH	283
#define SMALL_WINDOW_HEIGHT	363

#define BIG_WINDOW_WIDTH	443
#define BIG_WINDOW_HEIGHT	682

#define GAME_OVER_MESSAGE_X	235

#define	REF			80	

#define CANVAS_W_BLOCKS	10
#define CANVAS_H_BLOCKS	20

#define TIMER_INIT	600000
#define TIMER_INC	40000
#define	LEVEL_INC	15

#define FLASH		3

#define LINE_VALUE	100
#define OBJECT_VALUE	32

tetris_window_objects	*tetris_window;
tetris_popup_objects	*tetris_popup;

static unsigned short	sun_bits_small[] = { 
#include "../include/sun.image"
};
static unsigned short	sun_bits_big[] = { 
#include "../include/big_sun.image" 
};
static unsigned short	block_bits_small[] = { 
#include "../include/block.image" 
};
static unsigned short	block_bits_big[] = { 
#include "../include/big_block.image" 
};
static unsigned short	blank_bits_small[] = { 
#include "../include/blank.image" 
};
static unsigned short	blank_bits_big[] = { 
#include "../include/big_blank.image" 
};
static int object[2][7][4][4][4] = {
#include "../include/shapes_blox.data"
,
#include "../include/shapes_tetris.data"
};

struct  {
	int	level;
	int	score;
	int	lines;
} hi_score[10];
	
struct itimerval timer;

int	start = FALSE;
int	image = BLOCK;
int	size =	SMALL;
int	type = BLOX;
int	block_size = SMALL_BLOCK_SIZE;
int	color = COLOR;
int 	object_x, object_y;
int	new_object;
int 	current_obj, rotation;
int 	score = 0;
int	level = 3;
int	lines = 0;
int	height = 0;
int	line_values;
int 	field_array[CANVAS_W_BLOCKS][CANVAS_H_BLOCKS + 1];
unsigned long	tetris_color[9];

int	level_tab[9] = { 1, 4, 7, 2, 5, 8, 3, 6, 9 };
int 	height_tab[12] = { 0, 3, 6, 9, 1, 4, 7, 10, 2, 5, 8, 11 };

Notify_value	play();
XGCValues	values;
Colormap	default_colormap;


Pixmap block_glyph, blank_glyph;
GC gc;
Display	*dpy;
Window	canvas_win, xid;

/*
 * Instance XV_KEY_DATA key.  An instance is a set of related
 * user interface objects.  A pointer to an object's instance
 * is stored under this key in every object.  This must be a
 * global variable.
 */
Attr_attribute	INSTANCE;

void
main(argc, argv)
	int		argc;
	char		**argv;
{
	/*
	 * Initialize XView.
	 */
	xv_init(XV_INIT_ARGC_PTR_ARGV, &argc, argv, 0);
	INSTANCE = xv_unique_key();

	/*
	 * Get command line arguments.
	 */
	{
		int c;

		for (c = 1; c < argc; c++) {
			if (*argv[c] == '-') {
				if (*(argv[c]+1) == 's') {
					image = SUN;
				}
				else
				if (*(argv[c]+1) == 'b') {
					size = BIG;
				}
				else
				if (*(argv[c]+1) == 'm') {
					color = MONO;
				}
				else
				if (*(argv[c]+1) == 't') {
					type = TETRIS;
				}

			}
		}
	}	
	/*
	 * Initialize user interface components.
	 */
	tetris_window = tetris_window_objects_initialize(NULL, NULL);
	tetris_popup = tetris_popup_objects_initialize(NULL, tetris_window->window);
	

	/*
	 * Custom objects initialize.
	 */

	canvas_win = (Window)xv_get(
			canvas_paint_window(tetris_window->canvas),
			XV_XID
			);
	xid = (Window)xv_get(
			canvas_paint_window(tetris_window->canvas),
			XV_XID
			);

	dpy = (Display *)xv_get(tetris_window->window, XV_DISPLAY);
	gc = DefaultGC(dpy, DefaultScreen(dpy));
	default_colormap = DefaultColormap( dpy, DefaultScreen(dpy));


	/*
	 *  Set up the color table for our game.
	 */

	set_colors(color);
	set_size(size);
	XSetBackground(dpy, gc, tetris_color[0]);

	srand((unsigned int)time(NULL));

	
	/*
	 * Turn control over to XView.
	 */
	xv_main_loop(tetris_window->window);
	exit(0);
}


/*
 * Notify callback function for `start_button'.
 */
void
start_handler(item, event)
	Panel_item	item;
	Event		*event;
{
	tetris_window_objects	*ip = (tetris_window_objects *) xv_get(item, XV_KEY_DATA, INSTANCE);


	xv_set(tetris_window->start_button,  PANEL_INACTIVE, TRUE, NULL);	
	xv_set(tetris_window->level_setting,  PANEL_INACTIVE, TRUE, NULL);	
	xv_set(tetris_window->height_setting,  PANEL_INACTIVE, TRUE, NULL);
	xv_set(tetris_window->color_setting, PANEL_INACTIVE, TRUE, NULL);
	xv_set(tetris_window->size_setting, PANEL_INACTIVE, TRUE, NULL);
	xv_set(tetris_window->type_setting, PANEL_INACTIVE, TRUE, NULL);
	xv_set(tetris_window->window, FRAME_RIGHT_FOOTER, "", NULL);


	
	init_field();
	timer.it_value.tv_usec = TIMER_INIT - (TIMER_INC * level);
	timer.it_interval.tv_usec = TIMER_INIT - (TIMER_INC * level);
/*	notify_set_itimer_func(tetris_window->window, play,
		ITIMER_REAL, &timer, NULL);
*/	start = TRUE;
}

/*
 * Notify callback function for `help_button'.
 */
void
help_button_handler(item, event)
	Panel_item	item;
	Event		*event;
{
	tetris_window_objects	*ip = (tetris_window_objects *) xv_get(item, XV_KEY_DATA, INSTANCE);

	/*
	 * Set the help window to the right of the tetris window.
	 */
	{
		int w_width, w_x, w_y;
		w_width = (int)xv_get(tetris_window->window, XV_WIDTH);
		w_x	= (int)xv_get(tetris_window->window, XV_X);
		w_y	= (int)xv_get(tetris_window->window, XV_Y);

		xv_set(tetris_popup->popup,
			XV_X, w_x + w_width + 4,
			XV_Y, w_y,
			NULL);
	}


	xv_set(tetris_popup->popup, XV_SHOW, TRUE, NULL);

}

/*
 * Event callback function for `canvas'.
 */
Notify_value
canvas_events(win, event, arg, type)
	Xv_window	win;
	Event		*event;
	Notify_arg	arg;
	Notify_event_type type;
{
	tetris_window_objects	*ip = (tetris_window_objects *) xv_get(win, XV_KEY_DATA, INSTANCE);
	int action;
	int down;


	action = event_action(event);
	down = event_is_down(event);

	if (start) {

		if (	(	action == ACTION_SELECT ||
				action == 'A' ||
				action == 'J' ||
				action == 'a' ||
				action == 'j'
			) 	&&
				down && 
				!object_at_left()
				)
			{
			erase_object();
			object_x--;
			draw_object();
			} else
		if (	(	action == ACTION_MENU ||
				action == 'D' ||
				action == 'L' ||
				action == 'd' ||
				action == 'l' 
			) 	&&
				down &&
				!object_at_right()
				) 
			{
			erase_object();
			object_x++;
			draw_object();
			} else
		if (	(	action == ACTION_ADJUST ||
				action == 'S' ||
				action == 'K' ||
				action == 's' ||
				action == 'k'
			) 	&&
				down &&
				!within_bounds() 
				)
			{
			erase_object();
			if(++rotation > 3) rotation = 0;
			draw_object();
			}else
		if (action == SPACE && down)
		{
			while(!object_at_bottom())
			{
				erase_object();
				object_y ++;
				draw_object();
			}
		}else
		if (action == LOC_WINENTER)
			{
				notify_set_itimer_func(tetris_window->window, play,
				ITIMER_REAL, &timer, NULL);
			}else
		if (action == LOC_WINEXIT)
			{
				notify_set_itimer_func(tetris_window->window,
				NOTIFY_FUNC_NULL, ITIMER_REAL,
				NULL, NULL);
		}
	}

	return notify_next_event_func(win, (Notify_event) event, arg, type);
}


/*
 * Notify callback function for `level_setting'.
 */
void
level_notify(item, value, event)
	Panel_item	item;
	int		value;
	Event		*event;
{
	tetris_window_objects	*ip = (tetris_window_objects *) xv_get(item, XV_KEY_DATA, INSTANCE);
}

/*
 * Notify callback function for `height_setting'.
 */
void
height_notify(item, value, event)
	Panel_item	item;
	int		value;
	Event		*event;
{
	tetris_window_objects	*ip = (tetris_window_objects *) xv_get(item, XV_KEY_DATA, INSTANCE);
	height = height_tab[value];

}

/*
 * Notify callback function for `size_setting'.
 */
void
size_notify(item, value, event)
	Panel_item	item;
	int		value;
	Event		*event;
{
	tetris_window_objects *ip = (tetris_window_objects *) xv_get(item, XV_KEY_DATA, INSTANCE);

	clear_field();	

	set_size(value);

	
	/* gxv_start_connections DO NOT EDIT THIS SECTION */

	/* gxv_end_connections */

}

/*
 * Notify callback function for `color_setting'.
 */
void
color_notify(item, value, event)
	Panel_item	item;
	int		value;
	Event		*event;
{
	tetris_window_objects *ip = (tetris_window_objects *) xv_get(item, XV_KEY_DATA, INSTANCE);

	set_colors(value);
	
	
	/* gxv_start_connections DO NOT EDIT THIS SECTION */

	/* gxv_end_connections */

}

/*
 * Notify callback function for `type_setting'.
 */
void
type_notify(item, value, event)
	Panel_item	item;
	int		value;
	Event		*event;
{
	tetris_window_objects *ip = (tetris_window_objects *) xv_get(item, XV_KEY_DATA, INSTANCE);

	type = value;	
	
	/* gxv_start_connections DO NOT EDIT THIS SECTION */

	/* gxv_end_connections */

}


Notify_value
play()
{
	if (new_object) {
		new_object = FALSE;
		create_new_object();
		start = TRUE;
	}
	else if (overflow()) 
		lost_game();

	else if (object_at_bottom()) {
		start = FALSE;
		map_object_to_field();
		add_score(OBJECT_VALUE);
		check_for_lines(); 
		new_object = TRUE;		
	} 
	else	move_object_down();	


	return NOTIFY_DONE;
}

add_score(value)
	int	value;
{
	char	string[8];
	score += value;
	sprintf(string, "%07d", score);
	xv_set(tetris_window->score,
		PANEL_LABEL_STRING, string,
		NULL);
}

set_lines(value)
	int	value;
{
	char	string[8];
	sprintf(string, "%d", value);
	xv_set(tetris_window->lines,
		PANEL_LABEL_STRING, string,
		NULL);
}

set_level(value)
	int	value;
{
	char	string[8];
	sprintf(string, "%d", value);
	xv_set(tetris_window->level,
		PANEL_LABEL_STRING, string,
		NULL);
}




create_new_object()
{
	current_obj = ((unsigned) rand() % 7);
	XSetForeground(dpy, gc, tetris_color[current_obj + 1]);

	rotation = 0;
	object_y = 0;
	object_x = 4;
	draw_object();
}

int
overflow()
{
	/* Check to see if the new block was placed over an existing one.  */

	int x, y;

	
	for(y = 0; y < 4; y++)  {
		for( x = 0; x < 4; x++) {
			if (
				object[type][current_obj][rotation][y][x] &&
				field_array[object_x + x][object_y + y] 
			   )
			{
				return TRUE;
			}
		}
	}
	return FALSE;
}


move_object_down()
{
/* Move the object down one block */
	erase_object();
	object_y++;
	draw_object();
}

int
object_at_bottom()
{
	/*  Check to see if the object touched the bottom  */
	int x, y;
	for(y = 0; y < 4; y++)  {
		for( x = 0; x < 4; x++) {
			if (
				object[type][current_obj][rotation][y][x] &&
				( field_array[object_x + x][object_y+ y +1] || 
				  ( (object_y + y ) >= CANVAS_H_BLOCKS - 1 )
				)
			   )
			{
				return TRUE;
			}
		}
	}
	return FALSE;
}

/*  Game is over dude!   */
lost_game()
{
	int x, y, y2;
	int c = 1;

	start = FALSE;
	notify_set_itimer_func(tetris_window->window,
		NOTIFY_FUNC_NULL, ITIMER_REAL,
		NULL, NULL);
	
	y2 = CANVAS_H_BLOCKS;
	for (y = 0; y < CANVAS_H_BLOCKS/2; y++) {
		y2--;
		if (c > 7) c = 1;
		XSetForeground(dpy, gc, tetris_color[c]);

		for (x = 0; x < CANVAS_W_BLOCKS; x++) {	

			XCopyPlane( dpy, block_glyph, xid, gc, 
				0, 0, 
				block_size, block_size, 
				x * block_size,
				y * block_size, 
				1 );
			XCopyPlane( dpy, block_glyph, xid, gc, 
				0, 0, 
				block_size, block_size, 
				x * block_size,
				y2 * block_size, 
				1 );
		}
		c++;
	}
	do_hi_score();

	xv_set(tetris_window->start_button, 	PANEL_INACTIVE, FALSE, NULL);
	xv_set(tetris_window->level_setting,  	PANEL_INACTIVE, FALSE, NULL);	
	xv_set(tetris_window->height_setting,  	PANEL_INACTIVE, FALSE, NULL);
	xv_set(tetris_window->color_setting,	PANEL_INACTIVE, FALSE, NULL);
	xv_set(tetris_window->size_setting, 	PANEL_INACTIVE, FALSE, NULL);
	xv_set(tetris_window->type_setting, 	PANEL_INACTIVE, FALSE, NULL);

	xv_set(tetris_window->window, FRAME_RIGHT_FOOTER, "GAME OVER", NULL);	


}

do_hi_score()
{
	int	i;

	read_hs_file();
	i = update_hs();
	display_hs( i );
	save_hs_file();
}

read_hs_file()
{
	FILE	*fp;
	int	i;
	char	*getenv();
	char	*var;
	char	file[255];
	

	if ((var = getenv("HOME")) == NULL)
	{
		fprintf(stderr, "HOME not found");
	}
	else	
	{
		sprintf(file, "%s\/.viXen_blox_hs", var);		
		if((fp = fopen( file, "r")) == NULL)
		{

			for( i = 0; i < 10; i++)
			{
				hi_score[i].level = 0;
				hi_score[i].score = 0;
				hi_score[i].lines = 0;
			}
		}
		else
		{

			for( i = 0; i < 10; i++)				{
				fread( &hi_score[i].level, sizeof(int), 1, fp);
				fread( &hi_score[i].score, sizeof(int), 1, fp);
				fread( &hi_score[i].lines, sizeof(int), 1, fp);
			}
	
			fclose(fp);

		}
	}
}

int
update_hs()
{
	int	j = 10, i = 0;

	while (i < 10)
	{
		if( score >= hi_score[i].score)
		{
			for ( j = 9; j > i; j--)
			{
				hi_score[j].level = hi_score[j - 1].level;
				hi_score[j].score = hi_score[j - 1].score;
				hi_score[j].lines = hi_score[j - 1].lines;
			}
			hi_score[i].score = score;
			hi_score[i].level = level;
			hi_score[i].lines = lines;

			i = 10;
		}
		else
			i++;
	}
	return j;
}
	
display_hs( h )
	int	h;
{
	int	 ref, i, k, m = CANVAS_H_BLOCKS/2;
	char	buf[50];
	
	k = m - 1;

	for(i = m; i < (m + 6); i++)
	{
		remove_line(i);
		remove_line(k);
		k--;
	}
	XSetForeground(dpy, gc, tetris_color[4]);
	sprintf( buf, "%s", "+++ High Scores +++");
	XDrawString( dpy, xid, gc, 
		(CANVAS_W_BLOCKS * block_size)/2 - REF + block_size,  
		(m - 5) * block_size,
		buf,
		strlen(buf)  );

	XSetForeground(dpy, gc, tetris_color[7]);
	sprintf( buf, "%4s%8s%10s%6s", "Rank", "Score", "Lines", "Level");
	XDrawString( dpy, xid, gc, 
		(CANVAS_W_BLOCKS * block_size)/2 - REF,  
		(m - 4) * block_size,
		buf,
		strlen(buf)  );
	
	for(i = 0; i < 10; ++i)
	{
		sprintf(buf, "%-d.  %06d    %03d    %02d",
			i + 1,
			hi_score[i].score,
			hi_score[i].lines,
			hi_score[i].level );
		if( h == i)
		{
			XSetForeground(dpy, gc, tetris_color[3]);
		}
		else
		{
			XSetForeground(dpy, gc, tetris_color[8]);
		}

		if (i < 9)
			XDrawString( dpy, xid, gc,
				(CANVAS_W_BLOCKS * block_size)/2 - REF + 16,
				((m - 3) + i) * block_size,
				buf,
				strlen(buf) );
	}
	XDrawString( dpy, xid, gc,
		(CANVAS_W_BLOCKS * block_size)/2 - REF + 8,
		((m - 3) + i - 1) * block_size,
		buf,
		strlen(buf) );
	

}

save_hs_file()
{
	FILE	*fp;
	int	i;
	char	*getenv();
	char	*var;
	char	file[255];



	if ((var = getenv("HOME")) == NULL)
	{
		fprintf(stderr, "HOME not found");
	}
	else	
	{
		sprintf(file, "%s\/.viXen_blox_hs", var);	
		fp = fopen( file, "w+");

		for(i = 0; i < 10; i++)
		{
		
			fwrite( &hi_score[i].level, sizeof(int), 1, fp);
			fwrite( &hi_score[i].score, sizeof(int), 1, fp);
			fwrite( &hi_score[i].lines, sizeof(int), 1, fp);
		}
		fclose(fp);
	}
}


erase_object()
{
	int x, y;
	for(y = 0; y < 4; y++)  {
		for( x = 0; x < 4; x++) {
			if (object[type][current_obj][rotation][y][x]) {
				XCopyPlane( dpy, blank_glyph, xid, gc, 
					0, 0, 
					block_size, block_size, 
					(object_x + x) * block_size,
					(object_y + y) * block_size, 
					1 );
			}
		}
	}
}

draw_object()
{
	int x, y, color;

	for(y = 0; y < 4; y++)  {
		for( x = 0; x < 4; x++) {
			if (color = object[type][current_obj][rotation][y][x]) {

				XSetForeground(dpy, gc, tetris_color[color]);

				XCopyPlane( dpy, block_glyph, xid, gc, 
					0, 0, 
					block_size, block_size, 
					(object_x + x) * block_size,
					(object_y + y) * block_size, 
					1 );
			}
		}
	}
}

init_field()
{
	int level_value;

	/*
	 *  Clear out previous score by adding it's negative value.
	 */
	add_score(-score);
	score = 0;
	lines = 0;
	new_object = TRUE;

	level_value = (int)xv_get(tetris_window->level_setting, 
		PANEL_VALUE,NULL);

	level = level_tab[level_value];

	set_level(level);
	set_lines(lines);

	clear_field();

	if (height) {
		int y, x, l, color;

		for(l = height; l; l--) {
			color = ((unsigned) rand() % 7)+ 1;
			x = 	((unsigned) rand() % CANVAS_W_BLOCKS );
			y = 	CANVAS_H_BLOCKS - l;
			field_array[x][y] = color;
			XSetForeground(dpy, gc, tetris_color[color]);
			XCopyPlane( dpy, block_glyph, xid, gc, 
				0, 0, 
				block_size, block_size, 
				x * block_size,
				y * block_size, 
				1 );
		}
	}

}

clear_field()
{
	int	x,y;

	for (y = 0; y <= CANVAS_H_BLOCKS; y++) {
		for (x = 0; x < CANVAS_W_BLOCKS; x++) {
			field_array[x][y] = 0;
			XCopyPlane( dpy, blank_glyph, xid, gc, 
				0, 0, 
				block_size, block_size, 
				x * block_size,
				y * block_size, 
				1 );
		}
	}
}

map_object_to_field()
{
	int x, y, color;
	for(y = 0; y < 4; y++)  {
		for( x = 0; x < 4; x++) {
			if (color = object[type][current_obj][rotation][y][x])  
				field_array[object_x + x][object_y + y] =
					color;
		}
	}
}

check_for_lines()
{
	int 	x, y, b, line_count = 0;
	int	line_list[4];
	int	line_sum;
	int	temp_timer;
	int	t, temp_score = 0, temp_line_value = LINE_VALUE;
		

	for (y = object_y + 3; y >= object_y; y--) {
		line_sum = 0;
		for(x = 0; x < CANVAS_W_BLOCKS; x++) {
			 if(field_array[x][y]) line_sum++;
		}
		if(line_sum == CANVAS_W_BLOCKS) {

			if (line_count > 0) {
				temp_line_value *= 2;
				}	
			temp_score += temp_line_value;
			add_score(temp_score);
			set_lines(++lines);
			if (!(lines % LEVEL_INC)) {
				set_level(++level);
				timer.it_value.tv_usec -= TIMER_INC;
				timer.it_interval.tv_usec -= TIMER_INC;
				notify_set_itimer_func(tetris_window->window, 
					play,
					ITIMER_REAL, &timer, NULL);
			}
			line_list[line_count] = y;
			line_count++;
		}
	}
	if (line_count) {
		temp_timer = timer.it_value.tv_usec;

		notify_set_itimer_func(tetris_window->window,
			NOTIFY_FUNC_NULL, ITIMER_REAL,
			NULL, NULL);

		move_field_down(line_list, line_count);

		timer.it_value.tv_usec = temp_timer;
		timer.it_interval.tv_usec = temp_timer;
		notify_set_itimer_func(tetris_window->window, 
			play,
			ITIMER_REAL, &timer, NULL);
	}
			

}

move_field_down(line, count)
	int 	line[];
	int	count;
{
	int 	i, j, k, c;

	c = count;
	if (count > 2) c = count - 2;
	for (i = 0; i < FLASH; i++) {
		for( j = 0; j < c; j++) {
			remove_line(line[j]);
			remove_line(line[j + (2*(c-1)) ] );
		}
		for( j = 0; j < c; j++) {
			update_field(line[j]);
			update_field(line[j + (2*(c-1)) ] );
		}

	}
	for (j = 0; j < count; j++) {
		for (i = line[j]; i > 0; i--) {
			update_array(i + j);
		}
	}
	repaint_field();
}

repaint_field()
{
	int i;

	for(i = CANVAS_H_BLOCKS - 1; i >= 0; i--) {
/*		remove_line(i);
*/		update_field(i);
	}
}

remove_line(line)
	int 	line;
{
	int 	x, y;

	y = line * block_size;

	for (x = 0; x < CANVAS_W_BLOCKS; x++) {
		XCopyPlane( dpy, blank_glyph, xid, gc, 
			0, 0, 
			block_size, block_size, 
			x * block_size, y,
			1 );
	}
}

update_array(line)
	int 	line;
{
	int 	x, y;
	int	color;

	y = line * block_size;
	for (x = 0; x < CANVAS_W_BLOCKS; x++) {
		field_array[x][line] = field_array[x][line -1];
	}
}

update_field(line)
	int	line;
{
	int 	x, y;
	int	color;

	y = line * block_size;
	for (x = 0; x < CANVAS_W_BLOCKS; x++) {
		color = field_array[x][line];

		XSetForeground(dpy, gc, tetris_color[color]);
		XCopyPlane( dpy, block_glyph, xid, gc,
			0, 0, 
			block_size, block_size, 
			x * block_size, y,
			1 );
	}
}

int
object_at_right()
{
	/*  Check to see if the object can go to the right  */
	int x, y;

	for(y = 0; y < 4; y++)  {
		for( x = 0; x < 4; x++) {
			if (
				object[type][current_obj][rotation][y][x] &&
				( field_array[object_x + x + 1][object_y + y] || 
				   (object_x + x) >= (CANVAS_W_BLOCKS - 1) 
				)
			   )
			{
				return TRUE;
			}
		}
	}
	return FALSE;
}

int 
object_at_left()
{
	/*  Check to see if the object can go to the left  */
	int x, y;

	for(y = 0; y < 4; y++)  {
		for( x = 0; x < 4; x++) {
			if (
				object[type][current_obj][rotation][y][x] &&
				( field_array[object_x + x - 1][object_y + y] || 
				  ( (object_x + x ) <= 0 )
			   ) )
			{
				return TRUE;
			}
		}
	}
	return FALSE;
}

int
within_bounds()
{
	/*  Check to see if the object can be rotated.  */
	int x, y;
	int rot = rotation + 1;

	
	if (rot > 3) rot = 0;
	for(y = 0; y < 4; y++)  {
		for( x = 0; x < 4; x++) {
			if (
				object[type][current_obj][rot][y][x] &&
				( field_array[object_x + x][object_y + y] || 
				  ( (object_x + x ) > (CANVAS_W_BLOCKS - 1) )
				)	|| 
				  ( (object_x + x ) < 0 )

			   )
			{
				return TRUE;
			}
		}
	}
	return FALSE;
}


set_colors(mode)
	int mode;
{
	XColor		color_def, rgb;

	if (mode == COLOR)
	{
		XAllocNamedColor(dpy, default_colormap, "Black", 
			&color_def, &rgb);
 		tetris_color[0] = color_def.pixel;
		XAllocNamedColor(dpy, default_colormap, "Red",
			&color_def, &rgb);
		tetris_color[1] = color_def.pixel;
		XAllocNamedColor(dpy, default_colormap, "Orange", 
			&color_def, &rgb);
		tetris_color[2] = color_def.pixel; 
		XAllocNamedColor(dpy, default_colormap, "Yellow", 
			&color_def, &rgb);
		tetris_color[3] = color_def.pixel; 
		XAllocNamedColor(dpy, default_colormap, "Green", 
			&color_def, &rgb);
		tetris_color[4] = color_def.pixel;
		XAllocNamedColor(dpy, default_colormap, "Blue", 
			&color_def, &rgb);
		tetris_color[5] = color_def.pixel; 
		XAllocNamedColor(dpy, default_colormap, "Purple", 
			&color_def, &rgb);
		tetris_color[6] = color_def.pixel; 
		XAllocNamedColor(dpy, default_colormap, "Violet", 
			&color_def, &rgb);
		tetris_color[7] = color_def.pixel;
		XAllocNamedColor(dpy, default_colormap, "White", 
			&color_def, &rgb);
		tetris_color[8] = color_def.pixel;
	}
	else
	{
		int i;

		XAllocNamedColor(dpy, default_colormap, "Black", 
			&color_def, &rgb);
 		tetris_color[0] = color_def.pixel;
		
		XAllocNamedColor(dpy, default_colormap, "White", 
			&color_def, &rgb);
		for(i = 1; i <= 8; i++)
			tetris_color[i] = color_def.pixel;
	}

}

set_size(size)
	int	size;
{
	if (size == BIG  ) {
		/*
		 * Resize canvas and window.
		 */
		xv_set( tetris_window->window, 
			XV_WIDTH, BIG_WINDOW_WIDTH,
			NULL);
		xv_set( tetris_window->window,
			XV_HEIGHT, BIG_WINDOW_HEIGHT, 
			NULL);
		xv_set( tetris_window->size_setting,
			PANEL_VALUE, 1,
			NULL);

		block_size = BIG_BLOCK_SIZE;
		if (image == SUN) {
			block_glyph = XCreateBitmapFromData( dpy, xid,
				sun_bits_big,
				BIG_BLOCK_SIZE, BIG_BLOCK_SIZE);
		} else	block_glyph = XCreateBitmapFromData( dpy, xid,
				block_bits_big,
				BIG_BLOCK_SIZE, BIG_BLOCK_SIZE);

		blank_glyph = XCreateBitmapFromData( dpy, xid,
			blank_bits_big,
			BIG_BLOCK_SIZE, BIG_BLOCK_SIZE);
		

	} else {
		block_size = SMALL_BLOCK_SIZE;

		xv_set( tetris_window->window, 
			XV_WIDTH, SMALL_WINDOW_WIDTH,
			NULL);
		xv_set( tetris_window->window,
			XV_HEIGHT, SMALL_WINDOW_HEIGHT, 
			NULL);

		if (image == SUN) {
			block_glyph = XCreateBitmapFromData( dpy, xid,
			sun_bits_small,
			SMALL_BLOCK_SIZE, SMALL_BLOCK_SIZE);
		}
		else {

			block_glyph = XCreateBitmapFromData( dpy, xid,
				block_bits_small,
				SMALL_BLOCK_SIZE, SMALL_BLOCK_SIZE);
		}
		blank_glyph = XCreateBitmapFromData( dpy, xid, 
			blank_bits_small,
			SMALL_BLOCK_SIZE, SMALL_BLOCK_SIZE);
	}

}
