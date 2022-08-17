# smshop
尚米商城购物系统  
1.基于spring boot框架开发  
2.开发工具idea  
3.Tomcat 9.0.46  
4.MySQL 8.0.25  

思维导图如下：  
![img](https://github.com/StudyQiu/smshop/blob/main/img/%E9%A1%B9%E7%9B%AE%E8%AE%BE%E8%AE%A1%E6%80%9D%E7%BB%B4%E5%AF%BC%E5%9B%BE.png)  
结构如下：  
![img](https://github.com/StudyQiu/smshop/blob/main/img/111.png)  
![img](https://github.com/StudyQiu/smshop/blob/main/img/222.png)  
![img](https://github.com/StudyQiu/smshop/blob/main/img/333.png)  

功能模块如下：  
![img](https://github.com/StudyQiu/smshop/blob/main/img/图片1.png)  
![img](https://github.com/StudyQiu/smshop/blob/main/img/图片2.png)  
![img](https://github.com/StudyQiu/smshop/blob/main/img/图片3.png)  

页面展示如下：  
![img](https://github.com/StudyQiu/smshop/blob/main/img/1.png)  
![img](https://github.com/StudyQiu/smshop/blob/main/img/2.png)  
![img](https://github.com/StudyQiu/smshop/blob/main/img/3.png)  
![img](https://github.com/StudyQiu/smshop/blob/main/img/4.png)  
![img](https://github.com/StudyQiu/smshop/blob/main/img/5.png)  
![img](https://github.com/StudyQiu/smshop/blob/main/img/6.png)  
![img](https://github.com/StudyQiu/smshop/blob/main/img/7.png)  
![img](https://github.com/StudyQiu/smshop/blob/main/img/8.png)  
![img](https://github.com/StudyQiu/smshop/blob/main/img/9.png)  
![img](https://github.com/StudyQiu/smshop/blob/main/img/10.png)  
![img](https://github.com/StudyQiu/smshop/blob/main/img/11.png)  
![img](https://github.com/StudyQiu/smshop/blob/main/img/12.png)  
![img](https://github.com/StudyQiu/smshop/blob/main/img/13.png)  
![img](https://github.com/StudyQiu/smshop/blob/main/img/14.png)  
![img](https://github.com/StudyQiu/smshop/blob/main/img/15.png)  
![img](https://github.com/StudyQiu/smshop/blob/main/img/16.png)  
![img](https://github.com/StudyQiu/smshop/blob/main/img/17.png)  
![img](https://github.com/StudyQiu/smshop/blob/main/img/18.png)  
![img](https://github.com/StudyQiu/smshop/blob/main/img/19.png)  
![img](https://github.com/StudyQiu/smshop/blob/main/img/20.png)  
![img](https://github.com/StudyQiu/smshop/blob/main/img/21.png)  
![img](https://github.com/StudyQiu/smshop/blob/main/img/22.png)  

项目的不足：  
写项目的时候是从后台页面开始写的，没有考虑到前台页面的用户登录和游客访问，导致路径有点乱。  
其次，由于写项目的时候考虑到的东西较少，所以导致白写了一些繁琐没用的代码。  
最后，由于某些原因，我有些方法是直接从Mapper层调用的，没有经过Service的实现类。  
还有一个就是不支持多页面打开，不然游客和用户登录session销毁后会出错。  

项目启动的路径：  
后台登录：http://localhost:8081/  
前台登录：http://localhost:8081/web  
前台页面：http://localhost:8081/toIndex/0
