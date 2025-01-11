<style>
    #uni_modal .modal-content>.modal-footer,#uni_modal .modal-content>.modal-header{
        display:none;
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
    <div class="card">
        <div class="card-body">
            <div class="row">
                <h3 class="text-center login-box-msg">Create New Account
                    <span class="float-right">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </span>
                </h3>
                <hr>
            </div>
            <div class="row align-items-center h-100">
                <div class="col-lg-5 border-right">
                    <div class="form-group">
                        <label for="" class="control-label">Firstname</label>
                        <input type="text" class="form-control form-control-sm form" name="firstname" required>
                    </div>
                    <div class="form-group">
                        <label for="" class="control-label">Lastname</label>
                        <input type="text" class="form-control form-control-sm form" name="lastname" required>
                    </div>
                    <div class="form-group">
                        <label for="" class="control-label">Contact</label>
                        <input type="text" class="form-control form-control-sm form" name="contact" required>
                    </div>
                    <div class="form-group">
                        <label for="" class="control-label">Gender</label>
                        <select name="gender" id="" class="custom-select select" required>
                            <option>Male</option>
                            <option>Female</option>
                        </select>
                    </div>
                </div>
                <div class="col-lg-7">
                    <div class="form-group">
                        <label for="" class="control-label">Default Delivery Address</label>
                        <textarea class="form-control form" rows='3' name="default_delivery_address"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="" class="control-label">Email</label>
                        <input type="text" class="form-control form-control-sm form" name="email" required>
                    </div>
                    <div class="form-group">
                        <label for="" class="control-label">Password</label>
                        <input type="password" class="form-control form-control-sm form" name="password" required>
                    </div>
                    <div class="form-group d-flex justify-content-between">
                        <a href="javascript:void()" id="login-show">Already have an Account</a>
                        <button class="btn btn-primary btn-flat">Register</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
<script>
    $(function(){
        $('#login-show').click(function(){
            uni_modal("","login.php")
        })
        $('#registration').submit(function(e){
            e.preventDefault();
            start_loader()
            if($('.err-msg').length > 0)
                $('.err-msg').remove();
            $.ajax({
                url:_base_url_+"classes/Master.php?f=register",
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
                        location.reload()
                    }else if(resp.status == 'failed' && !!resp.msg){
                        var _err_el = $('<div>')
                            _err_el.addClass("alert alert-danger err-msg").text(resp.msg)
                        $('[name="password"]').after(_err_el)
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