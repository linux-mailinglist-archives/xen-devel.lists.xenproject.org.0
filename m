Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 793ED2CEC5B
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 11:41:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44352.79476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl8Wp-0003UY-LF; Fri, 04 Dec 2020 10:41:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44352.79476; Fri, 04 Dec 2020 10:41:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl8Wp-0003U9-I4; Fri, 04 Dec 2020 10:41:31 +0000
Received: by outflank-mailman (input) for mailman id 44352;
 Fri, 04 Dec 2020 10:41:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OO73=FI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kl8Wo-0003U1-3C
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 10:41:30 +0000
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fb43b1b6-09f0-4e33-961b-4c76a0077415;
 Fri, 04 Dec 2020 10:41:29 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id g185so6583971wmf.3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Dec 2020 02:41:29 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id h204sm2772306wme.17.2020.12.04.02.41.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 02:41:28 -0800 (PST)
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
X-Inumbo-ID: fb43b1b6-09f0-4e33-961b-4c76a0077415
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JzUvKkkB5zPz+M9oSf5zE+ISfTid8bcYA9Fpwf6hT6A=;
        b=Qu2z8vk1Zis4rL7v8yzsUvRgn6/pRwYvPXXOILKeZAYFLOAnGtL0kHDggF6eWZhCNh
         cdY1JHJB6BG6tcoW07wadaPKtu38i88xugIJtTVWLXuxSHZhlGsO4DzvcrsJTQhmbT2l
         ln8qsxjT9tfT2MSlw/ORrxrcB7FNN3Ellg3XHRC+ETUOv2a9g3SFtCpq1LHbdRJTtZct
         L+Pd/w/r0SXA3IrHgTXXB1xiLyH0M4u8AgwgWmsmJnOkuifaEI0r1XyZCk1GOwO1htO3
         u6RFxAua+wZFfvdKf+Pn2gnqW+w264ZY7eSxpfu+mzoCqBAdwWRrbXAuFrw14MfaWlnw
         PeBA==
X-Gm-Message-State: AOAM5303DTajaZ0iYx4nyg3oWX5d1q6/7dA3jWsAs00dtGmnuk57KEhJ
	/GKtDrNq8FpwEVEEuazAJvg=
X-Google-Smtp-Source: ABdhPJxfaVQLgz8YJPpsxaDMVgP8Ud6f3flhZmAxMl20YTnGBVuAQCbED6JDmyJIJFXA63Bqy9l99A==
X-Received: by 2002:a1c:f219:: with SMTP id s25mr3487486wmc.67.1607078488618;
        Fri, 04 Dec 2020 02:41:28 -0800 (PST)
Date: Fri, 4 Dec 2020 10:41:26 +0000
From: Wei Liu <wl@xen.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, cardoe@cardoe.com, wl@xen.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 00/12] automation: improvements (mostly) for arm64
Message-ID: <20201204104126.liw4lt7vkvup5g2j@liuwe-devbox-debian-v2>
References: <alpine.DEB.2.21.2011241722540.7979@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2011241722540.7979@sstabellini-ThinkPad-T480s>
User-Agent: NeoMutt/20180716

On Tue, Nov 24, 2020 at 08:27:21PM -0800, Stefano Stabellini wrote:
> Hi all,
> 
> This series does a few things:
> 
> 1) it introduces a simple Xen arm64 dom0less smoke test based on QEMU
> 2) it introduces alpine linux builds x86 and arm64
> 3) it introduces two tests artifacts containers
> 4) it uses said artifacts to create a dom0/domU arm64 test based on QEMU
> 
> The series is v3, but in reality only 1) above was sent out before (the
> first two patches). Everything else is new. All tests succeed currently.
> 

Acked-by: Wei Liu <wl@xen.org>

