Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6E628F413
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 15:58:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7389.19276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT3l2-0001By-EC; Thu, 15 Oct 2020 13:57:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7389.19276; Thu, 15 Oct 2020 13:57:28 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT3l2-0001BZ-AN; Thu, 15 Oct 2020 13:57:28 +0000
Received: by outflank-mailman (input) for mailman id 7389;
 Thu, 15 Oct 2020 13:57:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H3IV=DW=gmail.com=ckoenig.leichtzumerken@srs-us1.protection.inumbo.net>)
 id 1kT3l1-0001BU-0W
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 13:57:27 +0000
Received: from mail-ej1-x643.google.com (unknown [2a00:1450:4864:20::643])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 444ae937-1b94-4f9e-99af-0ca49320a25c;
 Thu, 15 Oct 2020 13:57:26 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id lw21so3762688ejb.6
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 06:57:25 -0700 (PDT)
Received: from [192.168.137.56] (tmo-123-114.customers.d1-online.com.
 [80.187.123.114])
 by smtp.gmail.com with ESMTPSA id i8sm1619354ejg.84.2020.10.15.06.57.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Oct 2020 06:57:24 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=H3IV=DW=gmail.com=ckoenig.leichtzumerken@srs-us1.protection.inumbo.net>)
	id 1kT3l1-0001BU-0W
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 13:57:27 +0000
X-Inumbo-ID: 444ae937-1b94-4f9e-99af-0ca49320a25c
Received: from mail-ej1-x643.google.com (unknown [2a00:1450:4864:20::643])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 444ae937-1b94-4f9e-99af-0ca49320a25c;
	Thu, 15 Oct 2020 13:57:26 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id lw21so3762688ejb.6
        for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 06:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=eqy7Jg2fPCw6JKPfho3FMkiXLNsZ2vOMeF3B2A8Mojc=;
        b=rWAhsjFjxNV2tSGmRZgmV07f7lkrurQgCx9bPljwSM5dlr+cFdfNcNP8TqDYr6RpmV
         kJKrteO6A0BWcah5RksBap2thah0f3FCug6g9rOyet2tvKS6wLurIXPy+sSprVRdDpXO
         IOnftXETFpeSKiWgWdWvXjoSMVSdBSpoxhozwHThiDlqjFFzd9Q9u5Oejc6caqTfdyr4
         wAOCXRStBQxEeLEOZzM3R4MwjLF5LE07MQ+q90DEXSJbdui7Ftt93dj8CphKOBSXE/1U
         TA9yRTGiIYdnvyfGyrO3NxXvENUg3bN9B4wUskFws67k2dcY70IkWJVmV0uurT9DwBTX
         hYoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:to:cc:references:from
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=eqy7Jg2fPCw6JKPfho3FMkiXLNsZ2vOMeF3B2A8Mojc=;
        b=jgM1GONltGsOosrO+eOeWMTzHs8xGGRjxcuc9y0TmVZEAE+FjxNxNkGFYratgHqeX8
         7iw8hZ2nXHzS+sf6y4dq9OFUOiPWZgJAXUaqIwRgefseMYthSX54w75e+ZXy5ToaMM/m
         FJ9vVvsqIUuaM5wUnZfdjZqOYjOjP2tUV7YWIg4iZpYRRVF6OaOiGyGQTrOSGEtnJMC7
         hT25p6hbZD8vxq1fhpwsSK5ClgEiyerZYiKmiZRh+oErqPNG9WDwhBjXkNkIC6qyEbUb
         xWYcPLZZHou1DjHh7WwkuBQcSSXL9U9jdDFJdHMn9znuThIoczOIFZtftDh6qgwxJwf/
         9FNg==
X-Gm-Message-State: AOAM5307CuF2qI9pU7vlD9khUtkWQtS1YzuNWQ8XS46HczfTmFu2dVhi
	Cq6BYvL8/7JWmwmmNNBPo60=
X-Google-Smtp-Source: ABdhPJzF6r3Ll5i0gnC5JVk814gY1eCy0pl3+e4WV+JpVGbNy1VCb75/aaDOiQbf2OJV/MzOqd48ag==
X-Received: by 2002:a17:906:f4f:: with SMTP id h15mr4501249ejj.17.1602770245105;
        Thu, 15 Oct 2020 06:57:25 -0700 (PDT)
Received: from [192.168.137.56] (tmo-123-114.customers.d1-online.com. [80.187.123.114])
        by smtp.gmail.com with ESMTPSA id i8sm1619354ejg.84.2020.10.15.06.57.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2020 06:57:24 -0700 (PDT)
Reply-To: christian.koenig@amd.com
Subject: Re: [PATCH v4 01/10] drm/vram-helper: Remove invariant parameters
 from internal kmap function
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, sam@ravnborg.org, alexander.deucher@amd.com,
 christian.koenig@amd.com, kraxel@redhat.com, l.stach@pengutronix.de,
 linux+etnaviv@armlinux.org.uk, christian.gmeiner@gmail.com,
 inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, kgene@kernel.org, krzk@kernel.org,
 yuq825@gmail.com, bskeggs@redhat.com, robh@kernel.org,
 tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, hjc@rock-chips.com, heiko@sntech.de,
 hdegoede@redhat.com, sean@poorly.run, eric@anholt.net,
 oleksandr_andrushchenko@epam.com, ray.huang@amd.com,
 sumit.semwal@linaro.org, emil.velikov@collabora.com, luben.tuikov@amd.com,
 apaneers@amd.com, linus.walleij@linaro.org, melissa.srw@gmail.com,
 chris@chris-wilson.co.uk, miaoqinglang@huawei.com
Cc: linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 etnaviv@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linaro-mm-sig@lists.linaro.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 xen-devel@lists.xenproject.org, spice-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
References: <20201015123806.32416-1-tzimmermann@suse.de>
 <20201015123806.32416-2-tzimmermann@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <06cab96a-5224-46dc-dbd2-8eb4950946cc@gmail.com>
Date: Thu, 15 Oct 2020 15:57:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201015123806.32416-2-tzimmermann@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Am 15.10.20 um 14:37 schrieb Thomas Zimmermann:
> The parameters map and is_iomem are always of the same value. Removed them
> to prepares the function for conversion to struct dma_buf_map.
>
> v4:
> 	* don't check for !kmap->virtual; will always be false
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/drm_gem_vram_helper.c | 18 ++++--------------
>   1 file changed, 4 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
> index 3213429f8444..2d5ed30518f1 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -382,32 +382,22 @@ int drm_gem_vram_unpin(struct drm_gem_vram_object *gbo)
>   }
>   EXPORT_SYMBOL(drm_gem_vram_unpin);
>   
> -static void *drm_gem_vram_kmap_locked(struct drm_gem_vram_object *gbo,
> -				      bool map, bool *is_iomem)
> +static void *drm_gem_vram_kmap_locked(struct drm_gem_vram_object *gbo)
>   {
>   	int ret;
>   	struct ttm_bo_kmap_obj *kmap = &gbo->kmap;
> +	bool is_iomem;
>   
>   	if (gbo->kmap_use_count > 0)
>   		goto out;
>   
> -	if (kmap->virtual || !map)
> -		goto out;
> -
>   	ret = ttm_bo_kmap(&gbo->bo, 0, gbo->bo.num_pages, kmap);
>   	if (ret)
>   		return ERR_PTR(ret);
>   
>   out:
> -	if (!kmap->virtual) {
> -		if (is_iomem)
> -			*is_iomem = false;
> -		return NULL; /* not mapped; don't increment ref */
> -	}
>   	++gbo->kmap_use_count;
> -	if (is_iomem)
> -		return ttm_kmap_obj_virtual(kmap, is_iomem);
> -	return kmap->virtual;
> +	return ttm_kmap_obj_virtual(kmap, &is_iomem);
>   }
>   
>   static void drm_gem_vram_kunmap_locked(struct drm_gem_vram_object *gbo)
> @@ -452,7 +442,7 @@ void *drm_gem_vram_vmap(struct drm_gem_vram_object *gbo)
>   	ret = drm_gem_vram_pin_locked(gbo, 0);
>   	if (ret)
>   		goto err_ttm_bo_unreserve;
> -	base = drm_gem_vram_kmap_locked(gbo, true, NULL);
> +	base = drm_gem_vram_kmap_locked(gbo);
>   	if (IS_ERR(base)) {
>   		ret = PTR_ERR(base);
>   		goto err_drm_gem_vram_unpin_locked;


