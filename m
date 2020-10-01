Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9C827FDDE
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 12:57:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1195.3997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNwGG-0000wt-3Q; Thu, 01 Oct 2020 10:56:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1195.3997; Thu, 01 Oct 2020 10:56:32 +0000
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
	id 1kNwGF-0000wU-Vh; Thu, 01 Oct 2020 10:56:31 +0000
Received: by outflank-mailman (input) for mailman id 1195;
 Thu, 01 Oct 2020 10:56:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tj+q=DI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kNwGE-0000wK-Jv
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 10:56:30 +0000
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6e73a7f5-bbf2-40f2-b6c9-424fc8206d95;
 Thu, 01 Oct 2020 10:56:29 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id x23so2425109wmi.3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2020 03:56:29 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id n6sm7973552wmd.22.2020.10.01.03.56.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 03:56:28 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Tj+q=DI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kNwGE-0000wK-Jv
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 10:56:30 +0000
X-Inumbo-ID: 6e73a7f5-bbf2-40f2-b6c9-424fc8206d95
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 6e73a7f5-bbf2-40f2-b6c9-424fc8206d95;
	Thu, 01 Oct 2020 10:56:29 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id x23so2425109wmi.3
        for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2020 03:56:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NuIINmqUvhxVyBOdo9CdFrllv4t6Yy+33Fu7/wllaRU=;
        b=iu2z+IwzrzgokbkbptExKFg3jUqEEawmqEwexSwsawI1DnRcF06r/aUlwhQEr4/LCS
         qdwwSz1j4gLx47f6ir+oyazspXaeFmj7IIskYlRhu7dVMhutZU5iIrKdBH1v/bph/vwF
         qmU/7YiUE8kHYxRdDoJQ7NgNY1Po9b7Dmxwl2I6h6UlmQRPKPUCeHUh+czSLptzyc0LQ
         7xWDVcPdbFVofXL6bPY+FnNIMUSukJriprA9xni4ujdInnpWldYbrizbvXcNj1/aUXXY
         u/kcszSGKXDZNkq8iWLFrrvGKZaMVplykG3a5Eij9A8ejW5R3mnTZdeetVSYn4DehL4X
         +M0A==
X-Gm-Message-State: AOAM532Z0+3EPw5mILAaKhSHXePNl6ag8MDwk9xav3NOTDUANTgbaKyy
	Vip83rjcNwtylByPhehE3lY=
X-Google-Smtp-Source: ABdhPJwSWC1dnrjUlNTTc7SPjLnTgdftNMRLgorWyooJhdiSDwzYi/DAG6TVECmLeQBeoBNKmwB1EA==
X-Received: by 2002:a1c:98d8:: with SMTP id a207mr7569434wme.157.1601549789151;
        Thu, 01 Oct 2020 03:56:29 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id n6sm7973552wmd.22.2020.10.01.03.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 03:56:28 -0700 (PDT)
Date: Thu, 1 Oct 2020 10:56:27 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
	Christian Lindig <christian.lindig@citrix.com>,
	Edwin =?utf-8?B?VMO2csO2aw==?= <edvin.torok@citrix.com>,
	Rob Hoes <Rob.Hoes@citrix.com>
Subject: Re: [PATCH 3/8] xen/domctl: Introduce and use
 XEN_DOMCTL_CDF_nested_virt
Message-ID: <20201001105627.4rckkcl67jbw4ekr@liuwe-devbox-debian-v2>
References: <20200930134248.4918-1-andrew.cooper3@citrix.com>
 <20200930134248.4918-4-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200930134248.4918-4-andrew.cooper3@citrix.com>
User-Agent: NeoMutt/20180716

On Wed, Sep 30, 2020 at 02:42:43PM +0100, Andrew Cooper wrote:
> Like other major areas of functionality, nested virt (or not) needs to be
> known at domain creation time for sensible CPUID handling, and wants to be
> known this early for sensible infrastructure handling in Xen.
> 
> Introduce XEN_DOMCTL_CDF_nested_virt and modify libxl to set it appropriately
> when creating domains.  There is no need to adjust the ARM logic to reject the
> use of this new flag.
> 
> No functional change yet.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Wei Liu <wl@xen.org>

