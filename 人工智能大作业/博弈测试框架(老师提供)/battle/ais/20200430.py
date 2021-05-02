# ai.py
# coding = UTF-8
__version__ = "5.0"

listAI = []
listHuman = []
listAIAndHuman = []
list_all = []
next_point = [0, 0] # AI下一步最应该下的位置
COLUMN = 15
ROW = 15
DEPTH = 2
shape_score = [(50, (0, 1, 1, 0, 0)),
          (50, (0, 0, 1, 1, 0)),
          (200, (1, 1, 0, 1, 0)),
          (500, (0, 0, 1, 1, 1)),
          (500, (1, 1, 1, 0, 0)),
          (5000, (0, 1, 1, 1, 0)),
          (5000, (0, 1, 0, 1, 1, 0)),
          (5000, (0, 1, 1, 0, 1, 0)),
          (5000, (1, 1, 1, 0, 1)),
          (5000, (1, 1, 0, 1, 1)),
          (5000, (1, 0, 1, 1, 1)),
          (5000, (1, 1, 1, 1, 0)),
          (5000, (0, 1, 1, 1, 1)),
          (50000, (0, 1, 1, 1, 1, 0)),
          (99999999, (1, 1, 1, 1, 1))]

def ai(listAI, listHuman, list_all):
  """
  AI计算落子位置
  """
  if len(listHuman) == 0:
      next_point[0] = 7
      next_point[1] = 7
  else:
      #listAI = listai
      #listHuman = listhuman
      for i in range(len(listAI)):
       listAIAndHuman.append(listAI[i])
      for i in range(len(listHuman)):
       listAIAndHuman.append(listHuman[i])
  maxmin(True, DEPTH, -99999999, 99999999, listAI, listHuman, listAIAndHuman, list_all)
  return next_point[0], next_point[1]
  
  
def maxmin(is_ai, depth, alpha, beta, listAI, listHuman, listAIAndHuman, list_all):
  """
  负值极大算法搜索 alpha + beta剪枝
  """
  #listAI = listai
  #listHuman = listhuman
  #listAIAndHuman = listaiandhuman
  #list_all = listall
  # 游戏是否结束 | | 探索的递归深度是否到边界
  if game_win(listAI) or game_win(listHuman) or depth == 0:
    #print("game over")
    return evaluation(is_ai, listAI, listHuman)
  
  blank_list = list(set(list_all).difference(set(listAIAndHuman)))#返回在list_all 中但是不在listAIAndHuman中的点，即剩下的空点 
  order(blank_list, listAIAndHuman) # 搜索顺序排序 提高剪枝效率

  # 遍历每一个候选步
  for next_step in blank_list[0:225]:
  
    # 如果要评估的位置没有相邻的子， 则不去评估 减少计算
    if not has_neightnor(next_step, listAIAndHuman):
      continue
  
    if is_ai:
      listAI.append(next_step)
    else:
      listHuman.append(next_step)
    listAIAndHuman.append(next_step)

    #print("break point 1")

    value = -maxmin(not is_ai, depth - 1, -beta, -alpha, listAI, listHuman, listAIAndHuman, list_all)
    if is_ai:
      listAI.remove(next_step)
    else:
      listHuman.remove(next_step)
    listAIAndHuman.remove(next_step)
  
    if value > alpha:
      #print("value > alpha")
      if depth == DEPTH:
        next_point[0] = next_step[0]
        next_point[1] = next_step[1]
      # alpha + beta剪枝点
      if value >= beta:
        return beta
      alpha = value
  return alpha
  
  
def order(blank_list, listAIAndHuman):
  #listAIAndHuman = listaiandhuman
  """
  离最后落子的邻居位置最有可能是最优点
  计算最后落子点的8个方向邻居节点
  若未落子，则插入到blank列表的最前端
  :param blank_list: 未落子节点集合
  :return: blank_list
  """
  if len(listAIAndHuman) != 0:

    last_pt = listAIAndHuman[-1]
    # for item in blank_list:
    for i in range(-1, 2):
        for j in range(-1, 2):
            if i == 0 and j == 0:
                continue
            if (last_pt[0] + i, last_pt[1] + j) in blank_list:
                blank_list.remove((last_pt[0] + i, last_pt[1] + j))
                blank_list.insert(0, (last_pt[0] + i, last_pt[1] + j))
  
  
def has_neightnor(pt, listAIAndHuman):
  #listAIAndHuman = listaiandhuman
  """
  判断是否有邻居节点
  :param pt: 待评测节点
  :return:
  """
  for i in range(-1, 2):
    for j in range(-1, 2):
      if i == 0 and j == 0:
        continue
      if (pt[0] + i, pt[1] + j) in listAIAndHuman:
        return True
  return False
  
  
def evaluation(is_ai, listAI, listHuman):
  """
  评估函数
  """
  if is_ai:
    my_list = listAI
    enemy_list = listHuman
  else:
    my_list = listHuman
    enemy_list = listAI
  # 算自己的得分
  score_all_arr = [] # 得分形状的位置 用于计算如果有相交 得分翻倍
  my_score = 0
  for pt in my_list:
    m = pt[0]
    n = pt[1]
    my_score += cal_score(m, n, 0, 1, enemy_list, my_list, score_all_arr)
    my_score += cal_score(m, n, 1, 0, enemy_list, my_list, score_all_arr)
    my_score += cal_score(m, n, 1, 1, enemy_list, my_list, score_all_arr)
    my_score += cal_score(m, n, -1, 1, enemy_list, my_list, score_all_arr)
  # 算敌人的得分， 并减去
  score_all_arr_enemy = []
  enemy_score = 0
  for pt in enemy_list:
    m = pt[0]
    n = pt[1]
    enemy_score += cal_score(m, n, 0, 1, my_list, enemy_list, score_all_arr_enemy)
    enemy_score += cal_score(m, n, 1, 0, my_list, enemy_list, score_all_arr_enemy)
    enemy_score += cal_score(m, n, 1, 1, my_list, enemy_list, score_all_arr_enemy)
    enemy_score += cal_score(m, n, -1, 1, my_list, enemy_list, score_all_arr_enemy)
  
  total_score = my_score - enemy_score * 0.1
  return total_score
  
  
def cal_score(m, n, x_decrict, y_derice, enemy_list, my_list, score_all_arr):
  """
  每个方向上的分值计算
  :param m:
  :param n:
  :param x_decrict:
  :param y_derice:
  :param enemy_list:
  :param my_list:
  :param score_all_arr:
  :return:
  """
  add_score = 0 # 加分项
  # 在一个方向上， 只取最大的得分项
  max_score_shape = (0, None)
  
  # 如果此方向上，该点已经有得分形状，不重复计算
  for item in score_all_arr:
    for pt in item[1]:
      if m == pt[0] and n == pt[1] and x_decrict == item[2][0] and y_derice == item[2][1]:
        return 0
  
  # 在落子点 左右方向上循环查找得分形状
  for offset in range(-5, 1):
    # offset = -2
    pos = []
    for i in range(0, 6):
      if (m + (i + offset) * x_decrict, n + (i + offset) * y_derice) in enemy_list:
        pos.append(2)
      elif (m + (i + offset) * x_decrict, n + (i + offset) * y_derice) in my_list:
        pos.append(1)
      else:
        pos.append(0)
    tmp_shap5 = (pos[0], pos[1], pos[2], pos[3], pos[4])
    tmp_shap6 = (pos[0], pos[1], pos[2], pos[3], pos[4], pos[5])
  
    for (score, shape) in shape_score:
      if tmp_shap5 == shape or tmp_shap6 == shape:
        if score > max_score_shape[0]:
          max_score_shape = (score, ((m + (0 + offset) * x_decrict, n + (0 + offset) * y_derice),
                        (m + (1 + offset) * x_decrict, n + (1 + offset) * y_derice),
                        (m + (2 + offset) * x_decrict, n + (2 + offset) * y_derice),
                        (m + (3 + offset) * x_decrict, n + (3 + offset) * y_derice),
                        (m + (4 + offset) * x_decrict, n + (4 + offset) * y_derice)),
                    (x_decrict, y_derice))
  
  # 计算两个形状相交， 如两个3活 相交， 得分增加 一个子的除外
  if max_score_shape[1] is not None:
    for item in score_all_arr:
      for pt1 in item[1]:
        for pt2 in max_score_shape[1]:
          if pt1 == pt2 and max_score_shape[0] > 10 and item[0] > 10:
            add_score += item[0] + max_score_shape[0]
  
    score_all_arr.append(max_score_shape)
  
  return add_score + max_score_shape[0]
  
  
def game_win(list):
  """
  胜利条件判断
  """
  for m in range(COLUMN):
    for n in range(ROW):
      if n < ROW - 4 and (m, n) in list and (m, n + 1) in list and (m, n + 2) in list and (
           m, n + 3) in list and (m, n + 4) in list:
         return True
      elif m < ROW - 4 and (m, n) in list and (m + 1, n) in list and (m + 2, n) in list and (
           m + 3, n) in list and (m + 4, n) in list:
         return True
      elif m < ROW - 4 and n < ROW - 4 and (m, n) in list and (m + 1, n + 1) in list and (
           m + 2, n + 2) in list and (m + 3, n + 3) in list and (m + 4, n + 4) in list:
         return True
      elif m < ROW - 4 and n > 3 and (m, n) in list and (m + 1, n - 1) in list and (
           m + 2, n - 2) in list and (m + 3, n - 3) in list and (m + 4, n - 4) in list:
         return True
  return False

