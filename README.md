# ZPHideNavigationBar
本Demo主要介绍视图控制器中两种导航栏隐藏的方法(original)。

隐藏视图控制器的导航栏有如下的两种方法：
 1、在viewWillAppear方法中撰写"[self.navigationController setNavigationBarHidden:YES animated:animated];"代码，并且同时需要在viewWillDisappear方法中撰写"[self.navigationController setNavigationBarHidden:NO animated:animated];"代码；
 2、需要实现<UINavigationControllerDelegate>协议，并且实现协议里面相应的方法。
 
 本Demo主要介绍上述的两种隐藏导航栏的方法分别在什么情况下使用。
