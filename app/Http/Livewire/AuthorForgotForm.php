<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Str;

class AuthorForgotForm extends Component
{
    public $email;
    
    public function ForgotHandler(){
        $this->validate([
            'email'=>'required|email|exists:users,email'
        ],[
            'email.required'=>'The :attribute is required',
            'email.email'=>'Invalid email address',
            'email.exists'=>'The :attribute is not registered'
        ]);

        $token = base64_encode(Str::random(64));
        DB::table('password_resets')->insert([
            'email'=>$this->email,
            'token'=>$token,
            'created_at'=>Carbon::now(),
        ]);
        $user = User::where('email',$this->email)->first();
        $link = route('author.reset-form',['token'=>$token,'email'=>$this->email]);
        $body_message = "We are received a request to reset the password for <b> mh.ab1214</b> account associated with ". 
        $this->email.".<br> You can reset your password by clicking the button bellow.";
        $body_message.='<br>';
        $body_message.='<a href="'.$link.'"target="_blank" style="color:#FFF;border-color:#22bc64;border-style:solid;
        border-width:10px 180px; background-color:#22bc64;display:inline-block;text-decoration:none;border-radius:3px;
        box-shadow:0 2px 3px rgba(0,0,0,0.16);-webkit-text-size-adjust:none;box-sizing:border-box">Reset Password</a>';
        $body_message.='<br>';
        $body_message.='If you did not request for a password reset, please ignore this email';

        $data = array(
            'name' => $user->name,
            'body_message'=>$body_message,
        );

        // Mail::send('forgot-email-template', $data, function($message) use ($user){
        //     $message->from('noreplay@example.com','Blogpost');
        //     $message->to($user->email, $user->name)
        //     ->subject('Reset Password');
        // });
        $mail_body = view('forgot-email-template', $data)->render();
        
        $mailConfig = array(
            'mail_from_email' => env('EMAIL_FROM_ADDRESS'),
            'mail_from_name' => env('EMAIL_FROM_NAME'),
            'mail_recipient_email' => $user->email,
            'mail_recipient_name' => $user->name,
            'mail_subject' => 'Reset Password',
            'mail_body' => $mail_body
        );

        sendMail($mailConfig);

        $this->email = null;
        session()->flash('success','We have e-mailed your password reset link');
  
    }

    public function render()
    {
        return view('livewire.author-forgot-form');
    }
}
