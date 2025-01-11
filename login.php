<style>
    #uni_modal .modal-content>.modal-footer,#uni_modal .modal-content>.modal-header{
        display:none;
    }
    .login-box {
        width: 360px;
        margin: 5% auto;
    }
    .card {
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        
    }
    .card-body {
        padding: 2rem;
    }
    .login-box-msg {
        font-size: 1.2em;
        margin-bottom: 1.5rem;
        color: #19784f;
    }
    .form-control {
        border-radius: 5px;
        box-shadow: none;
        border-color: #ddd;
    }
    .input-group-text {
        border-radius: 5px;
        border-color: #ddd;
        background-color: #f8f9fa;
    }
    .btn-primary {
        background-color: #19784f;
        border-color: #19784f;
        border-radius: 5px;
    }
    .btn-primary:hover {
        background-color: #c2eac7;
        border-color: #c2eac7;
    }
    .input-group-text .fas {
        color: #19784f;
    }
    .login-box a {
        color: #19784f;
    }
    .login-box a:hover {
        color: #19784f;
    }
</style>
<div class="container-fluid login-box">
    <div class="card">
        <div class="card-body">
            <div class="row">
                <h3 class="float-right">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </h3>
                <div class="col-lg-12">
                    <h3 class="text-center login-box-msg">Login</h3>
                    <hr>
                    <form action="" id="login-form">
                        <div class="form-group">
                            <label for="" class="control-label">Email</label>
                            <input type="email" class="form-control form" name="email" required>
                        </div>
                        <div class="form-group">
                            <label for="" class="control-label">Password</label>
                            <input type="password" class="form-control form" name="password" required>
                        </div>
                        <div class="form-group d-flex justify-content-between">
                            <a href="javascript:void()" id="create_account">Create Account</a>
                            <button class="btn btn-primary btn-flat">Login</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(function(){
        $('#create_account').click(function(){
            uni_modal("","registration.php","mid-large")
        })
        $('#login-form').submit(function(e){
            e.preventDefault();
            start_loader()
            if($('.err-msg').length > 0)
                $('.err-msg').remove();
            $.ajax({
                url:_base_url_+"classes/Login.php?f=login_user",
                method:"POST",
                data:$(this).serialize(),
                dataType:"json",
                error:err=>{
                    console.log(err)
                    alert_toast("an error occured",'error')
                    end_loader()
                },
                success:function(resp){
                    if(typeof resp == 'object' && resp.status == 'success'){
                        alert_toast("Login Successfully",'success')
                        setTimeout(function(){
                            location.reload()
                        },2000)
                    }else if(!!resp.msg){
                        var _err_el = $('<div>')
                            _err_el.addClass("alert alert-danger err-msg").text(resp.msg)
                        $('#login-form').prepend(_err_el)
                        end_loader()
                        
                    }else{
                        console.log(resp)
                        alert_toast("an error occured",'error')
                        end_loader()
                    }
                }
            })
        })
    })
</script>