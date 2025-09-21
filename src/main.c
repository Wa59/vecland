#include <time.h>
#include <math.h>
#include <stdio.h>
#include <string.h>
#include <allegro.h>

int get_random(int min, int max){
   return min + rand() / (RAND_MAX / (max - min + 1) + 1);
}

int engine_on     = 0;
float engine_pwr = 0.25;
int score         = 0;
int gameover      = 0;
int vector_color  = 7;
int stars_color   = 7;
float ship_zoom  = 2;
//float zoom_spd = 0.025;
float angle_spd  = 0.25;
float angle      = 0;

int ship_sprite[7][2]    = {{-3,4},{3,4},{0,-3},{-3,4},{-3,4},{-3,4},{-3,4}};
int ship_sprite_on[7][2] = {{-3,4},{3,4},{0,-3},{-3,4},{-2,4},{ 0,7},{ 2,4}};

int rotated_ship_sprite[7][2];
int current_sprite[7][2];

int dead = 0;
int landed = 0;
int particles_r[40][2];
int particles_v[40][2];

float ship_r[2] = {8,0};
float ship_v[2] = {0,0};

int stars[100];
int terrain[100];
int platform_start = 0;
int platform_end   = 0;

BITMAP *buffer;

void start_vars() {

    clear_bitmap(buffer);
    textprintf_ex(buffer, font, SCREEN_W/2 - 40, SCREEN_H/2  - text_height(font), 
        makecol(255,255,255), -1, "INITIALIZING...");
    blit(buffer, screen, 0, 0, 0, 0, SCREEN_W, SCREEN_H);
    rest(1000);

    angle = 0;
    ship_v[0] = get_random(0.1,1); 
    ship_v[1] = 0; 
    platform_start = get_random(0, SCREEN_W - 20*ship_zoom); 
    platform_end   = platform_start + 20*ship_zoom;
    ship_r[0] = 8;
    ship_r[1] = 0;
    landed = 0;
    dead = 0;

    // Generate terrain
    for (int i=0; i<((SCREEN_W)/10 + 1); i++) {
        terrain[i] = get_random(-4,4);
    }

    // Generate stars
    for (int i=0; i<32; i=i+2) {
        stars[i] = get_random(0,SCREEN_W);
        stars[i+1] = get_random(0,SCREEN_H - 30*ship_zoom);
    }

    // Generate particles
    for (int i=0; i<40; i++) {
        particles_r[i][0] = 0;
        particles_r[i][1] = 0;
        particles_v[i][0] = get_random(-5,5);
        particles_v[i][1] = get_random(-5,5);
        //particles_v[i][0] = rand() % 2 == 0 ? -1 : 1;
        //particles_v[i][1] = rand() % 2 == 0 ? -1 : 1;
    }
}

static int play_game()
{    
    start_vars();

    while (!key[KEY_ESC] && !gameover) {

        if (key[KEY_SPACE] || key[KEY_ENTER]) {
            start_vars();
            continue;
        }

        if (landed) {
            textprintf_ex(buffer, font, SCREEN_W/2 - 40, SCREEN_H/2  - text_height(font), 
                makecol(255,255,255), -1, "LANDED!");
            blit(buffer, screen, 0, 0, 0, 0, SCREEN_W, SCREEN_H);
            rest(30);
            continue;
        }

        //ship_zoom = ship_zoom + zoom_spd;
        //if (ship_zoom > 8 || ship_zoom < 1) { zoom_spd = -1 * zoom_spd; }

        //if (vector_color == 7) {
            vector_color = 15;
        //} else {
        //    vector_color = 7;
        //}

        if (stars_color == 7) {
            stars_color = 8;
        } else {
            stars_color = 7;
        }

        if (!dead) {
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

            // Dead ship
            if (ship_r[1] >= SCREEN_H - 25*ship_zoom) {
                dead = 1;
            }

            // Warp
            if (ship_r[0] < 0 - 5*ship_zoom) { ship_r[0] = SCREEN_W; }
            if (ship_r[0] > SCREEN_W + 5*ship_zoom) { ship_r[0] = 0 - 5*ship_zoom; }

            // platform colision
            if (
                ship_r[0] >= platform_start &&
                ship_r[0] <= platform_end &&
                ship_r[1] >= SCREEN_H-45*ship_zoom &&
                ship_r[1] <= SCREEN_H-42*ship_zoom
                ) {
                ship_v[1] = -1 * ship_v[1]/2;
                ship_v[0] = ship_v[0]/2;
                ship_r[1] = SCREEN_H-45*ship_zoom;

                if (
                    ship_v[0] <= 0.0005 &&
                    ship_v[1] <= 0.0005 
                    ) {
                        landed = 1;
                        score++;                }

            }

            // Calc ship position
            ship_r[0] += ship_v[0];
            ship_r[1] += ship_v[1];

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
        }


        // Clear buffer
        clear_bitmap(buffer);

        // draw stars
        for (int i=0;i<32;i=i+2) {
            putpixel(buffer, stars[i], stars[i+1], stars_color);
        }

        // Not a moon
        circle(buffer, SCREEN_W-22*ship_zoom, 5*ship_zoom, ship_zoom*4, vector_color);
        circle(buffer, SCREEN_W-20*ship_zoom, 8*ship_zoom, ship_zoom*10, vector_color);

        // Ground
        for (int i=0; i<=SCREEN_W/10 - 1; i++) {
            if (i*10+10 > SCREEN_W) { i = SCREEN_W/10 - 1; }
            line(buffer,
                i*10,
                SCREEN_H - (25*ship_zoom + terrain[i]),
                (i+1)*10, 
                SCREEN_H - (25*ship_zoom + terrain[i+1]),
                vector_color);
        }

        // Platform
        line(buffer, platform_start, SCREEN_H - 40*ship_zoom, platform_end, SCREEN_H - 40*ship_zoom, vector_color);

        // Draw ship sprite
        if (!dead) {
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
        } else {
            // Draw explosion
            for (int i=0; i<40; i++) {
                particles_r[i][0] = particles_r[i][0] + particles_v[i][0];
                particles_r[i][1] = particles_r[i][1] + particles_v[i][1];
                putpixel(buffer, ship_r[0] + particles_r[i][0], ship_r[1] + particles_r[i][1], stars_color);
            }
            textprintf_ex(buffer, font, SCREEN_W/2 - 40, SCREEN_H/2  - text_height(font), 
                makecol(255,255,255), -1, "CRASHED");

        }

        textprintf_ex(buffer, font, 0, SCREEN_H - 8 - text_height(font), 
            makecol(255,255,255), -1, "Score: %d         Move ship: Arrow keys, Restart: enter/space", score);

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
      "Thanks for playing VECLAND!\n"
      "- by wa59, 2025\n"
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
    if (set_gfx_mode(GFX_VESA1, 640, 400, 0, 0) != 0) {
    //if (set_gfx_mode(GFX_VGA, 320, 200, 0, 0) != 0) {
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