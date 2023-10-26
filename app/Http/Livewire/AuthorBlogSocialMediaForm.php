<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\Models\BlogSocialMedia;

class AuthorBlogSocialMediaForm extends Component
{

    public $blog_social_media;

    public $facebook_url, $instagram_url, $youtube_url, $linkedin_url;

    public function mount(){
        $this->blog_social_media = BlogSocialMedia::find(1);
        $this->facebook_url = $this->blog_social_media->bsm_facebook;
        $this->instagram_url = $this->blog_social_media->bsm_instagram;
        $this->youtube_url = $this->blog_social_media->bsm_youtube;
        $this->linkedin_url = $this->blog_social_media->bsm_linkedin;
    }

    public function updateBlogSocialMedia(){
        $this->validate([
            'facebook_url'=>'nullable|url',
            'instagram_url'=>'nullable|url',
            'youtube_url'=>'nullable|url',
            'linkedin_url'=>'nullable|url',
        ]);

        $update = $this->blog_social_media->update([
            'bsm_facebook'=>$this->facebook_url,
            'bsm_instagram'=>$this->instagram_url,
            'bsm_youtube'=>$this->youtube_url,
            'bsm_linkedin'=>$this->linkedin_url,
        ]);

        if($update){
            $this->showToastr('Blog Social Media have been successfully updated.','success');
        }else{
            $this->showToastr('Something went wrong!','error');
        }
    }

    public function showToastr($message, $type){
        return $this->dispatchBrowserEvent('showToastr',[
            'type'=>$type,
            'message'=>$message,
        ]);
    }

    public function render()
    {
        return view('livewire.author-blog-social-media-form');
    }
}
