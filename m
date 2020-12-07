Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2737F2D14BF
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 16:33:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46741.82858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmIW6-0003m8-Qj; Mon, 07 Dec 2020 15:33:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46741.82858; Mon, 07 Dec 2020 15:33:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmIW6-0003lj-NW; Mon, 07 Dec 2020 15:33:34 +0000
Received: by outflank-mailman (input) for mailman id 46741;
 Mon, 07 Dec 2020 15:33:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oN+h=FL=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kmIW5-0003ld-50
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 15:33:33 +0000
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9c2e97f0-2e16-47dd-a0fb-bbd46a3922d5;
 Mon, 07 Dec 2020 15:33:32 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id c198so11857988wmd.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Dec 2020 07:33:32 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id a18sm15233911wrr.20.2020.12.07.07.33.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 07:33:31 -0800 (PST)
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
X-Inumbo-ID: 9c2e97f0-2e16-47dd-a0fb-bbd46a3922d5
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/HxYlJEEENpDYaot1R/O+4+FQN37quWrxjN1IR1VJUQ=;
        b=YAJLB64u6Q7+Pv8Hi9Tr0EMV7plx42pFLqbdy5Bd5TNe90Z1fJ8PthcjzybZjfW0ct
         Wrf5/XYGDMqaDASada4YM+3d2t+8vxsM4ULoXtYvuA9NJuX6WcHkk76QlPLCBUF2mnxV
         k0Y0PcokYSjpG8b1TMztmNYF5zvV5ocMvZ6uHKgttw4E5DSZz452uTqfWia6zvpdlctL
         n36ufBt15H0D9LQxZ2xHyLgsW6pAFe/ttBM73SJN+fOl/cpdHuFn/YOWI8aKT/Mi6g7p
         WlH6iF6Tdx2YlxMIkhElAASEHppFwW/qm3vcsld9TsWJMkBCh57dOqkMDu5muwxHOcEz
         2jmg==
X-Gm-Message-State: AOAM532U4Snbozp0lXrSHH1jt0rxYyA/WXG5eAEEpPPLNjioQTQidg5n
	qegbocarkumoS9/aDVnV93E=
X-Google-Smtp-Source: ABdhPJyT3dQFlVgiBtIPM5ATmTNbcOgPSUqD6V60isObtFlwmYfe1T8rxfm8l9/SEiTyc9Aqf/d8qg==
X-Received: by 2002:a1c:f405:: with SMTP id z5mr18893330wma.93.1607355211586;
        Mon, 07 Dec 2020 07:33:31 -0800 (PST)
Date: Mon, 7 Dec 2020 15:33:29 +0000
From: Wei Liu <wl@xen.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, cardoe@cardoe.com, wl@xen.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 0/2] automation: arm64 dom0less smoke test
Message-ID: <20201207153329.fl4ovssvnhv3kwqc@liuwe-devbox-debian-v2>
References: <alpine.DEB.2.21.2011161927120.20906@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2011161927120.20906@sstabellini-ThinkPad-T480s>
User-Agent: NeoMutt/20180716

On Mon, Nov 16, 2020 at 08:21:18PM -0800, Stefano Stabellini wrote:
> Hi all,
> 
> This short series introduces a very simple Xen Dom0less smoke test based
> on qemu-system-aarch64 to be run as part of the gitlab CI-loop. It
> currently passes on staging.
> 
> Cheers,
> 
> Stefano
> 
> 
> Changes in v2:
> - use the Debian kernel for testing instead of building your own
> - fix x86_32 build
> 
> 
> Stefano Stabellini (2):
>       automation: add a QEMU aarch64 smoke test
>       automation: add dom0less to the QEMU aarch64 smoke test

Acked-by: Wei Liu <wl@xen.org>

