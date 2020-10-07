Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9553A285D68
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 12:52:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3418.9837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQ726-0006mD-DV; Wed, 07 Oct 2020 10:50:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3418.9837; Wed, 07 Oct 2020 10:50:54 +0000
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
	id 1kQ726-0006lq-9e; Wed, 07 Oct 2020 10:50:54 +0000
Received: by outflank-mailman (input) for mailman id 3418;
 Wed, 07 Oct 2020 10:50:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mlZt=DO=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kQ725-0006ll-GV
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 10:50:53 +0000
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2d40c828-6c35-4167-ac62-6500d1c042f1;
 Wed, 07 Oct 2020 10:50:52 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id n18so1607685wrs.5
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2020 03:50:52 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id l18sm2349693wrp.84.2020.10.07.03.50.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 03:50:50 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=mlZt=DO=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kQ725-0006ll-GV
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 10:50:53 +0000
X-Inumbo-ID: 2d40c828-6c35-4167-ac62-6500d1c042f1
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 2d40c828-6c35-4167-ac62-6500d1c042f1;
	Wed, 07 Oct 2020 10:50:52 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id n18so1607685wrs.5
        for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2020 03:50:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=czGh4ZowBRDnHUvhZhQVe6BWzab9g6zWKZOGRKWO50c=;
        b=ULsQmCmyyCoHnjtKeurjgBoXygiMf1BLVk5RM9KcS/4FNrykjmLI3MAf9fr5ZYsd2z
         z3CEEzv6kkpV/1nL67m8ETDOkU5naAksnvZ9Q18+LQXzbXJ/AJYU/UhHCJdPtfTBjhq5
         T2ZhjKC02zHVzsawYZ5u5hujYwTqVK31yj89KWNiqH0B+AwX/8e5eQwQQonL/sIgFacQ
         tiCUkiC0pVheSPeRrPbDGdlM6R87GnVcO/WWTfleZ6ZPvCj6Up5PHHpzTavrpt4mZE/F
         f01JJXFs6t3mzhbLmBlngXh5wsNv84NUazUW50C+BR4QbEK9sEsl6bZjMljxm/hdJhPm
         oa4w==
X-Gm-Message-State: AOAM533xY6SUZeh9tMlk+QM/5tBiS4csDztU5B1RqY99b92tT8Q8rQ8i
	xGQv9B5bNJXIHEoK/PjdR/I=
X-Google-Smtp-Source: ABdhPJwKyQC2r4r3wyuItlOKMNZ6CvLXHaDBLFamy19yJ7RJzroqGqQpvuc/FO6BCd2PTm2uQNjC+Q==
X-Received: by 2002:a5d:46c5:: with SMTP id g5mr2952141wrs.416.1602067851476;
        Wed, 07 Oct 2020 03:50:51 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id l18sm2349693wrp.84.2020.10.07.03.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 03:50:50 -0700 (PDT)
Date: Wed, 7 Oct 2020 10:50:49 +0000
From: Wei Liu <wl@xen.org>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] libxl: only query VNC when enabled
Message-ID: <20201007105049.vfpunr4g62fqvijr@liuwe-devbox-debian-v2>
References: <20201001235337.83948-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201001235337.83948-1-jandryuk@gmail.com>
User-Agent: NeoMutt/20180716

On Thu, Oct 01, 2020 at 07:53:37PM -0400, Jason Andryuk wrote:
> QEMU without VNC support (configure --disable-vnc) will return an error
> when VNC is queried over QMP since it does not recognize the QMP
> command.  This will cause libxl to fail starting the domain even if VNC
> is not enabled.  Therefore only query QEMU for VNC support when using
> VNC, so a VNC-less QEMU will function in this configuration.
> 
> 'goto out' jumps to the call to device_model_postconfig_done(), the
> final callback after the chain of vnc queries.  This bypasses all the
> QMP VNC queries.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> ---
>  tools/libs/light/libxl_dm.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
> index a944181781..d1ff35dda3 100644
> --- a/tools/libs/light/libxl_dm.c
> +++ b/tools/libs/light/libxl_dm.c
> @@ -3140,6 +3140,7 @@ static void device_model_postconfig_chardev(libxl__egc *egc,
>  {
>      EGC_GC;
>      libxl__dm_spawn_state *dmss = CONTAINER_OF(qmp, *dmss, qmp);
> +    const libxl_vnc_info *vnc = libxl__dm_vnc(dmss->guest_config);
>      const libxl__json_object *item = NULL;
>      const libxl__json_object *o = NULL;
>      int i = 0;
> @@ -3197,6 +3198,9 @@ static void device_model_postconfig_chardev(libxl__egc *egc,
>          if (rc) goto out;
>      }
>  
> +    if (!vnc)
> +        goto out;
> +

I would rather this check be done in device_model_postconfig_vnc.

Does the following work for you?

diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index a944181781bb..c5db755a65d7 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -3222,6 +3222,8 @@ static void device_model_postconfig_vnc(libxl__egc *egc,

     if (rc) goto out;

+    if (!vnc) goto out;
+
     /*
      * query-vnc response:
      * { 'enabled': 'bool', '*host': 'str', '*service': 'str' }
@@ -3255,7 +3257,8 @@ static void device_model_postconfig_vnc(libxl__egc *egc,
         if (rc) goto out;
     }

-    if (vnc && vnc->passwd && vnc->passwd[0]) {
+    assert(vnc);
+    if (vnc->passwd && vnc->passwd[0]) {
         qmp->callback = device_model_postconfig_vnc_passwd;
         libxl__qmp_param_add_string(gc, &args, "password", vnc->passwd);
         rc = libxl__ev_qmp_send(egc, qmp, "change-vnc-password", args);


