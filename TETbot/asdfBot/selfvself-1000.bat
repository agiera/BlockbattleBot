FOR /L %%G IN (1,1,100000) DO (
    java -cp . com.theaigames.blockbattle.Blockbattle "python BotRun1.py" "python BotRun2.py" 2>err.txt 1>out.txt
)
