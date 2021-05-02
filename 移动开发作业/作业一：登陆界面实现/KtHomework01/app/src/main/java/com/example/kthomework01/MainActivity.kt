package com.example.kthomework01

import android.content.Intent
import android.os.Bundle
import android.view.Gravity
import android.view.View
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import com.example.kthomework01.util.ToastUtil
import kotlinx.android.synthetic.main.activity_main.*
import kotlin.system.exitProcess

class MainActivity : AppCompatActivity() {

    // Kotlin无需控件声明

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        // 实现界面跳转
        button_login.setOnClickListener(this::Login)
        button_exit.setOnClickListener({view-> exitProcess(0)})

    }

    private fun Login(v: View): Unit{
        // 获取用户名与密码
        var username : String = username.getText().toString()
        var passward : String = password.getText().toString()

        //Toast 内容
        val ok = "登录成功"
        val error = "登录名或密码错误"

        // 验证登录名密码
        if ((username == "MuKai" && passward == "123456") || (username == "Guest" && passward == "000000")) {
            // 匹配

            ToastUtil.showMsg(this@MainActivity,ok)
            // 跳转
            var intent: Intent = Intent(this@MainActivity, UserActivity::class.java)
            //传递信息
            intent.putExtra("username", username)
            intent.putExtra("password", passward)
            startActivity(intent)
            exitProcess(0)
        }
        else{
            // 不匹配
            ToastUtil.showMsg(this@MainActivity,error)
        }
    }
}

