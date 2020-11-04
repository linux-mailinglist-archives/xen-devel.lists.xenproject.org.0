Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB0C2A63D2
	for <lists+xen-devel@lfdr.de>; Wed,  4 Nov 2020 13:01:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.19059.44268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaHTH-00076N-KG; Wed, 04 Nov 2020 12:00:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19059.44268; Wed, 04 Nov 2020 12:00:59 +0000
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
	id 1kaHTH-00075x-H9; Wed, 04 Nov 2020 12:00:59 +0000
Received: by outflank-mailman (input) for mailman id 19059;
 Wed, 04 Nov 2020 12:00:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vd1q=EK=gmail.com=wei.liu.linux@srs-us1.protection.inumbo.net>)
 id 1kaHTG-00075s-Nx
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 12:00:58 +0000
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c3e54468-407c-4c65-a638-e253e76eee06;
 Wed, 04 Nov 2020 12:00:57 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id c17so2390184wrc.11
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2020 04:00:57 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id t199sm1871437wmt.46.2020.11.04.04.00.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 04:00:56 -0800 (PST)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Vd1q=EK=gmail.com=wei.liu.linux@srs-us1.protection.inumbo.net>)
	id 1kaHTG-00075s-Nx
	for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 12:00:58 +0000
X-Inumbo-ID: c3e54468-407c-4c65-a638-e253e76eee06
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id c3e54468-407c-4c65-a638-e253e76eee06;
	Wed, 04 Nov 2020 12:00:57 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id c17so2390184wrc.11
        for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2020 04:00:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QUSmpWIO++p+EaBmzWHWB9j11K6ZCt/BSPj+8TR1MOs=;
        b=D9MuESqjHpowOfsrDMcQbbWJN04gOFzE8gcX3zYv8JgQl+0Jfap1n95KvENC3AKKmt
         eOIEIhvK+DjzbHrM/0uNF04GWz9uoHtAhTp24XGuW8596eKyQAui8csKt01lSvAyNZvv
         rqBecy1dGNnVMesusVUNS42izR2Atqccowzm7/mdRw0esoRG/L4o/TLc3OlOihw+Ug+A
         UHSTGsl5q0l2ajeup5cymWwqu1q1O/5tjGJl32eOJMr8oZx7o11dhqlcUnIy50UK+pWX
         Q62/vlnGFGUT7/rs39O6fQMwX2mIEH74F5IMMlHsQ0vk8mMeS5xaE4JtmMbAx17Gwix7
         +iYg==
X-Gm-Message-State: AOAM533k/PK5wYuv06vgtzPqdZU7B/w5tPPdd0MMgWn/hyL5vjiy0SHR
	eUUm6H5o9ByPtzcu5C4O/kg=
X-Google-Smtp-Source: ABdhPJyP8064AZcp00/CMnWH1Yf6wcBkvvv9giu/iKtPrEyY0N09EFUoBTXsieznUVpGwXIewZnkPQ==
X-Received: by 2002:a5d:4148:: with SMTP id c8mr31429901wrq.261.1604491256613;
        Wed, 04 Nov 2020 04:00:56 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id t199sm1871437wmt.46.2020.11.04.04.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 04:00:56 -0800 (PST)
Date: Wed, 4 Nov 2020 12:00:54 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Lee Jones <lee.jones@linaro.org>
Cc: davem@davemloft.net, kuba@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Wei Liu <wei.liu@kernel.org>, Paul Durrant <paul@xen.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Rusty Russell <rusty@rustcorp.com.au>,
	xen-devel@lists.xenproject.org, netdev@vger.kernel.org,
	bpf@vger.kernel.org
Subject: Re: [PATCH 05/12] net: xen-netback: xenbus: Demote nonconformant
 kernel-doc headers
Message-ID: <20201104120054.jaukbhblpooi5hwf@liuwe-devbox-debian-v2>
References: <20201104090610.1446616-1-lee.jones@linaro.org>
 <20201104090610.1446616-6-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201104090610.1446616-6-lee.jones@linaro.org>
User-Agent: NeoMutt/20180716

On Wed, Nov 04, 2020 at 09:06:03AM +0000, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/net/xen-netback/xenbus.c:419: warning: Function parameter or member 'dev' not described in 'frontend_changed'
>  drivers/net/xen-netback/xenbus.c:419: warning: Function parameter or member 'frontend_state' not described in 'frontend_changed'
>  drivers/net/xen-netback/xenbus.c:1001: warning: Function parameter or member 'dev' not described in 'netback_probe'
>  drivers/net/xen-netback/xenbus.c:1001: warning: Function parameter or member 'id' not described in 'netback_probe'
> 
> Cc: Wei Liu <wei.liu@kernel.org>

If this is ever needed:

Acked-by: Wei Liu <wei.liu@kernel.org>

