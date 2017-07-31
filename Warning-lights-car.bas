'--------------------------------------------------------------
'                   Thomas Jensen | uCtrl.io
'--------------------------------------------------------------
'  file: Strobe_light_controller_for_car_1.0
'  date: 19/05/2009
'--------------------------------------------------------------
$regfile = "attiny2313.dat"
$crystal = 8000000
Config Portd = Input
Config Portb = Output
Config Watchdog = 1024

Dim A As Byte , On_timer As Byte
Config Timer1 = Pwm , Pwm = 8 , Prescale = 1 , Compare A Pwm = Clear Up , Compare B Pwm = Clear Up

Portb = 0
Ddrb.3 = 1
Ddrb.4 = 1
Pwm1a = 255
Pwm1b = 255
On_timer = 0
Start Watchdog

Main:
If On_timer < 250 Then Incr On_timer
If On_timer = 100 Then
   For A = 1 To 20
   Decr Pwm1a
   Waitms 20
   Next A
   End If
If On_timer = 200 Then
   For A = 1 To 20
   Decr Pwm1b
   Waitms 20
   Next A
   End If

If Pind.6 = 1 And On_timer = 250 Then                       'side markers on
   Portb.0 = 0
   If Pwm1a = 255 Then
      For A = 1 To 20
      Decr Pwm1a
      Waitms 20
      Next A
   End If
   If Pwm1b = 255 Then
      For A = 1 To 20
      Decr Pwm1b
      Waitms 20
      Next A
   End If
   Portb.1 = 0
   Portb.2 = 0
   End If

If Pind.6 = 0 Then
   For A = 1 To 3
      Portb.0 = 1
      Pwm1a = 0
      Portb.1 = 1
      Waitms 40
      Portb.0 = 0
      Pwm1a = 255
      Portb.1 = 0
      Waitms 60
   Next A
      Waitms 100

   For A = 1 To 3
      Portb.0 = 1
      Pwm1b = 0
      Portb.2 = 1
      Waitms 40
      Portb.0 = 0
      Pwm1b = 255
      Portb.2 = 0
      Waitms 60
   Next A
      Waitms 99
End If

Reset Watchdog                                              'loop cycle
Waitms 1
Goto Main
End