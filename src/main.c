#include <time.h>
#include <math.h>
#include <stdio.h>
#include <string.h>
#include <allegro.h>

int get_random(int min, int max){
   return min + rand() / (RAND_MAX / (max - min + 1) + 1);
}

int engine_on     = 0;
double engine_pwr = 0.25;
int score         = 0;
int gameover      = 0;
int vector_color  = 6;
double ship_zoom  = 1.25;
//double zoom_spd = 0.025;
double angle_spd  = 0.25;

int ship_sprite[7][2]    = {{-3,4},{3,4},{0,-3},{-3,4},{-3,4},{-3,4},{-3,4}};
int ship_sprite_on[7][2] = {{-3,4},{3,4},{0,-3},{-3,4},{-2,4},{ 0,7},{ 2,4}};

int rotated_ship_sprite[7][2];
int current_sprite[7][2];

double ship_r[2] = {8,0};
double ship_v[2] = {0,0};

int terrain[33];
int platform_start = 0;

BITMAP *buffer;

static int play_game()
{    
    double angle = 0;
    ship_v[0] = get_random(0.1,1); 
    platform_start = get_random(0, SCREEN_W - 20); 

    // Generate terrain
    for (int i=0; i<33; i++) {
        terrain[i] = get_random(-1,1);
    }

    while (!key[KEY_ESC] && !gameover) {

        //ship_zoom = ship_zoom + zoom_spd;
        //if (ship_zoom > 8 || ship_zoom < 1) { zoom_spd = -1 * zoom_spd; }

        vector_color = 15;
        //if (rand() % 2 == 0)
        //    vector_color = 7;

        // Keyboard controls
        engine_on = 0;
        if (key[KEY_UP]) {
            engine_on = 1;
        }
        if (key[KEY_LEFT]) {
            angle = angle - angle_spd;
        }
        if (key[KEY_RIGHT]) {
            angle = angle + angle_spd;
        }

        // Calc ship velocity
        ship_v[1] += 0.05;
        if (engine_on) {
            ship_v[0] += engine_pwr * sin(angle);
            ship_v[1] -= engine_pwr * cos(angle);
        }

        // Limit speed 
        if (ship_v[0] < 0.05)  { ship_v[0] ==  0.0; }
        if (ship_v[1] < 0.05)  { ship_v[1] ==  0.0; }
        if (ship_v[0] > 10.0)  { ship_v[0] == 10.0; }
        if (ship_v[1] > 10.0)  { ship_v[1] == 10.0; }

        // Bouncy ship
        if (ship_r[1] >= 178) {
            ship_v[1] = -1 * ship_v[1]/2;
            ship_v[0] = ship_v[0]/2;
        }

        // platform colision
        if (
            ship_r[0] >= platform_start &&
            ship_r[0] <= platform_start + 20 &&
            ship_r[1] >= SCREEN_H-45 &&
            ship_r[1] >= SCREEN_H-45
            ) {
            ship_v[1] = -1 * ship_v[1]/2;
            ship_v[0] = ship_v[0]/2;
        }

        // Calc ship position
        ship_r[0] += ship_v[0];
        ship_r[1] += ship_v[1];

        // Clear buffer
        clear_bitmap(buffer);

        // Select sprite
        if (!engine_on) {
            memcpy(current_sprite, ship_sprite, sizeof(ship_sprite));
        } else {
            memcpy(current_sprite, ship_sprite_on, sizeof(ship_sprite_on));
        }
        
        for (int i = 0; i < 7 ;i++) {
            rotated_ship_sprite[i][0] = 
                ship_zoom * current_sprite[i][0]*cos(angle) -
                ship_zoom * current_sprite[i][1]*sin(angle);
            rotated_ship_sprite[i][1] = 
                ship_zoom * current_sprite[i][0]*sin(angle) +
                ship_zoom * current_sprite[i][1]*cos(angle);
        }

        // Draw ship sprite
        for (int i = 0; i < 6 ;i++) {
            int j = i + 1;
            if (j >= 6) { j == 0; }
            line(buffer, 
                ship_r[0] + rotated_ship_sprite[i][0],
                ship_r[1] + rotated_ship_sprite[i][1], 
                ship_r[0] + rotated_ship_sprite[j][0],  
                ship_r[1] + rotated_ship_sprite[j][1],
                vector_color);
        }

        // draw pixel
        //putpixel(buffer, x, y, vector_color);

        //"Sun"
        circle(buffer, 298, 5, 4, vector_color);
        circle(buffer, 300, 8, 10, vector_color);

        // Platform
        line(buffer, platform_start, SCREEN_H - 40, platform_start+20, SCREEN_H - 40, vector_color);

        // Ground
        for (int i=0; i<=31; i++) {
            if (i*10+10 > 320) { i = 31; }
            line(buffer,
                i*10,
                SCREEN_H - 20 + terrain[i],
                (i+1)*10, 
                SCREEN_H - 20 + terrain[i+1],
                vector_color);
        }

        //buffer, font, x, y, color, bg, string
        //textprintf_ex(buffer, font, 0, SCREEN_H - 8 - text_height(font), 
        //    makecol(255,255,255), -1, "Press ESC to quit");

        // Draw to screen
        blit(buffer, screen, 0, 0, 0, 0, SCREEN_W, SCREEN_H);

        rest(30);
    }

    return TRUE;
}

// TODO: display a commandline usage message 
static void usage()
{
   printf(
      "Thanks for playing vecland!\n"
      "- by Wa59, 2025\n"
   );
}

int main(int argc, char *argv[])
{
    srand(time(NULL));
    if (allegro_init() != 0) {
        return 1;
    }
    install_keyboard();
    install_timer();

    set_color_depth(8);
    if (set_gfx_mode(GFX_VGA, 320, 200, 0, 0) != 0) {
        allegro_message("Unable to set graphics mode\n%s\n", allegro_error);
        return 1;
    }
    
    // Using double buffering
    buffer = create_bitmap(SCREEN_W, SCREEN_H);
    if (!buffer) {
        allegro_message("Failed to create buffer\n");
        return 1;
    }

    play_game();

    destroy_bitmap(buffer);
    set_gfx_mode(GFX_TEXT, 0,0,0,0);
    usage();
    return 0;
}


END_OF_MAIN()