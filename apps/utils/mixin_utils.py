from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator


class LoginRequiredMixin():
    """
    定义一个基础View,用来被继承。
    用户在点击开始学习后,先判断用户是否登陆,若未登录则跳转到登录页面。
    """
    @method_decorator(login_required(login_url='/login/'))
    def dispatch(self, request, *args, **kwargs):
        return super(LoginRequiredMixin, self).dispatch(request, *args, **kwargs)