'--------------------------------------------------------------
'                   Thomas Jensen | stdout.no
'--------------------------------------------------------------
'  file: Strobe_light_controller_for_car_1.1
'  date: 19/05/2009
'--------------------------------------------------------------
$regfile = "attiny2313.dat"
$crystal = 8000000
Config Portd = Input
Config Portb = Output
Config Watchdog = 1024

Dim A As Byte , B As Byte , Strobe_was_on As Bit
Config Timer1 = Pwm , Pwm = 8 , Prescale = 1 , Compare A Pwm = Clear Up , Compare B Pwm = Clear Up

Const Pwm_off = 255                                         '255
Const Pwm_low = 235                                         '235
Const Pwm_high = 0                                          '0
Const On = 1
Const Off = 0

Portb = 0
Ddrb.3 = 1
Ddrb.4 = 1
Pwm1a = Pwm_off
Pwm1b = Pwm_off
Strobe_was_on = 0

If Pind.6 = 1 Then
   Waitms 100
   For A = 1 To 20
   Decr Pwm1a                                               'decr
   Waitms 20
   Next A
   Waitms 100
   For A = 1 To 20
   Decr Pwm1b                                               'decr
   Waitms 20
   Next A
End If

Start Watchdog

Main:
If Pind.6 = 1 Then
   Waitms 10

   If Strobe_was_on = 1 Then                                'side markers on
      Portb.0 = Off
      Pwm1a = Pwm_low
      Pwm1b = Pwm_low
      Portb.1 = Off
      Portb.2 = Off
      Strobe_was_on = 0
   End If
End If

If Pind.6 = 0 Then
   Strobe_was_on = 1

   'signal 1
For B = 1 To 2
   For A = 1 To 3
      Portb.0 = On
      Pwm1a = Pwm_high
      Pwm1b = Pwm_high
      Portb.1 = On
      Waitms 50
      Portb.0 = Off
      Pwm1a = Pwm_off
      Pwm1b = Pwm_off
      Portb.1 = Off
      Waitms 50
      Reset Watchdog
   Next A
      Waitms 100

   For A = 1 To 3
      Portb.0 = On
      Pwm1a = Pwm_high
      Pwm1b = Pwm_high
      Portb.2 = On
      Waitms 50
      Portb.0 = Off
      Pwm1a = Pwm_off
      Pwm1b = Pwm_off
      Portb.2 = Off
      Waitms 50
      Reset Watchdog
   Next A
      Waitms 100
Next B

   'signal 1-all
   For A = 1 To 3
      Portb.0 = On
      Pwm1a = Pwm_high
      Pwm1b = Pwm_high
      Portb.1 = On
      Portb.2 = On
      Waitms 50
      Portb.0 = Off
      Pwm1a = Pwm_off
      Pwm1b = Pwm_off
      Portb.1 = Off
      Portb.2 = Off
      Waitms 50
      Reset Watchdog
   Next A
      Waitms 100

   'signal 2
For B = 1 To 2
   For A = 1 To 5
      Portb.0 = On
      Pwm1a = Pwm_high
      Pwm1b = Pwm_high
      Portb.1 = On
      Waitms 50
      Portb.0 = Off
      Pwm1a = Pwm_off
      Pwm1b = Pwm_off
      Portb.1 = Off
      Waitms 20
      Reset Watchdog
   Next A
      Portb.0 = On
      Pwm1a = Pwm_high
      Pwm1b = Pwm_high
      Portb.1 = On
      Waitms 300
      Portb.0 = Off
      Pwm1a = Pwm_off
      Pwm1b = Pwm_off
      Portb.1 = Off
      Waitms 100
   Reset Watchdog

   For A = 1 To 5
      Portb.0 = On
      Pwm1a = Pwm_high
      Pwm1b = Pwm_high
      Portb.2 = On
      Waitms 50
      Portb.0 = Off
      Pwm1a = Pwm_off
      Pwm1b = Pwm_off
      Portb.2 = Off
      Waitms 20
      Reset Watchdog
   Next A
      Portb.0 = On
      Pwm1a = Pwm_high
      Pwm1b = Pwm_high
      Portb.2 = On
      Waitms 300
      Portb.0 = Off
      Pwm1a = Pwm_off
      Pwm1b = Pwm_off
      Portb.2 = Off
      Waitms 100
   Reset Watchdog
Next B

   'signal 2-all
   For A = 1 To 5
      Portb.0 = On
      Pwm1a = Pwm_high
      Pwm1b = Pwm_high
      Portb.1 = On
      Portb.2 = On
      Waitms 50
      Portb.0 = Off
      Pwm1a = Pwm_off
      Pwm1b = Pwm_off
      Portb.1 = Off
      Portb.2 = Off
      Waitms 20
      Reset Watchdog
   Next A
      Portb.0 = On
      Pwm1a = Pwm_high
      Pwm1b = Pwm_high
      Portb.1 = On
      Portb.2 = On
      Waitms 300
      Portb.0 = Off
      Pwm1a = Pwm_off
      Pwm1b = Pwm_off
      Portb.1 = Off
      Portb.2 = Off
      Waitms 100
   Reset Watchdog

   'signal 3
For B = 1 To 2
      Portb.0 = On
      Pwm1a = Pwm_high
      Pwm1b = Pwm_high
      Portb.1 = On
      Waitms 300
      Portb.0 = Off
      Pwm1a = Pwm_off
      Pwm1b = Pwm_off
      Portb.1 = Off
      Waitms 100
      Reset Watchdog
   For A = 1 To 2
      Portb.0 = On
      Pwm1a = Pwm_high
      Pwm1b = Pwm_high
      Portb.1 = On
      Waitms 50
      Portb.0 = Off
      Pwm1a = Pwm_off
      Pwm1b = Pwm_off
      Portb.1 = Off
      Waitms 50
      Reset Watchdog
   Next A
      Waitms 100

      Portb.0 = On
      Pwm1a = Pwm_high
      Pwm1b = Pwm_high
      Portb.2 = On
      Waitms 300
      Portb.0 = Off
      Pwm1a = Pwm_off
      Pwm1b = Pwm_off
      Portb.2 = Off
      Waitms 100
      Reset Watchdog
   For A = 1 To 2
      Portb.0 = On
      Pwm1a = Pwm_high
      Pwm1b = Pwm_high
      Portb.2 = On
      Waitms 50
      Portb.0 = Off
      Pwm1a = Pwm_off
      Pwm1b = Pwm_off
      Portb.2 = Off
      Waitms 50
      Reset Watchdog
   Next A
      Waitms 100
Next B

   'signal 3-all
      Portb.0 = On
      Pwm1a = Pwm_high
      Pwm1b = Pwm_high
      Portb.1 = On
      Portb.2 = On
      Waitms 300
      Portb.0 = Off
      Pwm1a = Pwm_off
      Pwm1b = Pwm_off
      Portb.1 = Off
      Portb.2 = Off
      Waitms 100
      Reset Watchdog
   For A = 1 To 2
      Portb.0 = On
      Pwm1a = Pwm_high
      Pwm1b = Pwm_high
      Portb.1 = On
      Portb.2 = On
      Waitms 50
      Portb.0 = Off
      Pwm1a = Pwm_off
      Pwm1b = Pwm_off
      Portb.1 = Off
      Portb.2 = Off
      Waitms 50
      Reset Watchdog
   Next A
      Waitms 100

End If

Reset Watchdog                                              'loop cycle
Goto Main
End