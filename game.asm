; Este eh um jogo feito em assembly do processador do Simoes para a materia de Organizacao de Computadores
;
; O jogo foi feito por Miguel Filippo Rocha Calhabeu. Caso queira entrar em contato, meu e-mail eh migue.calhabeu@gmail.com

jmp Main

; ------- TABELA DE CORES -------
; adicione ao caracter para Selecionar a cor correspondente

; 0 branco							0000 0000
; 256 marrom						0001 0000
; 512 verde							0010 0000
; 768 oliva							0011 0000
; 1024 azul marinho					0100 0000
; 1280 roxo							0101 0000
; 1536 teal							0110 0000
; 1792 prata						0111 0000
; 2048 cinza						1000 0000
; 2304 vermelho						1001 0000
; 2560 lima							1010 0000
; 2816 amarelo						1011 0000
; 3072 azul							1100 0000
; 3328 rosa							1101 0000
; 3584 aqua							1110 0000
; 3840 branco						1111 0000

;---- Declaracao de Variaveis Globais -------------------------------------------------------
; Sao todas aquelas que precisam ser vistas por mais de uma funcao: Evita a passagem de parametros.
; As variaveis locais de cada funcao serao alocadas nos Registradores internos (r0 a r7)

Pontuacao: var #1
PassaroPos: var #1
PassaroPos2: var #1
CanoPos: var #1
static CanoPos + #0, #38
CanoTopo: var #1
static CanoTopo + #0, #10
VetorRandomIndex: var #1
static VetorRandomIndex + #0, #0

VetorRandom: var #1064
static VetorRandom + #0, #13
static VetorRandom + #1, #8
static VetorRandom + #2, #25
static VetorRandom + #3, #4
static VetorRandom + #4, #20
static VetorRandom + #5, #26
static VetorRandom + #6, #15
static VetorRandom + #7, #22
static VetorRandom + #8, #20
static VetorRandom + #9, #8
static VetorRandom + #10, #3
static VetorRandom + #11, #26
static VetorRandom + #12, #19
static VetorRandom + #13, #6
static VetorRandom + #14, #26
static VetorRandom + #15, #17
static VetorRandom + #16, #4
static VetorRandom + #17, #24
static VetorRandom + #18, #5
static VetorRandom + #19, #25
static VetorRandom + #20, #13
static VetorRandom + #21, #11
static VetorRandom + #22, #13
static VetorRandom + #23, #8
static VetorRandom + #24, #4
static VetorRandom + #25, #25
static VetorRandom + #26, #7
static VetorRandom + #27, #17
static VetorRandom + #28, #22
static VetorRandom + #29, #0
static VetorRandom + #30, #26
static VetorRandom + #31, #10
static VetorRandom + #32, #7
static VetorRandom + #33, #3
static VetorRandom + #34, #2
static VetorRandom + #35, #13
static VetorRandom + #36, #8
static VetorRandom + #37, #20
static VetorRandom + #38, #19
static VetorRandom + #39, #8
static VetorRandom + #40, #4
static VetorRandom + #41, #16
static VetorRandom + #42, #26
static VetorRandom + #43, #1
static VetorRandom + #44, #4
static VetorRandom + #45, #10
static VetorRandom + #46, #7
static VetorRandom + #47, #17
static VetorRandom + #48, #6
static VetorRandom + #49, #6
static VetorRandom + #50, #21
static VetorRandom + #51, #18
static VetorRandom + #52, #15
static VetorRandom + #53, #21
static VetorRandom + #54, #16
static VetorRandom + #55, #4
static VetorRandom + #56, #11
static VetorRandom + #57, #17
static VetorRandom + #58, #0
static VetorRandom + #59, #22
static VetorRandom + #60, #17
static VetorRandom + #61, #4
static VetorRandom + #62, #11
static VetorRandom + #63, #25
static VetorRandom + #64, #24
static VetorRandom + #65, #24
static VetorRandom + #66, #21
static VetorRandom + #67, #16
static VetorRandom + #68, #8
static VetorRandom + #69, #26
static VetorRandom + #70, #6
static VetorRandom + #71, #11
static VetorRandom + #72, #7
static VetorRandom + #73, #4
static VetorRandom + #74, #9
static VetorRandom + #75, #15
static VetorRandom + #76, #16
static VetorRandom + #77, #19
static VetorRandom + #78, #24
static VetorRandom + #79, #24
static VetorRandom + #80, #16
static VetorRandom + #81, #22
static VetorRandom + #82, #14
static VetorRandom + #83, #9
static VetorRandom + #84, #25
static VetorRandom + #85, #10
static VetorRandom + #86, #18
static VetorRandom + #87, #4
static VetorRandom + #88, #14
static VetorRandom + #89, #23
static VetorRandom + #90, #8
static VetorRandom + #91, #11
static VetorRandom + #92, #6
static VetorRandom + #93, #22
static VetorRandom + #94, #1
static VetorRandom + #95, #5
static VetorRandom + #96, #16
static VetorRandom + #97, #7
static VetorRandom + #98, #10
static VetorRandom + #99, #1
static VetorRandom + #100, #17
static VetorRandom + #101, #26
static VetorRandom + #102, #15
static VetorRandom + #103, #12
static VetorRandom + #104, #1
static VetorRandom + #105, #12
static VetorRandom + #106, #0
static VetorRandom + #107, #0
static VetorRandom + #108, #13
static VetorRandom + #109, #12
static VetorRandom + #110, #5
static VetorRandom + #111, #19
static VetorRandom + #112, #18
static VetorRandom + #113, #24
static VetorRandom + #114, #12
static VetorRandom + #115, #16
static VetorRandom + #116, #16
static VetorRandom + #117, #8
static VetorRandom + #118, #1
static VetorRandom + #119, #16
static VetorRandom + #120, #21
static VetorRandom + #121, #23
static VetorRandom + #122, #19
static VetorRandom + #123, #9
static VetorRandom + #124, #10
static VetorRandom + #125, #9
static VetorRandom + #126, #6
static VetorRandom + #127, #20
static VetorRandom + #128, #1
static VetorRandom + #129, #15
static VetorRandom + #130, #11
static VetorRandom + #131, #16
static VetorRandom + #132, #24
static VetorRandom + #133, #4
static VetorRandom + #134, #14
static VetorRandom + #135, #4
static VetorRandom + #136, #23
static VetorRandom + #137, #19
static VetorRandom + #138, #23
static VetorRandom + #139, #8
static VetorRandom + #140, #24
static VetorRandom + #141, #8
static VetorRandom + #142, #3
static VetorRandom + #143, #17
static VetorRandom + #144, #15
static VetorRandom + #145, #23
static VetorRandom + #146, #8
static VetorRandom + #147, #9
static VetorRandom + #148, #1
static VetorRandom + #149, #19
static VetorRandom + #150, #20
static VetorRandom + #151, #14
static VetorRandom + #152, #9
static VetorRandom + #153, #1
static VetorRandom + #154, #25
static VetorRandom + #155, #19
static VetorRandom + #156, #15
static VetorRandom + #157, #12
static VetorRandom + #158, #14
static VetorRandom + #159, #18
static VetorRandom + #160, #20
static VetorRandom + #161, #22
static VetorRandom + #162, #18
static VetorRandom + #163, #24
static VetorRandom + #164, #19
static VetorRandom + #165, #12
static VetorRandom + #166, #10
static VetorRandom + #167, #2
static VetorRandom + #168, #16
static VetorRandom + #169, #3
static VetorRandom + #170, #18
static VetorRandom + #171, #26
static VetorRandom + #172, #7
static VetorRandom + #173, #7
static VetorRandom + #174, #2
static VetorRandom + #175, #22
static VetorRandom + #176, #21
static VetorRandom + #177, #2
static VetorRandom + #178, #13
static VetorRandom + #179, #20
static VetorRandom + #180, #6
static VetorRandom + #181, #11
static VetorRandom + #182, #0
static VetorRandom + #183, #16
static VetorRandom + #184, #24
static VetorRandom + #185, #22
static VetorRandom + #186, #17
static VetorRandom + #187, #16
static VetorRandom + #188, #11
static VetorRandom + #189, #1
static VetorRandom + #190, #13
static VetorRandom + #191, #25
static VetorRandom + #192, #12
static VetorRandom + #193, #18
static VetorRandom + #194, #22
static VetorRandom + #195, #17
static VetorRandom + #196, #21
static VetorRandom + #197, #22
static VetorRandom + #198, #0
static VetorRandom + #199, #15
static VetorRandom + #200, #10
static VetorRandom + #201, #5
static VetorRandom + #202, #3
static VetorRandom + #203, #15
static VetorRandom + #204, #6
static VetorRandom + #205, #6
static VetorRandom + #206, #5
static VetorRandom + #207, #19
static VetorRandom + #208, #24
static VetorRandom + #209, #26
static VetorRandom + #210, #3
static VetorRandom + #211, #24
static VetorRandom + #212, #6
static VetorRandom + #213, #18
static VetorRandom + #214, #17
static VetorRandom + #215, #24
static VetorRandom + #216, #22
static VetorRandom + #217, #7
static VetorRandom + #218, #22
static VetorRandom + #219, #4
static VetorRandom + #220, #8
static VetorRandom + #221, #19
static VetorRandom + #222, #14
static VetorRandom + #223, #5
static VetorRandom + #224, #8
static VetorRandom + #225, #15
static VetorRandom + #226, #5
static VetorRandom + #227, #14
static VetorRandom + #228, #17
static VetorRandom + #229, #26
static VetorRandom + #230, #12
static VetorRandom + #231, #19
static VetorRandom + #232, #2
static VetorRandom + #233, #14
static VetorRandom + #234, #15
static VetorRandom + #235, #15
static VetorRandom + #236, #16
static VetorRandom + #237, #23
static VetorRandom + #238, #7
static VetorRandom + #239, #3
static VetorRandom + #240, #6
static VetorRandom + #241, #7
static VetorRandom + #242, #12
static VetorRandom + #243, #0
static VetorRandom + #244, #18
static VetorRandom + #245, #7
static VetorRandom + #246, #22
static VetorRandom + #247, #26
static VetorRandom + #248, #6
static VetorRandom + #249, #16
static VetorRandom + #250, #19
static VetorRandom + #251, #24
static VetorRandom + #252, #13
static VetorRandom + #253, #2
static VetorRandom + #254, #21
static VetorRandom + #255, #26
static VetorRandom + #256, #15
static VetorRandom + #257, #5
static VetorRandom + #258, #17
static VetorRandom + #259, #18
static VetorRandom + #260, #8
static VetorRandom + #261, #18
static VetorRandom + #262, #15
static VetorRandom + #263, #1
static VetorRandom + #264, #6
static VetorRandom + #265, #14
static VetorRandom + #266, #25
static VetorRandom + #267, #21
static VetorRandom + #268, #15
static VetorRandom + #269, #7
static VetorRandom + #270, #0
static VetorRandom + #271, #23
static VetorRandom + #272, #25
static VetorRandom + #273, #2
static VetorRandom + #274, #25
static VetorRandom + #275, #8
static VetorRandom + #276, #17
static VetorRandom + #277, #24
static VetorRandom + #278, #11
static VetorRandom + #279, #18
static VetorRandom + #280, #5
static VetorRandom + #281, #9
static VetorRandom + #282, #18
static VetorRandom + #283, #14
static VetorRandom + #284, #6
static VetorRandom + #285, #21
static VetorRandom + #286, #25
static VetorRandom + #287, #8
static VetorRandom + #288, #19
static VetorRandom + #289, #5
static VetorRandom + #290, #25
static VetorRandom + #291, #3
static VetorRandom + #292, #11
static VetorRandom + #293, #0
static VetorRandom + #294, #3
static VetorRandom + #295, #13
static VetorRandom + #296, #3
static VetorRandom + #297, #26
static VetorRandom + #298, #17
static VetorRandom + #299, #14
static VetorRandom + #300, #1
static VetorRandom + #301, #4
static VetorRandom + #302, #25
static VetorRandom + #303, #8
static VetorRandom + #304, #5
static VetorRandom + #305, #19
static VetorRandom + #306, #12
static VetorRandom + #307, #5
static VetorRandom + #308, #21
static VetorRandom + #309, #2
static VetorRandom + #310, #11
static VetorRandom + #311, #12
static VetorRandom + #312, #3
static VetorRandom + #313, #7
static VetorRandom + #314, #20
static VetorRandom + #315, #5
static VetorRandom + #316, #25
static VetorRandom + #317, #5
static VetorRandom + #318, #3
static VetorRandom + #319, #9
static VetorRandom + #320, #5
static VetorRandom + #321, #17
static VetorRandom + #322, #14
static VetorRandom + #323, #24
static VetorRandom + #324, #11
static VetorRandom + #325, #11
static VetorRandom + #326, #25
static VetorRandom + #327, #15
static VetorRandom + #328, #19
static VetorRandom + #329, #5
static VetorRandom + #330, #17
static VetorRandom + #331, #16
static VetorRandom + #332, #20
static VetorRandom + #333, #19
static VetorRandom + #334, #4
static VetorRandom + #335, #6
static VetorRandom + #336, #2
static VetorRandom + #337, #17
static VetorRandom + #338, #2
static VetorRandom + #339, #25
static VetorRandom + #340, #2
static VetorRandom + #341, #3
static VetorRandom + #342, #15
static VetorRandom + #343, #21
static VetorRandom + #344, #17
static VetorRandom + #345, #14
static VetorRandom + #346, #11
static VetorRandom + #347, #16
static VetorRandom + #348, #1
static VetorRandom + #349, #8
static VetorRandom + #350, #4
static VetorRandom + #351, #13
static VetorRandom + #352, #20
static VetorRandom + #353, #10
static VetorRandom + #354, #26
static VetorRandom + #355, #23
static VetorRandom + #356, #2
static VetorRandom + #357, #13
static VetorRandom + #358, #4
static VetorRandom + #359, #2
static VetorRandom + #360, #17
static VetorRandom + #361, #8
static VetorRandom + #362, #25
static VetorRandom + #363, #13
static VetorRandom + #364, #11
static VetorRandom + #365, #20
static VetorRandom + #366, #19
static VetorRandom + #367, #25
static VetorRandom + #368, #13
static VetorRandom + #369, #8
static VetorRandom + #370, #0
static VetorRandom + #371, #23
static VetorRandom + #372, #2
static VetorRandom + #373, #14
static VetorRandom + #374, #9
static VetorRandom + #375, #18
static VetorRandom + #376, #25
static VetorRandom + #377, #5
static VetorRandom + #378, #22
static VetorRandom + #379, #18
static VetorRandom + #380, #8
static VetorRandom + #381, #0
static VetorRandom + #382, #24
static VetorRandom + #383, #4
static VetorRandom + #384, #18
static VetorRandom + #385, #1
static VetorRandom + #386, #13
static VetorRandom + #387, #2
static VetorRandom + #388, #22
static VetorRandom + #389, #11
static VetorRandom + #390, #20
static VetorRandom + #391, #13
static VetorRandom + #392, #8
static VetorRandom + #393, #7
static VetorRandom + #394, #20
static VetorRandom + #395, #18
static VetorRandom + #396, #20
static VetorRandom + #397, #7
static VetorRandom + #398, #6
static VetorRandom + #399, #13
static VetorRandom + #400, #24
static VetorRandom + #401, #5
static VetorRandom + #402, #22
static VetorRandom + #403, #17
static VetorRandom + #404, #7
static VetorRandom + #405, #25
static VetorRandom + #406, #3
static VetorRandom + #407, #0
static VetorRandom + #408, #26
static VetorRandom + #409, #12
static VetorRandom + #410, #6
static VetorRandom + #411, #10
static VetorRandom + #412, #16
static VetorRandom + #413, #17
static VetorRandom + #414, #14
static VetorRandom + #415, #26
static VetorRandom + #416, #18
static VetorRandom + #417, #16
static VetorRandom + #418, #4
static VetorRandom + #419, #4
static VetorRandom + #420, #14
static VetorRandom + #421, #7
static VetorRandom + #422, #13
static VetorRandom + #423, #7
static VetorRandom + #424, #24
static VetorRandom + #425, #7
static VetorRandom + #426, #22
static VetorRandom + #427, #0
static VetorRandom + #428, #6
static VetorRandom + #429, #6
static VetorRandom + #430, #26
static VetorRandom + #431, #0
static VetorRandom + #432, #25
static VetorRandom + #433, #10
static VetorRandom + #434, #26
static VetorRandom + #435, #26
static VetorRandom + #436, #14
static VetorRandom + #437, #15
static VetorRandom + #438, #16
static VetorRandom + #439, #15
static VetorRandom + #440, #13
static VetorRandom + #441, #6
static VetorRandom + #442, #21
static VetorRandom + #443, #11
static VetorRandom + #444, #14
static VetorRandom + #445, #18
static VetorRandom + #446, #5
static VetorRandom + #447, #11
static VetorRandom + #448, #18
static VetorRandom + #449, #0
static VetorRandom + #450, #10
static VetorRandom + #451, #7
static VetorRandom + #452, #19
static VetorRandom + #453, #22
static VetorRandom + #454, #5
static VetorRandom + #455, #0
static VetorRandom + #456, #18
static VetorRandom + #457, #16
static VetorRandom + #458, #16
static VetorRandom + #459, #20
static VetorRandom + #460, #22
static VetorRandom + #461, #17
static VetorRandom + #462, #26
static VetorRandom + #463, #20
static VetorRandom + #464, #20
static VetorRandom + #465, #4
static VetorRandom + #466, #0
static VetorRandom + #467, #25
static VetorRandom + #468, #20
static VetorRandom + #469, #9
static VetorRandom + #470, #8
static VetorRandom + #471, #3
static VetorRandom + #472, #4
static VetorRandom + #473, #9
static VetorRandom + #474, #0
static VetorRandom + #475, #11
static VetorRandom + #476, #12
static VetorRandom + #477, #25
static VetorRandom + #478, #1
static VetorRandom + #479, #10
static VetorRandom + #480, #1
static VetorRandom + #481, #11
static VetorRandom + #482, #25
static VetorRandom + #483, #19
static VetorRandom + #484, #8
static VetorRandom + #485, #10
static VetorRandom + #486, #1
static VetorRandom + #487, #21
static VetorRandom + #488, #4
static VetorRandom + #489, #18
static VetorRandom + #490, #16
static VetorRandom + #491, #23
static VetorRandom + #492, #7
static VetorRandom + #493, #22
static VetorRandom + #494, #26
static VetorRandom + #495, #13
static VetorRandom + #496, #18
static VetorRandom + #497, #15
static VetorRandom + #498, #15
static VetorRandom + #499, #10
static VetorRandom + #500, #16
static VetorRandom + #501, #11
static VetorRandom + #502, #2
static VetorRandom + #503, #6
static VetorRandom + #504, #18
static VetorRandom + #505, #15
static VetorRandom + #506, #15
static VetorRandom + #507, #8
static VetorRandom + #508, #21
static VetorRandom + #509, #22
static VetorRandom + #510, #2
static VetorRandom + #511, #14
static VetorRandom + #512, #25
static VetorRandom + #513, #18
static VetorRandom + #514, #20
static VetorRandom + #515, #8
static VetorRandom + #516, #14
static VetorRandom + #517, #25
static VetorRandom + #518, #7
static VetorRandom + #519, #18
static VetorRandom + #520, #1
static VetorRandom + #521, #25
static VetorRandom + #522, #3
static VetorRandom + #523, #8
static VetorRandom + #524, #12
static VetorRandom + #525, #20
static VetorRandom + #526, #13
static VetorRandom + #527, #15
static VetorRandom + #528, #19
static VetorRandom + #529, #5
static VetorRandom + #530, #5
static VetorRandom + #531, #7
static VetorRandom + #532, #22
static VetorRandom + #533, #21
static VetorRandom + #534, #6
static VetorRandom + #535, #7
static VetorRandom + #536, #22
static VetorRandom + #537, #23
static VetorRandom + #538, #24
static VetorRandom + #539, #5
static VetorRandom + #540, #20
static VetorRandom + #541, #18
static VetorRandom + #542, #22
static VetorRandom + #543, #12
static VetorRandom + #544, #21
static VetorRandom + #545, #13
static VetorRandom + #546, #24
static VetorRandom + #547, #2
static VetorRandom + #548, #24
static VetorRandom + #549, #12
static VetorRandom + #550, #25
static VetorRandom + #551, #7
static VetorRandom + #552, #9
static VetorRandom + #553, #9
static VetorRandom + #554, #20
static VetorRandom + #555, #2
static VetorRandom + #556, #22
static VetorRandom + #557, #13
static VetorRandom + #558, #21
static VetorRandom + #559, #6
static VetorRandom + #560, #13
static VetorRandom + #561, #3
static VetorRandom + #562, #12
static VetorRandom + #563, #18
static VetorRandom + #564, #26
static VetorRandom + #565, #21
static VetorRandom + #566, #7
static VetorRandom + #567, #2
static VetorRandom + #568, #16
static VetorRandom + #569, #8
static VetorRandom + #570, #19
static VetorRandom + #571, #24
static VetorRandom + #572, #7
static VetorRandom + #573, #10
static VetorRandom + #574, #23
static VetorRandom + #575, #24
static VetorRandom + #576, #17
static VetorRandom + #577, #9
static VetorRandom + #578, #24
static VetorRandom + #579, #6
static VetorRandom + #580, #14
static VetorRandom + #581, #11
static VetorRandom + #582, #2
static VetorRandom + #583, #14
static VetorRandom + #584, #5
static VetorRandom + #585, #15
static VetorRandom + #586, #16
static VetorRandom + #587, #24
static VetorRandom + #588, #15
static VetorRandom + #589, #12
static VetorRandom + #590, #15
static VetorRandom + #591, #10
static VetorRandom + #592, #24
static VetorRandom + #593, #20
static VetorRandom + #594, #8
static VetorRandom + #595, #4
static VetorRandom + #596, #5
static VetorRandom + #597, #0
static VetorRandom + #598, #21
static VetorRandom + #599, #0
static VetorRandom + #600, #6
static VetorRandom + #601, #2
static VetorRandom + #602, #20
static VetorRandom + #603, #2
static VetorRandom + #604, #20
static VetorRandom + #605, #15
static VetorRandom + #606, #24
static VetorRandom + #607, #21
static VetorRandom + #608, #20
static VetorRandom + #609, #25
static VetorRandom + #610, #19
static VetorRandom + #611, #9
static VetorRandom + #612, #0
static VetorRandom + #613, #15
static VetorRandom + #614, #16
static VetorRandom + #615, #7
static VetorRandom + #616, #17
static VetorRandom + #617, #7
static VetorRandom + #618, #25
static VetorRandom + #619, #15
static VetorRandom + #620, #2
static VetorRandom + #621, #13
static VetorRandom + #622, #21
static VetorRandom + #623, #14
static VetorRandom + #624, #14
static VetorRandom + #625, #2
static VetorRandom + #626, #3
static VetorRandom + #627, #14
static VetorRandom + #628, #10
static VetorRandom + #629, #14
static VetorRandom + #630, #13
static VetorRandom + #631, #17
static VetorRandom + #632, #12
static VetorRandom + #633, #25
static VetorRandom + #634, #10
static VetorRandom + #635, #10
static VetorRandom + #636, #23
static VetorRandom + #637, #17
static VetorRandom + #638, #21
static VetorRandom + #639, #26
static VetorRandom + #640, #18
static VetorRandom + #641, #6
static VetorRandom + #642, #8
static VetorRandom + #643, #13
static VetorRandom + #644, #14
static VetorRandom + #645, #13
static VetorRandom + #646, #2
static VetorRandom + #647, #23
static VetorRandom + #648, #4
static VetorRandom + #649, #9
static VetorRandom + #650, #25
static VetorRandom + #651, #0
static VetorRandom + #652, #15
static VetorRandom + #653, #11
static VetorRandom + #654, #0
static VetorRandom + #655, #16
static VetorRandom + #656, #2
static VetorRandom + #657, #17
static VetorRandom + #658, #3
static VetorRandom + #659, #11
static VetorRandom + #660, #26
static VetorRandom + #661, #21
static VetorRandom + #662, #24
static VetorRandom + #663, #6
static VetorRandom + #664, #18
static VetorRandom + #665, #6
static VetorRandom + #666, #13
static VetorRandom + #667, #6
static VetorRandom + #668, #3
static VetorRandom + #669, #0
static VetorRandom + #670, #15
static VetorRandom + #671, #3
static VetorRandom + #672, #26
static VetorRandom + #673, #1
static VetorRandom + #674, #22
static VetorRandom + #675, #22
static VetorRandom + #676, #16
static VetorRandom + #677, #12
static VetorRandom + #678, #13
static VetorRandom + #679, #19
static VetorRandom + #680, #9
static VetorRandom + #681, #1
static VetorRandom + #682, #20
static VetorRandom + #683, #26
static VetorRandom + #684, #15
static VetorRandom + #685, #13
static VetorRandom + #686, #9
static VetorRandom + #687, #13
static VetorRandom + #688, #11
static VetorRandom + #689, #9
static VetorRandom + #690, #22
static VetorRandom + #691, #10
static VetorRandom + #692, #25
static VetorRandom + #693, #4
static VetorRandom + #694, #18
static VetorRandom + #695, #16
static VetorRandom + #696, #9
static VetorRandom + #697, #25
static VetorRandom + #698, #15
static VetorRandom + #699, #7
static VetorRandom + #700, #18
static VetorRandom + #701, #0
static VetorRandom + #702, #17
static VetorRandom + #703, #19
static VetorRandom + #704, #2
static VetorRandom + #705, #25
static VetorRandom + #706, #13
static VetorRandom + #707, #0
static VetorRandom + #708, #11
static VetorRandom + #709, #2
static VetorRandom + #710, #4
static VetorRandom + #711, #8
static VetorRandom + #712, #6
static VetorRandom + #713, #21
static VetorRandom + #714, #21
static VetorRandom + #715, #19
static VetorRandom + #716, #2
static VetorRandom + #717, #18
static VetorRandom + #718, #23
static VetorRandom + #719, #5
static VetorRandom + #720, #21
static VetorRandom + #721, #2
static VetorRandom + #722, #21
static VetorRandom + #723, #19
static VetorRandom + #724, #19
static VetorRandom + #725, #3
static VetorRandom + #726, #19
static VetorRandom + #727, #24
static VetorRandom + #728, #11
static VetorRandom + #729, #7
static VetorRandom + #730, #10
static VetorRandom + #731, #5
static VetorRandom + #732, #2
static VetorRandom + #733, #6
static VetorRandom + #734, #26
static VetorRandom + #735, #14
static VetorRandom + #736, #0
static VetorRandom + #737, #25
static VetorRandom + #738, #14
static VetorRandom + #739, #4
static VetorRandom + #740, #17
static VetorRandom + #741, #1
static VetorRandom + #742, #0
static VetorRandom + #743, #19
static VetorRandom + #744, #25
static VetorRandom + #745, #16
static VetorRandom + #746, #20
static VetorRandom + #747, #16
static VetorRandom + #748, #7
static VetorRandom + #749, #6
static VetorRandom + #750, #22
static VetorRandom + #751, #2
static VetorRandom + #752, #9
static VetorRandom + #753, #5
static VetorRandom + #754, #4
static VetorRandom + #755, #22
static VetorRandom + #756, #20
static VetorRandom + #757, #9
static VetorRandom + #758, #24
static VetorRandom + #759, #14
static VetorRandom + #760, #6
static VetorRandom + #761, #13
static VetorRandom + #762, #0
static VetorRandom + #763, #21
static VetorRandom + #764, #12
static VetorRandom + #765, #18
static VetorRandom + #766, #23
static VetorRandom + #767, #21
static VetorRandom + #768, #15
static VetorRandom + #769, #15
static VetorRandom + #770, #11
static VetorRandom + #771, #26
static VetorRandom + #772, #3
static VetorRandom + #773, #6
static VetorRandom + #774, #24
static VetorRandom + #775, #14
static VetorRandom + #776, #11
static VetorRandom + #777, #7
static VetorRandom + #778, #6
static VetorRandom + #779, #23
static VetorRandom + #780, #19
static VetorRandom + #781, #24
static VetorRandom + #782, #17
static VetorRandom + #783, #14
static VetorRandom + #784, #21
static VetorRandom + #785, #10
static VetorRandom + #786, #2
static VetorRandom + #787, #15
static VetorRandom + #788, #15
static VetorRandom + #789, #3
static VetorRandom + #790, #0
static VetorRandom + #791, #1
static VetorRandom + #792, #14
static VetorRandom + #793, #1
static VetorRandom + #794, #24
static VetorRandom + #795, #2
static VetorRandom + #796, #6
static VetorRandom + #797, #16
static VetorRandom + #798, #12
static VetorRandom + #799, #17
static VetorRandom + #800, #26
static VetorRandom + #801, #19
static VetorRandom + #802, #25
static VetorRandom + #803, #21
static VetorRandom + #804, #3
static VetorRandom + #805, #24
static VetorRandom + #806, #22
static VetorRandom + #807, #13
static VetorRandom + #808, #14
static VetorRandom + #809, #10
static VetorRandom + #810, #22
static VetorRandom + #811, #25
static VetorRandom + #812, #24
static VetorRandom + #813, #14
static VetorRandom + #814, #9
static VetorRandom + #815, #21
static VetorRandom + #816, #20
static VetorRandom + #817, #10
static VetorRandom + #818, #23
static VetorRandom + #819, #4
static VetorRandom + #820, #5
static VetorRandom + #821, #2
static VetorRandom + #822, #0
static VetorRandom + #823, #15
static VetorRandom + #824, #2
static VetorRandom + #825, #24
static VetorRandom + #826, #3
static VetorRandom + #827, #13
static VetorRandom + #828, #6
static VetorRandom + #829, #12
static VetorRandom + #830, #6
static VetorRandom + #831, #15
static VetorRandom + #832, #1
static VetorRandom + #833, #8
static VetorRandom + #834, #17
static VetorRandom + #835, #2
static VetorRandom + #836, #2
static VetorRandom + #837, #6
static VetorRandom + #838, #21
static VetorRandom + #839, #15
static VetorRandom + #840, #11
static VetorRandom + #841, #0
static VetorRandom + #842, #8
static VetorRandom + #843, #13
static VetorRandom + #844, #3
static VetorRandom + #845, #8
static VetorRandom + #846, #2
static VetorRandom + #847, #10
static VetorRandom + #848, #16
static VetorRandom + #849, #16
static VetorRandom + #850, #22
static VetorRandom + #851, #7
static VetorRandom + #852, #0
static VetorRandom + #853, #5
static VetorRandom + #854, #13
static VetorRandom + #855, #2
static VetorRandom + #856, #4
static VetorRandom + #857, #8
static VetorRandom + #858, #10
static VetorRandom + #859, #15
static VetorRandom + #860, #23
static VetorRandom + #861, #17
static VetorRandom + #862, #11
static VetorRandom + #863, #9
static VetorRandom + #864, #17
static VetorRandom + #865, #0
static VetorRandom + #866, #8
static VetorRandom + #867, #3
static VetorRandom + #868, #25
static VetorRandom + #869, #3
static VetorRandom + #870, #24
static VetorRandom + #871, #9
static VetorRandom + #872, #10
static VetorRandom + #873, #15
static VetorRandom + #874, #8
static VetorRandom + #875, #21
static VetorRandom + #876, #26
static VetorRandom + #877, #0
static VetorRandom + #878, #24
static VetorRandom + #879, #16
static VetorRandom + #880, #13
static VetorRandom + #881, #14
static VetorRandom + #882, #18
static VetorRandom + #883, #6
static VetorRandom + #884, #22
static VetorRandom + #885, #5
static VetorRandom + #886, #15
static VetorRandom + #887, #14
static VetorRandom + #888, #26
static VetorRandom + #889, #25
static VetorRandom + #890, #17
static VetorRandom + #891, #25
static VetorRandom + #892, #21
static VetorRandom + #893, #2
static VetorRandom + #894, #5
static VetorRandom + #895, #24
static VetorRandom + #896, #22
static VetorRandom + #897, #18
static VetorRandom + #898, #2
static VetorRandom + #899, #24
static VetorRandom + #900, #18
static VetorRandom + #901, #1
static VetorRandom + #902, #14
static VetorRandom + #903, #17
static VetorRandom + #904, #18
static VetorRandom + #905, #22
static VetorRandom + #906, #14
static VetorRandom + #907, #12
static VetorRandom + #908, #3
static VetorRandom + #909, #13
static VetorRandom + #910, #17
static VetorRandom + #911, #23
static VetorRandom + #912, #23
static VetorRandom + #913, #3
static VetorRandom + #914, #18
static VetorRandom + #915, #8
static VetorRandom + #916, #19
static VetorRandom + #917, #13
static VetorRandom + #918, #16
static VetorRandom + #919, #18
static VetorRandom + #920, #17
static VetorRandom + #921, #21
static VetorRandom + #922, #16
static VetorRandom + #923, #1
static VetorRandom + #924, #24
static VetorRandom + #925, #9
static VetorRandom + #926, #12
static VetorRandom + #927, #12
static VetorRandom + #928, #4
static VetorRandom + #929, #20
static VetorRandom + #930, #5
static VetorRandom + #931, #25
static VetorRandom + #932, #15
static VetorRandom + #933, #23
static VetorRandom + #934, #19
static VetorRandom + #935, #13
static VetorRandom + #936, #19
static VetorRandom + #937, #2
static VetorRandom + #938, #10
static VetorRandom + #939, #7
static VetorRandom + #940, #24
static VetorRandom + #941, #9
static VetorRandom + #942, #2
static VetorRandom + #943, #11
static VetorRandom + #944, #21
static VetorRandom + #945, #12
static VetorRandom + #946, #23
static VetorRandom + #947, #8
static VetorRandom + #948, #26
static VetorRandom + #949, #12
static VetorRandom + #950, #25
static VetorRandom + #951, #24
static VetorRandom + #952, #10
static VetorRandom + #953, #23
static VetorRandom + #954, #26
static VetorRandom + #955, #11
static VetorRandom + #956, #9
static VetorRandom + #957, #0
static VetorRandom + #958, #3
static VetorRandom + #959, #17
static VetorRandom + #960, #0
static VetorRandom + #961, #26
static VetorRandom + #962, #18
static VetorRandom + #963, #2
static VetorRandom + #964, #7
static VetorRandom + #965, #9
static VetorRandom + #966, #14
static VetorRandom + #967, #13
static VetorRandom + #968, #0
static VetorRandom + #969, #23
static VetorRandom + #970, #11
static VetorRandom + #971, #1
static VetorRandom + #972, #18
static VetorRandom + #973, #3
static VetorRandom + #974, #11
static VetorRandom + #975, #22
static VetorRandom + #976, #3
static VetorRandom + #977, #23
static VetorRandom + #978, #15
static VetorRandom + #979, #3
static VetorRandom + #980, #17
static VetorRandom + #981, #21
static VetorRandom + #982, #0
static VetorRandom + #983, #26
static VetorRandom + #984, #21
static VetorRandom + #985, #14
static VetorRandom + #986, #17
static VetorRandom + #987, #9
static VetorRandom + #988, #20
static VetorRandom + #989, #25
static VetorRandom + #990, #9
static VetorRandom + #991, #13
static VetorRandom + #992, #12
static VetorRandom + #993, #19
static VetorRandom + #994, #26
static VetorRandom + #995, #23
static VetorRandom + #996, #0
static VetorRandom + #997, #5
static VetorRandom + #998, #16
static VetorRandom + #999, #23
static VetorRandom + #1000, #3
static VetorRandom + #1001, #5
static VetorRandom + #1002, #19
static VetorRandom + #1003, #0
static VetorRandom + #1004, #4
static VetorRandom + #1005, #1
static VetorRandom + #1006, #2
static VetorRandom + #1007, #3
static VetorRandom + #1008, #26
static VetorRandom + #1009, #23
static VetorRandom + #1010, #25
static VetorRandom + #1011, #25
static VetorRandom + #1012, #22
static VetorRandom + #1013, #26
static VetorRandom + #1014, #0
static VetorRandom + #1015, #23
static VetorRandom + #1016, #21
static VetorRandom + #1017, #8
static VetorRandom + #1018, #6
static VetorRandom + #1019, #3
static VetorRandom + #1020, #24
static VetorRandom + #1021, #25
static VetorRandom + #1022, #9
static VetorRandom + #1023, #4


TelaInicial00: string ".______________________________________."
TelaInicial01: string "|                                      |"
TelaInicial02: string "|                                      |"
TelaInicial03: string "|                                      |"
TelaInicial04: string "|                                      |"
TelaInicial05: string "|                                      |"
TelaInicial06: string "|                                      |"
TelaInicial07: string "|                                      |"
TelaInicial08: string "|                                      |"
TelaInicial09: string "|                                      |"
TelaInicial10: string "|                                      |"
TelaInicial11: string "|                                      |"
TelaInicial12: string "|                                      |"
TelaInicial13: string "|                                      |"
TelaInicial14: string "|                                      |"
TelaInicial15: string "|                                      |"
TelaInicial16: string "|                                      |"
TelaInicial17: string "|                                      |"
TelaInicial18: string "|                                      |"
TelaInicial19: string "|                                      |"
TelaInicial20: string "|                                      |"
TelaInicial21: string "|                                      |"
TelaInicial22: string "|                                      |"
TelaInicial23: string "|                                      |"
TelaInicial24: string "|                                      |"
TelaInicial25: string "|                                      |"
TelaInicial26: string "|                                      |"
TelaInicial27: string "|                                      |"
TelaInicial28: string "|                                      |"
TelaInicial29: string "|______________________________________|"






TelaPosColisao00: string "                                        "
TelaPosColisao01: string "                                        "
TelaPosColisao02: string "                                        "
TelaPosColisao03: string "                                        "
TelaPosColisao04: string "                                        "
TelaPosColisao05: string "                                        "
TelaPosColisao06: string "                                        "
TelaPosColisao07: string "                                        "
TelaPosColisao08: string "                                        "
TelaPosColisao09: string "                                        "
TelaPosColisao10: string "                                        "
TelaPosColisao11: string "                                        "
TelaPosColisao12: string "          AAAAAH, VOCE COLIDIU          "
TelaPosColisao13: string "                                        "
TelaPosColisao14: string "            PONTUACAO:                  "
TelaPosColisao15: string "                                        "
TelaPosColisao16: string "     DESEJA JOGAR NOVAMENTE?  <Y/N>     "
TelaPosColisao17: string "                                        "
TelaPosColisao18: string "                                        "
TelaPosColisao19: string "                                        "
TelaPosColisao20: string "                                        "
TelaPosColisao21: string "                                        "
TelaPosColisao22: string "                                        "
TelaPosColisao23: string "                                        "
TelaPosColisao24: string "                                        "
TelaPosColisao25: string "                                        "
TelaPosColisao26: string "                                        "
TelaPosColisao27: string "                                        "
TelaPosColisao28: string "                                        "
TelaPosColisao29: string "                                        "


TelaAgradecimento00: string "                                        "
TelaAgradecimento01: string "                                        "
TelaAgradecimento02: string "                                        "
TelaAgradecimento03: string "                                        "
TelaAgradecimento04: string "                                        "
TelaAgradecimento05: string "                                        "
TelaAgradecimento06: string "                                        "
TelaAgradecimento07: string "                                        "
TelaAgradecimento08: string "                                        "
TelaAgradecimento09: string "                                        "
TelaAgradecimento10: string "                                        "
TelaAgradecimento11: string "                                        "
TelaAgradecimento12: string "        MUITO OBRIGADO POR JOGAR        "
TelaAgradecimento13: string "                                        "
TelaAgradecimento14: string "        ESPERO QUE TENHA GOSTADO        "
TelaAgradecimento15: string "                                        "
TelaAgradecimento16: string "                                        "
TelaAgradecimento17: string "                                        "
TelaAgradecimento18: string "                                        "
TelaAgradecimento19: string "                                        "
TelaAgradecimento20: string "                                        "
TelaAgradecimento21: string "                                        "
TelaAgradecimento22: string "                                        "
TelaAgradecimento23: string "                                        "
TelaAgradecimento24: string "                                        "
TelaAgradecimento25: string "                                        "
TelaAgradecimento26: string "                                        "
TelaAgradecimento27: string "                                        "
TelaAgradecimento28: string "                                        "
TelaAgradecimento29: string "                                        "

Score: string "Score: "

Main:
	call ResetPontuacao
	call ResetPassaro
	loadn r0, #38
	store CanoPos, r0

	loadn r1, #TelaInicial00
	loadn r2, #1024 ; Cor azul
	call ImprimeTela
	
	MainLoop:
		call CalculaPassaroPos
		call CalculaCanoPos
		
		call ImprimePassaro
		call ImprimeCano
		call ImprimePontuacao
		
		call VerificaColisao
		call Delay
		
		jmp MainLoop
	
GameOver:
	push r0
	push r1
	push r2
	push r3
	
	loadn r1, #TelaPosColisao00
	loadn r2, #1792 ; Cor prata
	call ImprimeTela
	loadn r0, #584 ; Define a posicao certa para o score
	call ImprimeScore
	
	GameOverLoop:
		loadn r0, #255
		loadn r1, #'y'
		loadn r2, #'n'
		
		inchar r3
		
		call CalculaCanoPos
		
		cmp r1, r3
		jeq Main
		
		cmp r2, r3
		jeq GameOverExit
		
		cmp r0, r3
		jeq GameOverLoop
		
		jmp GameOverLoop
	
	GameOverExit:
		loadn r1, #TelaAgradecimento00
		loadn r2, #1792 ; Cor prata
		call ImprimeTela
		halt

ResetPassaro:
	push r0
	
	loadn r0, #530
	store PassaroPos, r0
	store PassaroPos2, r0
	
	pop r0
	rts
	
ResetPontuacao:
	push r0
	
	loadn r0, #0
	store Pontuacao, r0
	
	pop r0
	rts
	
VerificaColisao:
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6
	push r7
	
	load r0, PassaroPos
	loadn r1, #1159
	
	cmp r0, r1
	jeg GameOver
	
	load r1, CanoPos
	loadn r2, #40
	div r3, r0, r2 ; R3 = linha do passaro
	mod r2, r0, r2 ; R2 = coluna passaro
	
	cmp r2, r1
	jeq VerificaColisaoVertical
	
	jmp VerificaColisaoNoHit
	
	VerificaColisaoVertical:
		load r4, CanoTopo ; R4 = Linha do topo do cano
		loadn r5, #4
		add r5, r5, r4 ; R5 = Linha da base do cano
		
		cmp r3, r4
		jle GameOver
		
		cmp r3, r5
		jgr GameOver
		
		load r0, Pontuacao
		inc r0
		store Pontuacao, r0
		
	VerificaColisaoNoHit:
	pop r7
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts
	
ImprimeCano:
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6
	push r7
	
	load r0, CanoPos ; Representa a coluna que vai ser impressa
	loadn r1, #1; Linha de impressao
	load r2, CanoTopo ; Linha do topo do gap
	loadn r3, #4
	add r3, r2, r3 ; Linha do base do gap
	loadn r4, #29
	
	ImprimeCanoLoop:
		cmp r1, r2
		jle ImprimeCanoCelula
		
		cmp r1, r4
		jeg ImprimeCanoSai
		
		cmp r1, r3
		jgr ImprimeCanoCelula
		
		inc r1
		
		jmp ImprimeCanoLoop
		
	ImprimeCanoCelula:
		push r2
		push r3
		push r4
		push r5
		push r6
		push r7
		
		; Imprime atual
		; Limpa anterior se nao for parede
		; Incrementa a linha
		
		loadn r2, #'}'
		loadn r3, #40
		mul r3, r3, r1
		add r3, r3, r0
		loadn r6, #512
		add r2, r6, r2
		outchar r2, r3
		
		loadn r2, #' '
		
		; r5 = coluna atual
		loadn r4, #40
		mod r5, r3, r4
		
		loadn r7, #1
		cmp r7, r5
		jeq LastPosCase
		
		inc r3 ; Vai para a celula da direita
		
		; Calcula a coluna da celula atual
		loadn r4, #40
		mod r5, r3, r4
		
		loadn r4, #39 ; Define para comparacao com coluna atual
		
		cmp r5, r4
		jeq PularCelula
		
		
		NotLastCase:
		outchar r2, r3
		jmp PularCelula
		
		LastPosCase:
		outchar r2, r3
		inc r3
		jmp NotLastCase
		
		
			
		PularCelula:
		
		inc r1
		
		pop r7
		pop r6
		pop r5
		pop r4
		pop r3
		pop r2
		jmp ImprimeCanoLoop
		
	ImprimeCanoSai:
		pop r7
		pop r6
		pop r5
		pop r4
		pop r3
		pop r2
		pop r1
		pop r0
		rts
		
CalculaCanoPos:
	push r0
	push r1
	push r2
	push r3
	
	load r0, CanoPos
	dec r0
	
	loadn r1, #0
	
	cmp r0, r1
	jne CalculaCanoPosSai
	
	loadn r0, #38
	
	load r1, VetorRandomIndex
	loadn r2, #VetorRandom
	add r2, r2, r1
	
	loadi r3, r2
	store CanoTopo, r3
	
	inc r1
	loadn r2, #1024
	mod r1, r1, r2
	store VetorRandomIndex, r1
	
	CalculaCanoPosSai:
	store CanoPos, r0
	pop r3
	pop r2
	pop r1
	pop r0
	rts

CalculaPassaroPos:
	push r0
	push r1
	push r2
	
	load r0, PassaroPos
	mov r1, r0   ; PassaroPos2 = PassaroPos
	store PassaroPos2, r1
	
	; If inchar = ' '
	loadn r1, #' '
	inchar r2
	cmp r1, r2
	
	; If True
	jeq CalculaPassaroPosFlap
	
	; If False
	loadn r1, #40
	add r0, r0, r1
	store PassaroPos, r0
	
	jmp CalculaPassaroPosSai
	
	CalculaPassaroPosFlap:
		loadn r1, #120
		loadn r2, #39
		sub r0, r0, r1
		cmp r0, r2
		jel CalculaPassaroPosSai
		store PassaroPos, r0
		jmp CalculaPassaroPosSai
	
	CalculaPassaroPosSai:
		pop r2
		pop r1
		pop r0
		rts
		
Delay:
    push r0
    push r1
    push r2
    
    loadn r2, #0         ; Valor zero para comparação 
    loadn r0, #100      ; Contador externo (aumentado para 1000)
	    
	Delay1:
	    dec r0               ; Decrementa o contador externo
	    loadn r1, #1000      ; Contador interno (aumentado para 1000)
	    
	Delay2:
	    dec r1               ; Decrementa o contador interno
	    cmp r1, r2           ; Verifica se r1 chegou a zero
	    jne Delay2           ; Continua até que r1 seja 0
	    
	    cmp r0, r2           ; Verifica se r0 chegou a zero
	    jne Delay1           ; Continua até que r0 seja 0
	    
    pop r2
    pop r1
    pop r0
    rts   

ImprimePassaro:
	push r0	; protege o r0 na pilha para preservar seu valor
	push r1	; protege o r1 na pilha para preservar seu valor
	push r2	; protege o r1 na pilha para preservar seu valor
	
	loadn r1, #'{'
	loadn r2, #2816
	add r1, r1, r2
	load r0, PassaroPos
	outchar r1, r0
	
	loadn r1, #' '
	load r0, PassaroPos2
	outchar r1, r0
	
	pop r2
	pop r1
	pop r0
	rts
	
ImprimeTela: ;			r0 = endereco onde comeca a menssagem
	push r0	; protege o r0 na pilha para preservar seu valor
	push r1	; protege o r1 na pilha para preservar seu valor
	push r2	; protege o r1 na pilha para preservar seu valor
	push r3	; protege o r3 na pilha para ser usado na subrotina
	push r4	; protege o r4 na pilha para ser usado na subrotina
	push r5

	loadn r0, #0 ; guarda no r0 a posição onde escrever a string para acertar o parametro da subrotina ImprimeStr
	loadn r3, #40 ; valor para descer pra proxima linha da tela
	loadn r4, #41 ; valor para descer para proxima linha da memoria
	loadn r5, #1200 ; criterio de parada da impressao
	
	ImprimeTelaLoop:
		cmp r0, r5
		jeq ImprimeTelaSai
		call ImprimeStr
		add r0, r3, r0
		add r1, r4, r1
		jmp ImprimeTelaLoop
	
	ImprimeTelaSai:
		pop r5
		pop r4	; Resgata os valores dos registradores utilizados na Subrotina da Pilha
		pop r3
		pop r2
		pop r1
		pop r0
		rts

ImprimeStr:	;  Rotina de Impresao de Mensagens:    r0 = Posicao da tela que o primeiro caractere da mensagem sera' impresso;  r1 = endereco onde comeca a mensagem; r2 = cor da mensagem.   Obs: a mensagem sera' impressa ate' encontrar "/0"
	push r0	; protege o r0 na pilha para preservar seu valor
	push r1	; protege o r1 na pilha para preservar seu valor
	push r2	; protege o r1 na pilha para preservar seu valor
	push r3	; protege o r3 na pilha para ser usado na subrotina
	push r4	; protege o r4 na pilha para ser usado na subrotina
	
	loadn r3, #'\0'	; Criterio de parada

	ImprimeStrLoop:	
	loadi r4, r1
	cmp r4, r3
	jeq ImprimeStrSai
	add r4, r2, r4
	outchar r4, r0
	inc r0
	inc r1
	jmp ImprimeStrLoop
	
	ImprimeStrSai:	
	pop r4	; Resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r3
	pop r2
	pop r1
	pop r0
	rts

ImprimePontuacao:
	push r0
	push r1
	push r2
	
	loadn r0, #41 ; Local de escrita de "Score: "
	loadn r1, #Score
	loadn r2, #0
	call ImprimeStr
	
	loadn r0, #48
	Call ImprimeScore
	
	pop r2
	pop r1
	pop r0
	rts 

ImprimeScore:
	;loadn r0, #584		; Primeira posicao do score
	load r1, Pontuacao
	loadn r2, #1000		; Para pegar primeiro digito da pontuacao
	div r3, r1, r2		; Se pontuacao for mais de 1000 da 1, se nao da 0

	call BuscaCaracter
	outchar r4, r0
	
	inc r0
	load r1, Pontuacao
	
	loadn r2, #1000		; Para eliminar o primeiro digito
	mod r1, r1, r2
	
	loadn r2, #100		; Para pegar o segundo digito
	div r3, r1, r2		; Se pontuacao for mais de 1000 da 1, se nao da 0

	call BuscaCaracter
	outchar r4, r0
	
	inc r0
	load r1, Pontuacao
	
	loadn r2, #100		; Para eliminar o primeiro digito
	mod r1, r1, r2
	
	loadn r2, #10		; Para pegar o segundo digito
	div r3, r1, r2		; Se pontuacao for mais de 1000 da 1, se nao da 0

	call BuscaCaracter
	outchar r4, r0
	
	inc r0
	load r1, Pontuacao
	
	loadn r2, #10		; Para eliminar o primeiro digito
	mod r1, r1, r2
	
	loadn r2, #1		; Para pegar o segundo digito
	div r3, r1, r2		; Se pontuacao for mais de 1000 da 1, se nao da 0

	call BuscaCaracter
	outchar r4, r0
	
	rts
	
BuscaCaracter:
	BuscaCase_0:
		loadn r4, #0
		cmp r3, r4
		jne BuscaCase_1
		loadn r4, #'0'
		rts
		
	BuscaCase_1:
		loadn r4, #1
		cmp r3, r4
		jne BuscaCase_2
		loadn r4, #'1'
		rts
	
	BuscaCase_2:
		loadn r4, #2
		cmp r3, r4
		jne BuscaCase_3
		loadn r4, #'2'
		rts
	
	BuscaCase_3:
		loadn r4, #3
		cmp r3, r4
		jne BuscaCase_4
		loadn r4, #'3'
		rts
	
	BuscaCase_4:
		loadn r4, #4
		cmp r3, r4
		jne BuscaCase_5
		loadn r4, #'4'
		rts
	
	BuscaCase_5:
		loadn r4, #5
		cmp r3, r4
		jne BuscaCase_6
		loadn r4, #'5'
		rts
		
	BuscaCase_6:
		loadn r4, #6
		cmp r3, r4
		jne BuscaCase_7
		loadn r4, #'6'
		rts
		
	BuscaCase_7:
		loadn r4, #7
		cmp r3, r4
		jne BuscaCase_8
		loadn r4, #'7'
		rts
		
	BuscaCase_8:
		loadn r4, #8
		cmp r3, r4
		jne BuscaCase_9
		loadn r4, #'8'
		rts

	BuscaCase_9:
		loadn r4, #'9'	; Se chegou aqui como certeza eh esse
		rts
		