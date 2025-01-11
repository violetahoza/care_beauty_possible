<?php
require_once '../config.php';

class Login extends DBConnection {
    private static $instance = null; // Singleton instance
    private $settings;

    // Private constructor to prevent direct instantiation
    private function __construct() {
        global $_settings;
        $this->settings = $_settings;
        parent::__construct();
        ini_set('display_error', 1);
    }

    // Singleton method to ensure only one instance of Login exists
    public static function getInstance() {
        if (self::$instance === null) {
            self::$instance = new Login();
        }
        return self::$instance;
    }

    // Destructor to clean up resources
    public function __destruct() {
        parent::__destruct();
    }

    // Default action, shows an access denied message
    public function index() {
        echo "<h1>Access Denied</h1> <a href='" . base_url . "'>Go Back.</a>";
    }

    // Login method for admin users
    public function login() {
        extract($_POST);
        
        // Prepare the SQL statement
        $stmt = $this->conn->prepare("SELECT * FROM users WHERE username = ? AND password = ?");
        $password = md5($password); // Encrypt password
        $stmt->bind_param('ss', $username, $password);
        $stmt->execute();
        $result = $stmt->get_result();

        // Check if the user exists
        if ($result->num_rows > 0) {
            foreach ($result->fetch_array() as $k => $v) {
                if (!is_numeric($k) && $k != 'password') {
                    $this->settings->set_userdata($k, $v);
                }
            }
            $this->settings->set_userdata('login_type', 1);
            return json_encode(array('status' => 'success'));
        } else {
            return json_encode(array('status' => 'incorrect', 'last_qry' => "SELECT * FROM users WHERE username = '$username' AND password = md5('$password') "));
        }
    }

    // Logout method for admin users
    public function logout() {
        if ($this->settings->sess_des()) {
            redirect('admin/login.php');
        }
    }

    // Login method for client users
    public function login_user() {
        extract($_POST);

        // Prepare the SQL statement for clients
        $stmt = $this->conn->prepare("SELECT * FROM clients WHERE email = ? AND password = ? AND delete_flag = 0 ");
        $password = md5($password); // Encrypt password
        $stmt->bind_param('ss', $email, $password);
        $stmt->execute();
        $result = $stmt->get_result();

        // Check if the client exists
        if ($result->num_rows > 0) {
            $res = $result->fetch_array();
            if ($res['status'] == 1) {
                foreach ($res as $k => $v) {
                    $this->settings->set_userdata($k, $v);
                }
                $this->settings->set_userdata('login_type', 2);
                $resp['status'] = 'success';
            } else {
                $resp['status'] = 'failed';
                $resp['msg'] = 'Your Account has been blocked.';
            }
        } else {
            $resp['status'] = 'failed';
            $resp['msg'] = 'Incorrect Email or Password';
        }

        if ($this->conn->error) {
            $resp['status'] = 'failed';
            $resp['_error'] = $this->conn->error;
        }
        return json_encode($resp);
    }
}

// Example of using the Singleton pattern to get the instance of Login class
$action = !isset($_GET['f']) ? 'none' : strtolower($_GET['f']);
$auth = Login::getInstance(); // Using the Singleton instance

switch ($action) {
    case 'login':
        echo $auth->login();
        break;
    case 'login_user':
        echo $auth->login_user();
        break;
    case 'logout':
        echo $auth->logout();
        break;
    default:
        echo $auth->index();
        break;
}