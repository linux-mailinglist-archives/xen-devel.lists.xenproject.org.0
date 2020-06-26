Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0316E20B036
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2020 13:08:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jomDS-0006P5-5q; Fri, 26 Jun 2020 11:08:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=azve=AH=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jomDQ-0006P0-35
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2020 11:08:16 +0000
X-Inumbo-ID: 54d2034e-b79d-11ea-8496-bc764e2007e4
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 54d2034e-b79d-11ea-8496-bc764e2007e4;
 Fri, 26 Jun 2020 11:08:15 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id s10so9055888wrw.12
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2020 04:08:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=c9WaCIqQZhKW2/Inw15yclaIY5xNEd79NUySjO/b4CA=;
 b=FdIs4UlDH2QpZc74pXA3H1JPy7KpavDu+bkIs1CKjPLJMXccGuKq8pEAA4OUYiI3YR
 /Dv9pIXmENJiKTs9HM/AnvEC6HxQkIiLKlUBgBvt5H/4xeufu3fQib6juaCHimUD+/Y1
 PwxEPcl+0OfQYWftBjpOYCFC0C2uZEp0B8jZ5YhwnTtQJ8iWk5LfHQSQZMdtffKlsyLE
 alMcDZaXVhk7QLO3PRgRysKY2TgXlovzyhfJ6M9lZPXzoMSoDdHNZqaAjlwNdi6jeBrT
 cJXddmcubVdjlR7n8QJe0gc1TmYzc6kVDAXICxFXCbV8FTmAHSJNYQoD0UNTAVVEnMd9
 JaBw==
X-Gm-Message-State: AOAM530WRphPRaRAuq1vuV1DMt0ypwQJnmCQehtf/PsX+7o3PjO24UXU
 IWwM0vzHUKyKlwc1jW/Pj+A=
X-Google-Smtp-Source: ABdhPJwAvP6F5WCx5gH/bFwla90A95Nm/gGCusSuy0VtDnFqqcUfMkIn2iajc5bLukaCsPaR+8KUEQ==
X-Received: by 2002:adf:f889:: with SMTP id u9mr3448372wrp.149.1593169694533; 
 Fri, 26 Jun 2020 04:08:14 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id 65sm17456407wma.48.2020.06.26.04.08.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 04:08:13 -0700 (PDT)
Date: Fri, 26 Jun 2020 11:08:12 +0000
From: Wei Liu <wl@xen.org>
To: Julien Grall <jgrall@amazon.com>
Subject: Re: Kexec and libxenctlr.so
Message-ID: <20200626110812.hxeoomagamkdceu7@liuwe-devbox-debian-v2>
References: <7a88218d-981e-6583-15a5-3fcaffb05294@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a88218d-981e-6583-15a5-3fcaffb05294@amazon.com>
User-Agent: NeoMutt/20180716
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "wl@xen.org" <wl@xen.org>, "paul@xen.org" <paul@xen.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 daniel.kiper@oracle.com,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Jun 11, 2020 at 03:57:37PM +0100, Julien Grall wrote:
> Hi all,
> 
> kexec-tools has an option to load dynamically libxenctlr.so (not .so.4.x)
> (see [1]).
> 
> Given that the library has never been considered stable, it is probably a
> disaster that is waiting to happen.
> 
> Looking at the tree kexec is using the follow libxc functions:
>    - xc_kexec_get_range()
>    - xc_kexec_load()
>    - xc_kexec_unload()
>    - xc_kexec_status()
>    - xc_kexec_exec()
>    - xc_version()
>    - xc_interface_open()
>    - xc_interface_close()
>    - xc_get_max_cpus()
>    - xc_get_machine_memory_map()
> 
> I think it is uncontroversial that we want a new stable library for all the
> xc_kexec_* functions (maybe libxenexec)?

That sounds fine to me.

Looking at the list of functions, all the xc_kexec_* ones are probably
already rather stable.

For xc_interface_open / close, they are perhaps used only to obtain an
xc handle such that it can be used to make hypercalls. You new kexec
library is going to expose its own handle with a xencall handle wrapped
inside, so you can do away with an xc handle.

> 
> However I am not entirely sure where to put the others.
> 
> I am thinking to introduce libxensysctl for xc_get_max_cpus() as it is a
> XEN_SYSCTL. We could possibly include xc_get_machine_memory_map() (despite
> it is a XENMEM_).
> 

Introducing an libxensysctl before we stabilise sysctl interface seems
wrong to me. We can bury the call inside libxenkexec itself for the time
being.

> For xc_version(), I am thinking to extend libxentoolcore to also include
> "stable xen API".
> 

If you can do without an xc handle, do you still need to call
xc_version?

Wei.

> Any opinion on the approach?
> 
> Cheers,
> 
> 
> [1] https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/commit/?id=894bea9335f57b62cbded7b02ab7d58308b647d8

