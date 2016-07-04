wmic ENVIRONMENT where "name='HOME'" delete
wmic ENVIRONMENT create name='HOME',username="<system>",VariableValue="D:\HOME"
