Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4C429ED7B
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 14:48:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14183.35213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kY8Hr-0005mN-H0; Thu, 29 Oct 2020 13:48:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14183.35213; Thu, 29 Oct 2020 13:48:19 +0000
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
	id 1kY8Hr-0005ly-DP; Thu, 29 Oct 2020 13:48:19 +0000
Received: by outflank-mailman (input) for mailman id 14183;
 Thu, 29 Oct 2020 13:48:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o7xP=EE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kY8Hp-0005lr-LG
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 13:48:17 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 54443f21-8ce5-473f-baeb-f5eae923dbde;
 Thu, 29 Oct 2020 13:48:16 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 18097AC12;
 Thu, 29 Oct 2020 13:48:16 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=o7xP=EE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kY8Hp-0005lr-LG
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 13:48:17 +0000
X-Inumbo-ID: 54443f21-8ce5-473f-baeb-f5eae923dbde
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 54443f21-8ce5-473f-baeb-f5eae923dbde;
	Thu, 29 Oct 2020 13:48:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603979296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b+W3OIBwFQnB56lPFhfRRpxuzw3xbNI8cjlGnjdVkuM=;
	b=qn3EYK6oPq6k0BdN7UTWfQ49fcE9w+m1mdkOs++0ONj9VXb5nkbbA/OZ6cM6XZ/xid6UXm
	PMhJ4TdxpDCK1bP0afIcQpXr3bPSoUDyN1v3qe3psWdPqRgETQDs39S8NO4JVG0mdjUJeC
	M8ueGSA1LyEMjuKUKr4hZPF/ZkH/YTU=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 18097AC12;
	Thu, 29 Oct 2020 13:48:16 +0000 (UTC)
Subject: Ping: [PATCH] tools/python: pass more -rpath-link options to ld
From: Jan Beulich <jbeulich@suse.com>
To: Marek Marczykowski <marmarek@invisiblethingslab.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d10bb94f-c572-6977-40a4-57a61da4094b@suse.com>
Message-ID: <f449285a-aa96-85a7-59d2-0a9dc6cc50b4@suse.com>
Date: Thu, 29 Oct 2020 14:48:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <d10bb94f-c572-6977-40a4-57a61da4094b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 19.10.2020 10:31, Jan Beulich wrote:
> With the split of libraries, I've observed a number of warnings from
> (old?) ld.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Marek?

> ---
> It's unclear to me whether this is ld version dependent - the pattern
> of where I've seen such warnings doesn't suggest a clear version
> dependency.
> 
> --- a/tools/python/setup.py
> +++ b/tools/python/setup.py
> @@ -7,10 +7,15 @@ XEN_ROOT = "../.."
>  extra_compile_args  = [ "-fno-strict-aliasing", "-Werror" ]
>  
>  PATH_XEN      = XEN_ROOT + "/tools/include"
> +PATH_LIBXENTOOLCORE = XEN_ROOT + "/tools/libs/toolcore"
>  PATH_LIBXENTOOLLOG = XEN_ROOT + "/tools/libs/toollog"
> +PATH_LIBXENCALL = XEN_ROOT + "/tools/libs/call"
>  PATH_LIBXENEVTCHN = XEN_ROOT + "/tools/libs/evtchn"
> +PATH_LIBXENGNTTAB = XEN_ROOT + "/tools/libs/gnttab"
>  PATH_LIBXENCTRL = XEN_ROOT + "/tools/libs/ctrl"
>  PATH_LIBXENGUEST = XEN_ROOT + "/tools/libs/guest"
> +PATH_LIBXENDEVICEMODEL = XEN_ROOT + "/tools/libs/devicemodel"
> +PATH_LIBXENFOREIGNMEMORY = XEN_ROOT + "/tools/libs/foreignmemory"
>  PATH_XENSTORE = XEN_ROOT + "/tools/libs/store"
>  
>  xc = Extension("xc",
> @@ -24,7 +29,13 @@ xc = Extension("xc",
>                 library_dirs       = [ PATH_LIBXENCTRL, PATH_LIBXENGUEST ],
>                 libraries          = [ "xenctrl", "xenguest" ],
>                 depends            = [ PATH_LIBXENCTRL + "/libxenctrl.so", PATH_LIBXENGUEST + "/libxenguest.so" ],
> -               extra_link_args    = [ "-Wl,-rpath-link="+PATH_LIBXENTOOLLOG ],
> +               extra_link_args    = [ "-Wl,-rpath-link="+PATH_LIBXENCALL,
> +                                      "-Wl,-rpath-link="+PATH_LIBXENDEVICEMODEL,
> +                                      "-Wl,-rpath-link="+PATH_LIBXENEVTCHN,
> +                                      "-Wl,-rpath-link="+PATH_LIBXENFOREIGNMEMORY,
> +                                      "-Wl,-rpath-link="+PATH_LIBXENGNTTAB,
> +                                      "-Wl,-rpath-link="+PATH_LIBXENTOOLCORE,
> +                                      "-Wl,-rpath-link="+PATH_LIBXENTOOLLOG ],
>                 sources            = [ "xen/lowlevel/xc/xc.c" ])
>  
>  xs = Extension("xs",
> @@ -33,6 +44,7 @@ xs = Extension("xs",
>                 library_dirs       = [ PATH_XENSTORE ],
>                 libraries          = [ "xenstore" ],
>                 depends            = [ PATH_XENSTORE + "/libxenstore.so" ],
> +               extra_link_args    = [ "-Wl,-rpath-link="+PATH_LIBXENTOOLCORE ],
>                 sources            = [ "xen/lowlevel/xs/xs.c" ])
>  
>  plat = os.uname()[0]
> 


