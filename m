Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0738B27E34B
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 10:06:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.471.1468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNX74-00014k-5P; Wed, 30 Sep 2020 08:05:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471.1468; Wed, 30 Sep 2020 08:05:22 +0000
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
	id 1kNX74-00014L-1s; Wed, 30 Sep 2020 08:05:22 +0000
Received: by outflank-mailman (input) for mailman id 471;
 Wed, 30 Sep 2020 08:05:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SkH+=DH=gmail.com=ckoenig.leichtzumerken@srs-us1.protection.inumbo.net>)
 id 1kNX72-00014G-G0
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 08:05:20 +0000
Received: from mail-ed1-x543.google.com (unknown [2a00:1450:4864:20::543])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 91ed18db-805d-44e4-a867-b84a3f9c1b32;
 Wed, 30 Sep 2020 08:05:19 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id 33so444142edq.13
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 01:05:19 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id m10sm847124ejx.123.2020.09.30.01.05.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2020 01:05:17 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=SkH+=DH=gmail.com=ckoenig.leichtzumerken@srs-us1.protection.inumbo.net>)
	id 1kNX72-00014G-G0
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 08:05:20 +0000
X-Inumbo-ID: 91ed18db-805d-44e4-a867-b84a3f9c1b32
Received: from mail-ed1-x543.google.com (unknown [2a00:1450:4864:20::543])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 91ed18db-805d-44e4-a867-b84a3f9c1b32;
	Wed, 30 Sep 2020 08:05:19 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id 33so444142edq.13
        for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 01:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=hYkMEPfbgpUi2wWiTMu+Q1BqhfCkqr+lEZgubxfz0nA=;
        b=eBNfVeJpwIUfgxpXMfhfR0Ga8oDx11PUlM6ZLsOdkWgkiEEf604G5KchU88cbbhuTL
         /cSzUT7hf4le3Woies3p2ql/1tUPVwdgzLLAsbo77pbyWZy+XD8jltcJLpcJkaGXxPU1
         N34JQ3ukOS13XvtqMFdfk/kJYTMVbTkvACuAj+W4rZUVleJ2YwvviOGxnD1NHZzWukYD
         ymPBR6mnl42s8Kgak2EVD6TFFiCSfTxKl3U85Z3qbT/v4OQR4pc9o2u6piFGKxNZNeey
         LeMsb3JYRPSdnlui/g4/QzbSwzFDsDgFnvLP5nTVf7/cF3SFzawtbrQ8l031h/EkoHdU
         Xcwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:to:cc:references:from
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language;
        bh=hYkMEPfbgpUi2wWiTMu+Q1BqhfCkqr+lEZgubxfz0nA=;
        b=iieZtcMsj+UZMgBoaYxKC4nXS3Yf6cpSJzqzYk8xHws7jLrJtP2LM60mtikWOXc0hB
         iAVkQOiX1jW2bnTv8StRGz6nbk1MwnDmcLAaeWKPlpTWsqhVrIiCpBTta18Wa+7MWxSh
         1OAbWMGTYlP6TSg+eOyAXAOuoi0pz1VOuTEwSrcBtMYeVNA6wZL6f9VUzb/IftUpNkvy
         Aa6PoJx3kzXd0684VJ315JfssLa9MAYhNjItD0cMwnrM8OZuWnqPwBHUw9l0qiNTrXLU
         eaKhlBJLOPSI/3ivAQPBHQbDTfQ5GGJD8M2hI2tu3aB4ZPWMWpCXA4mdlxsH0ETH0n4S
         KhIw==
X-Gm-Message-State: AOAM531YoXIZ+RshICmdAYj0idIej1v47btLaADkqlKrOg6C5xnkj583
	kLy5Pf9f/eIz3bP9PwdMsds=
X-Google-Smtp-Source: ABdhPJzwiwgmcLj0yHokl5225Rqp/SVc6sU6c2RZNeNbLTKr1w/PH6NZKJHqEBp3o7hguXCp85FEQg==
X-Received: by 2002:a05:6402:17f6:: with SMTP id t22mr1376405edy.374.1601453118231;
        Wed, 30 Sep 2020 01:05:18 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7? ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
        by smtp.gmail.com with ESMTPSA id m10sm847124ejx.123.2020.09.30.01.05.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2020 01:05:17 -0700 (PDT)
Reply-To: christian.koenig@amd.com
Subject: Re: [PATCH v3 2/7] drm/ttm: Add ttm_kmap_obj_to_dma_buf_map() for
 type conversion
To: Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, sam@ravnborg.org, alexander.deucher@amd.com,
 kraxel@redhat.com, l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk,
 christian.gmeiner@gmail.com, inki.dae@samsung.com, jy0922.shim@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, kgene@kernel.org,
 krzk@kernel.org, yuq825@gmail.com, bskeggs@redhat.com, robh@kernel.org,
 tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, hjc@rock-chips.com, heiko@sntech.de,
 hdegoede@redhat.com, sean@poorly.run, eric@anholt.net,
 oleksandr_andrushchenko@epam.com, ray.huang@amd.com,
 sumit.semwal@linaro.org, emil.velikov@collabora.com, luben.tuikov@amd.com,
 apaneers@amd.com, linus.walleij@linaro.org, melissa.srw@gmail.com,
 chris@chris-wilson.co.uk, miaoqinglang@huawei.com
Cc: linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, spice-devel@lists.freedesktop.org,
 xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
References: <20200929151437.19717-1-tzimmermann@suse.de>
 <20200929151437.19717-3-tzimmermann@suse.de>
 <8fad0114-064a-4ed5-c21d-d1b4294de0a1@amd.com>
 <2614314a-81f7-4722-c400-68d90e48e09a@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <8a84f62b-33f3-f44c-52af-c859a0e0d1fb@gmail.com>
Date: Wed, 30 Sep 2020 10:05:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2614314a-81f7-4722-c400-68d90e48e09a@suse.de>
Content-Type: multipart/alternative;
 boundary="------------635115E847F12105B10D495F"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------635115E847F12105B10D495F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 29.09.20 um 19:49 schrieb Thomas Zimmermann:
> Hi Christian
>
> Am 29.09.20 um 17:35 schrieb Christian König:
>> Am 29.09.20 um 17:14 schrieb Thomas Zimmermann:
>>> The new helper ttm_kmap_obj_to_dma_buf() extracts address and location
>>> from and instance of TTM's kmap_obj and initializes struct dma_buf_map
>>> with these values. Helpful for TTM-based drivers.
>> We could completely drop that if we use the same structure inside TTM as
>> well.
>>
>> Additional to that which driver is going to use this?
> As Daniel mentioned, it's in patch 3. The TTM-based drivers will
> retrieve the pointer via this function.
>
> I do want to see all that being more tightly integrated into TTM, but
> not in this series. This one is about fixing the bochs-on-sparc64
> problem for good. Patch 7 adds an update to TTM to the DRM TODO list.

I should have asked which driver you try to fix here :)

In this case just keep the function inside bochs and only fix it there.

All other drivers can be fixed when we generally pump this through TTM.

Regards,
Christian.

>
> Best regards
> Thomas
>
>> Regards,
>> Christian.
>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> ---
>>>    include/drm/ttm/ttm_bo_api.h | 24 ++++++++++++++++++++++++
>>>    include/linux/dma-buf-map.h  | 20 ++++++++++++++++++++
>>>    2 files changed, 44 insertions(+)
>>>
>>> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
>>> index c96a25d571c8..62d89f05a801 100644
>>> --- a/include/drm/ttm/ttm_bo_api.h
>>> +++ b/include/drm/ttm/ttm_bo_api.h
>>> @@ -34,6 +34,7 @@
>>>    #include <drm/drm_gem.h>
>>>    #include <drm/drm_hashtab.h>
>>>    #include <drm/drm_vma_manager.h>
>>> +#include <linux/dma-buf-map.h>
>>>    #include <linux/kref.h>
>>>    #include <linux/list.h>
>>>    #include <linux/wait.h>
>>> @@ -486,6 +487,29 @@ static inline void *ttm_kmap_obj_virtual(struct
>>> ttm_bo_kmap_obj *map,
>>>        return map->virtual;
>>>    }
>>>    +/**
>>> + * ttm_kmap_obj_to_dma_buf_map
>>> + *
>>> + * @kmap: A struct ttm_bo_kmap_obj returned from ttm_bo_kmap.
>>> + * @map: Returns the mapping as struct dma_buf_map
>>> + *
>>> + * Converts struct ttm_bo_kmap_obj to struct dma_buf_map. If the memory
>>> + * is not mapped, the returned mapping is initialized to NULL.
>>> + */
>>> +static inline void ttm_kmap_obj_to_dma_buf_map(struct ttm_bo_kmap_obj
>>> *kmap,
>>> +                           struct dma_buf_map *map)
>>> +{
>>> +    bool is_iomem;
>>> +    void *vaddr = ttm_kmap_obj_virtual(kmap, &is_iomem);
>>> +
>>> +    if (!vaddr)
>>> +        dma_buf_map_clear(map);
>>> +    else if (is_iomem)
>>> +        dma_buf_map_set_vaddr_iomem(map, (void __force __iomem *)vaddr);
>>> +    else
>>> +        dma_buf_map_set_vaddr(map, vaddr);
>>> +}
>>> +
>>>    /**
>>>     * ttm_bo_kmap
>>>     *
>>> diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-buf-map.h
>>> index fd1aba545fdf..2e8bbecb5091 100644
>>> --- a/include/linux/dma-buf-map.h
>>> +++ b/include/linux/dma-buf-map.h
>>> @@ -45,6 +45,12 @@
>>>     *
>>>     *    dma_buf_map_set_vaddr(&map. 0xdeadbeaf);
>>>     *
>>> + * To set an address in I/O memory, use dma_buf_map_set_vaddr_iomem().
>>> + *
>>> + * .. code-block:: c
>>> + *
>>> + *    dma_buf_map_set_vaddr_iomem(&map. 0xdeadbeaf);
>>> + *
>>>     * Test if a mapping is valid with either dma_buf_map_is_set() or
>>>     * dma_buf_map_is_null().
>>>     *
>>> @@ -118,6 +124,20 @@ static inline void dma_buf_map_set_vaddr(struct
>>> dma_buf_map *map, void *vaddr)
>>>        map->is_iomem = false;
>>>    }
>>>    +/**
>>> + * dma_buf_map_set_vaddr_iomem - Sets a dma-buf mapping structure to
>>> an address in I/O memory
>>> + * @map:        The dma-buf mapping structure
>>> + * @vaddr_iomem:    An I/O-memory address
>>> + *
>>> + * Sets the address and the I/O-memory flag.
>>> + */
>>> +static inline void dma_buf_map_set_vaddr_iomem(struct dma_buf_map *map,
>>> +                           void __iomem *vaddr_iomem)
>>> +{
>>> +    map->vaddr_iomem = vaddr_iomem;
>>> +    map->is_iomem = true;
>>> +}
>>> +
>>>    /**
>>>     * dma_buf_map_is_equal - Compares two dma-buf mapping structures
>>> for equality
>>>     * @lhs:    The dma-buf mapping structure
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx


--------------635115E847F12105B10D495F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Am 29.09.20 um 19:49 schrieb Thomas
      Zimmermann:<br>
    </div>
    <blockquote type="cite"
      cite="mid:2614314a-81f7-4722-c400-68d90e48e09a@suse.de">
      <pre class="moz-quote-pre" wrap="">Hi Christian

Am 29.09.20 um 17:35 schrieb Christian König:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Am 29.09.20 um 17:14 schrieb Thomas Zimmermann:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">The new helper ttm_kmap_obj_to_dma_buf() extracts address and location
from and instance of TTM's kmap_obj and initializes struct dma_buf_map
with these values. Helpful for TTM-based drivers.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
We could completely drop that if we use the same structure inside TTM as
well.

Additional to that which driver is going to use this?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
As Daniel mentioned, it's in patch 3. The TTM-based drivers will
retrieve the pointer via this function.

I do want to see all that being more tightly integrated into TTM, but
not in this series. This one is about fixing the bochs-on-sparc64
problem for good. Patch 7 adds an update to TTM to the DRM TODO list.</pre>
    </blockquote>
    <br>
    I should have asked which driver you try to fix here :)<br>
    <br>
    In this case just keep the function inside bochs and only fix it
    there.<br>
    <br>
    All other drivers can be fixed when we generally pump this through
    TTM.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite"
      cite="mid:2614314a-81f7-4722-c400-68d90e48e09a@suse.de">
      <pre class="moz-quote-pre" wrap="">

Best regards
Thomas

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Regards,
Christian.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
Signed-off-by: Thomas Zimmermann <a class="moz-txt-link-rfc2396E" href="mailto:tzimmermann@suse.de">&lt;tzimmermann@suse.de&gt;</a>
---
  include/drm/ttm/ttm_bo_api.h | 24 ++++++++++++++++++++++++
  include/linux/dma-buf-map.h  | 20 ++++++++++++++++++++
  2 files changed, 44 insertions(+)

diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
index c96a25d571c8..62d89f05a801 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -34,6 +34,7 @@
  #include &lt;drm/drm_gem.h&gt;
  #include &lt;drm/drm_hashtab.h&gt;
  #include &lt;drm/drm_vma_manager.h&gt;
+#include &lt;linux/dma-buf-map.h&gt;
  #include &lt;linux/kref.h&gt;
  #include &lt;linux/list.h&gt;
  #include &lt;linux/wait.h&gt;
@@ -486,6 +487,29 @@ static inline void *ttm_kmap_obj_virtual(struct
ttm_bo_kmap_obj *map,
      return map-&gt;virtual;
  }
  +/**
+ * ttm_kmap_obj_to_dma_buf_map
+ *
+ * @kmap: A struct ttm_bo_kmap_obj returned from ttm_bo_kmap.
+ * @map: Returns the mapping as struct dma_buf_map
+ *
+ * Converts struct ttm_bo_kmap_obj to struct dma_buf_map. If the memory
+ * is not mapped, the returned mapping is initialized to NULL.
+ */
+static inline void ttm_kmap_obj_to_dma_buf_map(struct ttm_bo_kmap_obj
*kmap,
+                           struct dma_buf_map *map)
+{
+    bool is_iomem;
+    void *vaddr = ttm_kmap_obj_virtual(kmap, &amp;is_iomem);
+
+    if (!vaddr)
+        dma_buf_map_clear(map);
+    else if (is_iomem)
+        dma_buf_map_set_vaddr_iomem(map, (void __force __iomem *)vaddr);
+    else
+        dma_buf_map_set_vaddr(map, vaddr);
+}
+
  /**
   * ttm_bo_kmap
   *
diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-buf-map.h
index fd1aba545fdf..2e8bbecb5091 100644
--- a/include/linux/dma-buf-map.h
+++ b/include/linux/dma-buf-map.h
@@ -45,6 +45,12 @@
   *
   *    dma_buf_map_set_vaddr(&amp;map. 0xdeadbeaf);
   *
+ * To set an address in I/O memory, use dma_buf_map_set_vaddr_iomem().
+ *
+ * .. code-block:: c
+ *
+ *    dma_buf_map_set_vaddr_iomem(&amp;map. 0xdeadbeaf);
+ *
   * Test if a mapping is valid with either dma_buf_map_is_set() or
   * dma_buf_map_is_null().
   *
@@ -118,6 +124,20 @@ static inline void dma_buf_map_set_vaddr(struct
dma_buf_map *map, void *vaddr)
      map-&gt;is_iomem = false;
  }
  +/**
+ * dma_buf_map_set_vaddr_iomem - Sets a dma-buf mapping structure to
an address in I/O memory
+ * @map:        The dma-buf mapping structure
+ * @vaddr_iomem:    An I/O-memory address
+ *
+ * Sets the address and the I/O-memory flag.
+ */
+static inline void dma_buf_map_set_vaddr_iomem(struct dma_buf_map *map,
+                           void __iomem *vaddr_iomem)
+{
+    map-&gt;vaddr_iomem = vaddr_iomem;
+    map-&gt;is_iomem = true;
+}
+
  /**
   * dma_buf_map_is_equal - Compares two dma-buf mapping structures
for equality
   * @lhs:    The dma-buf mapping structure
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
_______________________________________________
dri-devel mailing list
<a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a>
<a class="moz-txt-link-freetext" href="https://lists.freedesktop.org/mailman/listinfo/dri-devel">https://lists.freedesktop.org/mailman/listinfo/dri-devel</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">_______________________________________________
amd-gfx mailing list
<a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a>
<a class="moz-txt-link-freetext" href="https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://lists.freedesktop.org/mailman/listinfo/amd-gfx</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------635115E847F12105B10D495F--

