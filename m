Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 080CB5ADD96
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 04:53:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399336.640469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVOhp-00080T-Ji; Tue, 06 Sep 2022 02:52:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399336.640469; Tue, 06 Sep 2022 02:52:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVOhp-0007yg-Fh; Tue, 06 Sep 2022 02:52:53 +0000
Received: by outflank-mailman (input) for mailman id 399336;
 Tue, 06 Sep 2022 02:52:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CCHN=ZJ=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1oVOho-0007ya-9s
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 02:52:52 +0000
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [2607:f8b0:4864:20::b33])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe29c31b-2d8e-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 04:52:49 +0200 (CEST)
Received: by mail-yb1-xb33.google.com with SMTP id e126so8168606ybh.1
 for <xen-devel@lists.xenproject.org>; Mon, 05 Sep 2022 19:52:49 -0700 (PDT)
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
X-Inumbo-ID: fe29c31b-2d8e-11ed-af93-0125da4c0113
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=bfTltfO7WnxXTmI5aAqzYfltIOrisJOrfI2bushTDFg=;
        b=oQZCm5c+XeuESChEw7vC26nyp80dMgNSeJoZ2MyUMTnxbOdhwxSvMf0xZAvn2kULOk
         yRSHlBLomENOgAzikZCVJ+Z+Y68nQ9TCRMSmIImqkN5OxBDdKBqDQMcWK0KsD87gqHmk
         c72G3wN4sgUxMztCQOk4iLk2b5yFFRWHjSdvTWfMY6bTXYoukfYZzSxliskCxVNwKGFu
         6K64FM/Pdk73u1bZkOR2MFeANBCDF9VTVPwoD6neyj4HzDqx4Ll69ta2oI7ZpcymAbdt
         uIIdsjEz2x0HBow2e/rK2v5AbtWdtGpn5fv6sFYChWtI8qKPA1dxSRqHQgZ3qHSHmZF+
         flFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=bfTltfO7WnxXTmI5aAqzYfltIOrisJOrfI2bushTDFg=;
        b=2q6KbQjzUHJv3y4zv1Wb3B4iuh3NFhYFgq98yWXlP/ckvx4NlPvJehpeVQRSJ+12lo
         272ET1n2SyzrRWheIQyFGr+PioJxeVn3pcLtL1IIBL+B3QIHDOeXKDDatsOIPqMHiC7d
         AR/dnYVocf4ur0A6s7zITEGbStvwnzfwRlnfnJzRSLeDVArJ07dFOnQRwFoX1ik9jKrc
         C06S/Hm47q5hjR+CWYZjflmrHOl/8/ckb3GQv8C0LFTw+Gyrv8YuoXR5tk8SiON/WrCX
         rM1kKqdqCvY46tWnw1GIXi6k/DupS4YHQbUSiwpv2EAD+L5nfIOb9H0Mjyn0Ywkgaheh
         PLgQ==
X-Gm-Message-State: ACgBeo38/3chgOp54NZCYW76+TLN/rb+UdSoB3j5kI7Aga932j+7SEqV
	fj2XcLmesAKJaMNECk7aR+YSlQRFIhmeRPR6CNv8ZA==
X-Google-Smtp-Source: AA6agR539z3VV8b3kg6wBw2gnF6iTaaStugyNMDKRNSDRFkZ1ZlhhROmJ5Ul4fyfO9KSfcgQ1RwGtdYeWpgi9aGJ900=
X-Received: by 2002:a05:6902:572:b0:67c:2af2:3a75 with SMTP id
 a18-20020a056902057200b0067c2af23a75mr33501615ybt.346.1662432768468; Mon, 05
 Sep 2022 19:52:48 -0700 (PDT)
MIME-Version: 1.0
References: <Yv4DMuQHbGNhqAP4@leoy-yangtze.lan> <CAMj1kXHkWH7tkpuPLLjWszOVTQ-Cr3Zcbj8w0bogSd0Y_hso0g@mail.gmail.com>
 <99e460f1-ca5f-b520-69e0-b250915fd591@xen.org> <Yv5fii2GvIeHEHZX@leoy-yangtze.lan>
 <CAMj1kXGZ0ThmPT2FU4M07waB=Q9tXxs81TGTysV5dG5fm0D0Gw@mail.gmail.com>
 <871qtcsacd.wl-maz@kernel.org> <Ywcr1849LiEHezd3@leoy-huanghe>
 <12a8c169-55aa-5e9f-19f8-acd77ea2a8fe@xen.org> <YwdiDr2uLXGEl2TC@leoy-huanghe>
 <52f24132-ba2b-d4ab-ebd0-613f673b5658@xen.org> <YweJ6ZpRhMkT5bab@leoy-yangtze.lan>
In-Reply-To: <YweJ6ZpRhMkT5bab@leoy-yangtze.lan>
From: Leo Yan <leo.yan@linaro.org>
Date: Tue, 6 Sep 2022 10:52:37 +0800
Message-ID: <CALZQ+UN8cQ4avggxqgjed=DsitfEteQpuhEqb+p747vmeFCyUA@mail.gmail.com>
Subject: Re: [PATCH] xen/arm: acpi: Support memory reserve configuration table
To: Julien Grall <julien@xen.org>
Cc: Marc Zyngier <maz@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Jan Beulich <jbeulich@suse.com>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Rahul Singh <Rahul.Singh@arm.com>, 
	Peter Griffin <peter.griffin@linaro.org>, xen-devel <xen-devel@lists.xenproject.org>, 
	Julien Grall <jgrall@amazon.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 25, 2022 at 10:40:41PM +0800, Leo Yan wrote:

[...]

> > > But here I still cannot create the concept that how GIC RD tables play
> > > roles to support the para virtualization or passthrough mode.
> >
> > I am not sure what you are actually asking. The pending tables are just
> > memory you give to the GICv3 to record the state of the interrupts.
>
> For more specific, Xen has its own RD pending table, and we can use
> this pending table to set state for SGI/PPI/LPI for a specific CPU
> interface.  Xen works as hypervisor, it saves and restores the pending
> table according to switched in VM context, right?
>
> On the other hand, what's the purpose for Linux kernel's GIC RD
> pending table?  Is it only used for nested virtulisation?  I mean if
> Linux kernel's GIC RD pending table is not used for the drivers in
> Dom0 or DomU, then it's useless to pass it from the primary kernel to
> secondary kernel; as result, we don't need to reserve the persistent
> memory for the pending table in this case.

I don't receive further confirmation from Marc, anyway, I tried to cook
a kernel patch to mute the kernel oops [1].

Hope this is not too arbitrary and we can move forward a bit.

Thanks,
Leo

[1] https://lore.kernel.org/lkml/20220906024040.503764-1-leo.yan@linaro.org/T/#u

