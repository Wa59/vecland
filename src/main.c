#include <time.h>
#include <dos.h>
#include <math.h>
#include <stdio.h>
#include <string.h>
#include <allegro.h>

int get_random(int min, int max){
   return min + rand() / (RAND_MAX / (max - min + 1) + 1);
}

void speaker_freq(int hz) {
    if (hz == 0) {
        outportb(0x61, inportb(0x61) & 0xFC);
        return;
    }
    unsigned divisor = 1193180 / hz;
    outportb(0x43, 0xB6);
    outportb(0x42, divisor & 0xFF);
    outportb(0x42, divisor >> 8);
    outportb(0x61, inportb(0x61) | 3);
}
void note(int freq, int ms) {
    speaker_freq(freq);
    rest(ms);
    speaker_freq(0);
    rest(20);
}

int   engine_on    = 0;
float engine_pwr   = 0.25;
float fuel         = 100;
int   score        = 0;
int   hi_score     = 0;
int   gameover     = 0;
int   vector_color = 7;
int   stars_color  = 7;
float render_scale = 1;
float zoom_spd     = 0.025;
float angle_spd    = 0.25;
float angle        = 0;
float gravity      = 0.05;

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

    // scaling
    if (SCREEN_W == 320) {
        render_scale = 1;
    }
    if (SCREEN_W == 640) {
        render_scale = 2;
    }
    if (SCREEN_W == 800) {
        render_scale = 2.5;
    }

    /*clear_bitmap(buffer);
    textprintf_ex(buffer, font, SCREEN_W/2 - 14*5, SCREEN_H/2  - text_height(font), 
        makecol(255,255,255), -1, "INITIALIZING...");
    blit(buffer, screen, 0, 0, 0, 0, SCREEN_W, SCREEN_H);*/
    rest(500);

    angle = 0;
    ship_v[0] = rand()/1000000000; 
    ship_v[1] = 0; 
    platform_start = get_random(0, SCREEN_W - 20*render_scale); 
    platform_end   = platform_start + 20*render_scale;
    ship_r[0] = 8;
    ship_r[1] = 0;
    landed = 0;
    dead = 0;

    // Generate terrain
    for (int i=0; i<((SCREEN_W)/10 + 1); i++) {
        terrain[i] = rand()/200000000;
    }

    // Generate stars
    for (int i=0; i<32; i=i+2) {
        stars[i] = get_random(0,SCREEN_W);
        stars[i+1] = get_random(0,SCREEN_H - 30*render_scale);
    }

    // Generate particles
    for (int i=0; i<40; i++) {
        particles_r[i][0] = 0;
        particles_r[i][1] = 0;
        particles_v[i][0] = rand()/200000000 - rand()/200000000;
        particles_v[i][1] = rand()/200000000 - rand()/200000000;
        //particles_v[i][0] = rand() % 2 == 0 ? -1 : 1;
        //particles_v[i][1] = rand() % 2 == 0 ? -1 : 1;
    }
}

static int play_game()
{    
    start_vars();

    while (!key[KEY_ESC] && !gameover) {

        if ( (key[KEY_SPACE] || key[KEY_ENTER]) && (dead || landed) ) {
            start_vars();
            continue;
        }

        if (landed) {
            textprintf_ex(buffer, font, SCREEN_W/2 - 7*5, SCREEN_H/2  - text_height(font), 
                makecol(255,255,255), -1, "LANDED!");
            blit(buffer, screen, 0, 0, 0, 0, SCREEN_W, SCREEN_H);
            rest(30);
            continue;
        }

        //render_scale = render_scale + zoom_spd;
        //if (render_scale > 8 || render_scale < 1) { zoom_spd = -1 * zoom_spd; }

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
            ship_v[1] += gravity*render_scale;
            
            if (engine_on) {
                speaker_freq(20);

                fuel -= 0.125;
                if (fuel <= 0) {
                    fuel = 0; 
                } else {
                    ship_v[0] += render_scale * engine_pwr * sin(angle);
                    ship_v[1] -= render_scale * engine_pwr * cos(angle);
                }
            } else if (!dead) {
                speaker_freq(0);
            }
            // Dead ship
            if (ship_r[1] >= SCREEN_H - 25*render_scale) {

                //play_explosion
                int elapsed = 0;
                while (elapsed < 400) {
                    speaker_freq(400-elapsed);
                    rest(10);
                    elapsed += 10;
                }
                speaker_freq(5);
                rest(300);
                speaker_freq(0);


                dead = 1;
                fuel = 100;
                gravity = 0.05;
                score = 0;
            }

            // Warp
            if (ship_r[0] < 0 - 5*render_scale) { ship_r[0] = SCREEN_W; }
            if (ship_r[0] > SCREEN_W + 5*render_scale) { ship_r[0] = 0 - 5*render_scale; }

            // platform colision
            if (
                ship_r[0] >= platform_start &&
                ship_r[0] <= platform_end &&
                ship_r[1] >= SCREEN_H-45*render_scale &&
                ship_r[1] <= SCREEN_H-42*render_scale
                ) {

                ship_v[1] = -1 * ship_v[1]/2;
                ship_v[0] = ship_v[0]/2;
                ship_r[1] = SCREEN_H-45*render_scale;

                speaker_freq(400);
                rest(10);
                speaker_freq(0);

                if (
                    fabs(ship_v[0]) <= 1 &&
                    fabs(ship_v[1]) <= 1 
                    ) {
                        // play hopefully "cool" jingle
                        note(523, 150); 
                        note(659, 150);
                        note(784, 150);
                        note(1046, 200);
                        note(0, 100);
                        note(784, 200);

                        angle = 0;
                        fuel = 100;
                        landed = 1;

                        gravity=gravity + 0.025;
                        if (gravity > 0.05*4) {
                            gravity = 0.05*4;
                        }

                        score++;    
                        if (score > hi_score) {
                            hi_score = score;
                        }
                    }

            }

            // Calc ship position
            ship_r[0] += ship_v[0];
            ship_r[1] += ship_v[1];

            // Select sprite
            if (!engine_on || fuel == 0) {
                memcpy(current_sprite, ship_sprite, sizeof(ship_sprite));
            } else {
                memcpy(current_sprite, ship_sprite_on, sizeof(ship_sprite_on));
            }
            
            for (int i = 0; i < 7 ;i++) {
                rotated_ship_sprite[i][0] = 
                    render_scale * current_sprite[i][0]*cos(angle) -
                    render_scale * current_sprite[i][1]*sin(angle);
                rotated_ship_sprite[i][1] = 
                    render_scale * current_sprite[i][0]*sin(angle) +
                    render_scale * current_sprite[i][1]*cos(angle);
            }
        }



        // Clear buffer
        clear_bitmap(buffer);

        // draw stars
        for (int i=0;i<32;i=i+2) {
            putpixel(buffer, stars[i], stars[i+1], stars_color);
        }

        // Not a moon
        circle(buffer, SCREEN_W-9*render_scale*gravity*20, 2*render_scale*gravity*20, render_scale*2*gravity*20, vector_color);
        circle(buffer, SCREEN_W-10*render_scale*gravity*20, 4*render_scale*gravity*20, render_scale*5*gravity*20, vector_color);

        // Ground
        for (int i=0; i<=SCREEN_W/10 - 1; i++) {
            if ((i*10+10)*render_scale > SCREEN_W) { i = SCREEN_W/10 - 1; }
            line(buffer,
                i*10*render_scale,
                SCREEN_H - (25 + terrain[i])*render_scale,
                (i+1)*10*render_scale, 
                SCREEN_H - (25 + terrain[i+1])*render_scale,
                vector_color);
        }

        // Platform
        line(buffer, platform_start, SCREEN_H - 40*render_scale, platform_end, SCREEN_H - 40*render_scale, vector_color);
        line(buffer, platform_start, SCREEN_H - 40*render_scale + 1, platform_end, SCREEN_H - 40*render_scale + 1, vector_color);

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
            textprintf_ex(buffer, font, SCREEN_W/2 - 7*5, SCREEN_H/2  - text_height(font), 
                makecol(255,255,255), -1, "CRASHED");

        }

        textprintf_ex(buffer, font, 0, SCREEN_H - 4 - text_height(font), 
            makecol(255,255,255), -1, "Score: %d       Fuel: %.1f", score, fuel);
        
        if (SCREEN_W > 320) {
            textprintf_ex(buffer, font, SCREEN_W - 8*44, SCREEN_H - 4 - text_height(font), 
                makecol(255,255,255), -1, "Move ship: Arrow keys, Restart: enter/space");
        }
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
      "\n"
      "Your best score was %d."
      "\n"
   , hi_score);
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

    if (set_gfx_mode(GFX_VESA1, 800, 600, 0, 0) != 0) {
    //if (set_gfx_mode(GFX_VESA1, 640, 480, 0, 0) != 0) {
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
    speaker_freq(0);
    return 0;
}


END_OF_MAIN()