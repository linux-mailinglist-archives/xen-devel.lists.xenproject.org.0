Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1036F1D5669
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2020 18:44:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZdRJ-0000r0-7A; Fri, 15 May 2020 16:44:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iw4X=65=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jZdRH-0000qt-6d
 for xen-devel@lists.xenproject.org; Fri, 15 May 2020 16:43:59 +0000
X-Inumbo-ID: 45dfe34e-96cb-11ea-b07b-bc764e2007e4
Received: from mail-wr1-f45.google.com (unknown [209.85.221.45])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 45dfe34e-96cb-11ea-b07b-bc764e2007e4;
 Fri, 15 May 2020 16:43:58 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id v12so4248047wrp.12
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2020 09:43:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WI1ahOcWbzT79YScFm2k3Snud6/mjAqZd8zfDh+GsFc=;
 b=PPeKFuOtC8BXDFQJ8JgqrfKK0ANzefXC2Xw8oglbY6mLrDSdqZrlbqbC5osBd4tqf0
 cCHUVDY5KMD3fs9UVwlL/KhWBoO6U0fMhyUP00UpOGgZpx3J8wMQ8ftET/nTrzp2rQzN
 Ix4xz+cQ+qAjBI5UpxfqOB87GUG95AxAZmz8jYguZxUIUFgBKkmn2H3p6AZTUv+QyxsV
 1QPoWqagz6by37oOxyvvqzZe8RCf/dru7y/UNdCYonzVr655koPdvhdojYs75ix/P3Wu
 EI8zp2OGEuvJkL2Ggg7k8+nZn8rYFzHlLf6qErjJbCQ4uQXfOX6fWKJ6ZIpq/9iZMQef
 bCww==
X-Gm-Message-State: AOAM532xy6ehGA2IxhnyFmQbjbq/eTjyYwOKlpsRwIjdFs0LEFpOb58h
 ay8SY6LEYgJu06zAYTzvP9w=
X-Google-Smtp-Source: ABdhPJxxuUMcUrB7+efaSelt+CKLf0mZxIhPLOg5WPmCbE2PJ/9EkzKSRyvKTpzDzinBxr5H9kJNfw==
X-Received: by 2002:adf:82c3:: with SMTP id 61mr5441863wrc.326.1589561038048; 
 Fri, 15 May 2020 09:43:58 -0700 (PDT)
Received: from
 liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id q17sm4602659wmk.36.2020.05.15.09.43.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 09:43:57 -0700 (PDT)
Date: Fri, 15 May 2020 16:43:55 +0000
From: Wei Liu <wl@xen.org>
To: paul@xen.org
Subject: Re: Items for CHANGELOG.md in 4.14
Message-ID: <20200515164355.oujf2mvbep6yhlua@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <000401d62aaa$e0eccab0$a2c66010$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000401d62aaa$e0eccab0$a2c66010$@xen.org>
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 'Roger Pau Monne' <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, May 15, 2020 at 12:20:44PM +0100, Paul Durrant wrote:
> All,
> 
>   In the last community call I took an ACTION to send a reminder email to submit patches to get CHANGELOG.md up to date. Several
> items were mentioned during the call (see minutes at https://cryptpad.fr/pad/#/2/pad/edit/qPQUEQEv3nJJ97clS8b2KdtP/):
> 
> - Ability to conditionally compile-out 32-bit PV guests (security attack surface reduction)
> - Basic support for AMD Milan CPUS
> - Golang binding advances
> - x2apic, improvements on tlbflush hypercall
> - General improvements in pvshim
> - Xen on Hyper-V

As part of this work, there is now a "framework" to make it easy to port
Xen to run on top of hypervisors. Does this need calling out?

Wei.

